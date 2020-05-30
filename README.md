### api-list
---
基于SpringBoot+BootStrap等，对网上一些免费API接口进行整合调用

#### 技术点
1. jquery
2. ajax
3. bootstrap
4. MySQL
5. Spring Boot
6. freemarker模板引擎技术
7. Redis

#### 功能点
1. bootstrap+freemarker搭建简单页面
2. ajax异步发送请求
3. MySQL存储管理API详细信息
4. Redis存储每个用户对所有API的当日可访问次数，做计数使用
5. 以客户端IP作为用户的唯一标识
6. 以Spring Boot为基础编写后端代码，后端统一返回模型视图和访问相关API后获得的JSON数据
7. AOP统一管理后端异常，以AOP的方式完成Redis计数
8. 为了不将API信息直接暴露给用户，所有API的访问均在后端通过SpringBoot的RESTTemplement发送请求来完成，前端只需传入对应API的id值即可

#### 部分界面展示
