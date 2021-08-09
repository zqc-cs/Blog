# 小型博客开发

### 一. 开发环境

- Mac OS
- Eclipse

### 二. 用到技术

- jsp
- Servlet
- 数据库连接池

### 三. 功能

- 支持登陆、注册功能
- 在主页可看到不同用户发的帖子
- 使用百度的富文本编辑器，支持帖子在线发布。帖子数据存储在数据库中，只有点击链接才会从数据库获取相应的数据并通过`template.jsp`渲染呈现。如下:

<img src="/Users/aa/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2021-08-09%20%E4%B8%8B%E5%8D%884.22.32.png" alt="截屏2021-08-09 下午4.22.32" style="zoom:50%;" />

发布帖子如下:

<img src="/Users/aa/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2021-08-09%20%E4%B8%8B%E5%8D%884.24.19.png" alt="截屏2021-08-09 下午4.24.19" style="zoom:50%;" />

在主页可看到新帖子:

<img src="/Users/aa/Library/Application%20Support/typora-user-images/%E6%88%AA%E5%B1%8F2021-08-09%20%E4%B8%8B%E5%8D%884.28.43.png" alt="截屏2021-08-09 下午4.28.43" style="zoom:50%;" />

### 四. 说明

​	这个项目参考了<<JavaEE 编程及应用开发>>。当时想写一个自己的博客，但不了解前沿技术，用的框架很老旧，只能当个玩具。之后学业比较忙，就没再继续完善。