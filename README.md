# 这是什么?
  ## B站机器人脚本,如果有用户@了机器人的账号,机器人就会按照代码回复
# 实现原理
  ## 一直向B站的@通知api发送请求,如果用户@的内容符合代码写的情况,便会调用B站api来回复,虽然只可以回复(其他功能有空我会继续做),但可以在本地利用用户@的内容干很多事
# 如何安装?
  ## 下载main.py,然后根据main.py内的import安装python模块
  ## 或``````pip install requests``````以及``````pip install pymysql``````
  ### 当然,您也需要先配置好您的数据库,我推荐将数据库的字符编码改为utf8mb4,因为用户会输入emoji,而utf8无法显示emoji(根本无法储存在数据库中),本项目也提供了示例的数据库文件(omg_replys.sql)
# 使用例
  ![](https://github.com/hutaoloveu/bilibili-bot-example/blob/main/QQ%E6%88%AA%E5%9B%BE20220115023005.png)  
  ### 可以看到机器人成功识别了查重内容并回复
  ![](https://github.com/hutaoloveu/bilibili-bot-example/blob/main/QQ%E6%88%AA%E5%9B%BE20220115023321.png) 
  ### 在其他人的评论下@机器人也可以查重!
 
# 基于本项目还可以魔改出很多其他功能的机器人!
