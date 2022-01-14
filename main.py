import requests
import time
import json
import pymysql

# 本脚本示例是"枝网查重"机器人,效果请看github页面,你也可以在本脚本的基础上大量删改做出一个新脚本,欢迎加一些分叉
# 由于经历了一个大版本迭代,删除了无用的代码,但仍有残留,删改时请谨慎
# 某些地方的代码可能过于臃肿,但是能跑起来就行了:) 作者本人没有太多的时间去改代码,欢迎大家来pull,有问题可以提个issues
# 脚本的变量名以及排版非常混乱,如果再过几个月我可能都会不知道什么意思,所以大家最好改一下变量名和排版方便阅读
# 用到的php接口和mysql示例文件会放到github上
# 改好之后我直接上传到了github,没有经过任何测试,出现问题请联系我

def getmsgs():
    # 设置cookie,填自己账号的
    cookie = {
        "Cookie": ""}
    while True:
        time.sleep(3)  # 防止B站风控系统封ip,有条件可以使用ip池来请求
        star_num = 0 # 用来解析数组,最好不要动
        getmsgapi = requests.get("https://api.bilibili.com/x/msgfeed/at?build=0&mobi_app=web", headers=cookie)
        resp = getmsgapi.json()
        if resp['code'] == 0:
            print("连接api成功！")
            while True:
                print("第" + str(star_num) + "个数组") # 其实大部分的print都可以删掉,但请注意关于防止报错的请谨慎删除
                print(resp['data']['items'][star_num]['user']['nickname'] + "艾特了机器人")
                if resp['data']['items'][star_num]['item']['source_content'] == "":
                    print("这个数组的内容是空的(?),重新查询")
                    getmsgs()
                else:
                    cxhas = cxhas_this_id(resp['data']['items'][star_num]['id'])
                    if cxhas == "数据存在,停止执行":
                        print("因为数据存在,所以重新查询")
                        getmsgs()
                    else:
                        print("这条数据不在数据库,继续执行")
                atwhat = str(resp['data']['items'][star_num]['item']['source_content'])
                if not resp['data']['items'][star_num]['item']['target_id'] == 0: # 如果有target id的话
                    atwhatend = str(resp['data']['items'][star_num]['item']['title'])# 某些特殊情况下@的内容会在标题上,也就是回复中的@
                else:
                    atwhatend = atwhat.split('查重')[-1]
                getcx = cx_cnki(atwhatend)
                if getcx == "调用枝网查询api时出现了错误,停止执行":
                    print("调用枝网查询api时出现了错误,重新查询")
                    getmsgs()
                else:
                    iaa = 0 # 删了之后需要重新排版
                retype = oid = resp['data']['items'][star_num]['item']['business_id'] # 谁知道这是什么?但直觉告诉我不能随便删
                cflendd = getcx
                oid = resp['data']['items'][star_num]['item']['subject_id']
                root = resp['data']['items'][star_num]['item']['source_id']
                csrf = "2b887374d50c7e817842431c9bcb017c"
                atname = resp['data']['items'][star_num]['user']['nickname']
                get_fs_msg = getaddmsg(retype, oid, root, cflendd, csrf, cookie, atname)
                if get_fs_msg == "发送消息失败":
                    print("调用B站api发送回复时出现错误,重新查询")
                    getmsgs()
                else:
                    # 下方都是编写好要写入数据库的数据和调用函数
                    at_time = resp['data']['items'][star_num]['at_time']
                    timear = time.localtime(at_time)
                    attime = time.strftime("%Y年%m月%d日%H:%M:%S", timear)
                    getid = resp['data']['items'][star_num]['id']
                    gettype = resp['data']['items'][star_num]['item']['type']
                    gettitle = resp['data']['items'][star_num]['item']['title']
                    geturl = resp['data']['items'][star_num]['item']['uri']
                    getsorid = resp['data']['items'][star_num]['item']['source_id']
                    getsorct = resp['data']['items'][star_num]['item']['source_content']
                    getatuid = resp['data']['items'][star_num]['user']['mid']
                    getatname = resp['data']['items'][star_num]['user']['nickname']
                    getrpct = getcx
                    setsqls(attime, at_time, getid, gettype, gettitle, geturl, getsorid, getsorct, getatuid, getatname,
                            getrpct)
                    getmsgs()

        else:
            print("连接api失败，请检查cookie")


def cxhas_this_id(id):
    cxid = str(id)
    cxidget = requests.get("http://127.0.0.1/hasrp.php?setstr=" + str(cxid)) #这里用于检测该评论是否存在数据库(是否被机器人回复过了)
    cxidget_re = cxidget.json()
    if cxidget_re['code'] == "404":
        return ('数据不存在,继续执行')
    else:
        return ('数据存在,停止执行')


def cx_cnki(text):
    cxtext = text
    # 编写要post的数据
    cheakhead = {"Content-Type": "Content-Type: application/json"}
    cheakdatas = {"text": cxtext}
    getcheakdp = requests.post("https://asoulcnki.asia/v1/api/check", headers=cheakhead, data=json.dumps(cheakdatas)) # 向枝网查重api发送请求
    cheakdprep = getcheakdp.json()
    if cheakdprep['code'] == 0:
        cfl = str(float(cheakdprep['data']['rate']) * 100)
        cflend = cfl[0:5] + "%"
        return cflend
    else:
        return ("调用枝网查询api时出现了错误,停止执行")


def getaddmsg(retype, oid, root, cflendd, csrf, cookie, at_name):
    # 要post的数据
    repdatas = {"oid": oid, "type": retype, "root": root, "parent": root, "message": "@" + at_name + " 重复率:" + cflendd,
                "plat": "1",
                "ordering": "time", "jsonp": "jsonp", "csrf": csrf}
    addmsg = requests.post("https://api.bilibili.com/x/v2/reply/add", headers=cookie, data=repdatas) # 调用B站api发送回复
    addmsg_re = addmsg.json()
    if addmsg_re['code'] == 0:
        print("发送回复成功,发送内容:" + addmsg_re['data']['reply']['content']['message'])
        return ("发送消息成功")
    else:
        return ("发送消息失败")


def setsqls(attime, unix_time, atid, type, title, url, sor_id, content, atuid, atname, rep_ct):
    db = pymysql.connect(host='localhost',
                         user='botadmin',
                         password='botadminpass',
                         database='bilibili_bot',
                         charset='utf8mb4')
    # 这里的数据库信息自行更改,但charset 也就是字符集我推荐使用utf8mb4,因为用户的艾特信息可能会有emoji,utf8字符集无法表示emoji
    cursor = db.cursor()
    # 下面是将接收到的数据全部转换为字符串,因为我偷懒将数据表的所有字段设置为了varchar,如果你有耐心的话可以自行更改
    at_time = str(attime) # 艾特机器人的具体时间可阅读格式
    at_unix_time = str(unix_time) # 艾特机器人的具体时间时间戳
    at_id = str(atid) # 每个评论(大概)会有一个独一无二的id
    at_type = str(type) # 艾特的类型,我目前只见过reply
    at_title = str(title) # 艾特机器人评论的标题
    at_sor_id = str(sor_id) # 可能和atid的作用一样
    at_content = str(content) # 艾特机器人评论的内容
    atman_uid = str(atuid) # 艾特机器人的用户的uid
    atman_name = str(atname) # 艾特机器人的用户的用户名
    reply_count = str(rep_ct) # 枝网查询返回的查重率
    at_url = str(url + "#reply" + at_sor_id) # 拼接回复地址的url,拼接好后可以直接访问链接到艾特机器人的具体评论下
    cursor.execute( # 将数据插入数据库
        "INSERT INTO `omg_replys` (`at_time`, `at_unix_time`, `at_id`, `at_type`, `at_title`, `at_url`, `at_sor_id`, `at_content`, `atman_uid`, `atman_name`, `reply_count`) VALUES ('" + at_time + "', '" + at_unix_time + "', '" + at_id + "', '" + at_type + "', '" + at_title + "', '" + at_url + "', '" + at_sor_id + "', '" + at_content + "', '" + atman_uid + "', '" + atman_name + "', '" + reply_count + "');")


if __name__ == '__main__':
    getmsgs()