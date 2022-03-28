[33mcommit f9f10c42c401e835b5eccc36c0a9e18b9f7a2685[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: xiaowangtongxue22 <2047134743@qq.com>
Date:   Mon Mar 28 08:42:33 2022 +0800

    Create vcs.xml
    
    666

[1mdiff --git a/api/v1/article.go b/api/v1/article.go[m
[1mnew file mode 100644[m
[1mindex 0000000..b7b1f99[m
[1m--- /dev/null[m
[1m+++ b/api/v1/article.go[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mpackage v1[m
[1mdiff --git a/api/v1/category.go b/api/v1/category.go[m
[1mnew file mode 100644[m
[1mindex 0000000..b7b1f99[m
[1m--- /dev/null[m
[1m+++ b/api/v1/category.go[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mpackage v1[m
[1mdiff --git a/api/v1/login.go b/api/v1/login.go[m
[1mnew file mode 100644[m
[1mindex 0000000..b7b1f99[m
[1m--- /dev/null[m
[1m+++ b/api/v1/login.go[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mpackage v1[m
[1mdiff --git a/api/v1/user.go b/api/v1/user.go[m
[1mnew file mode 100644[m
[1mindex 0000000..490a3d6[m
[1m--- /dev/null[m
[1m+++ b/api/v1/user.go[m
[36m@@ -0,0 +1,30 @@[m
[32m+[m[32mpackage v1[m
[32m+[m
[32m+[m[32mimport "github.com/gin-gonic/gin"[m
[32m+[m
[32m+[m[32m//查询用户是否存在[m
[32m+[m[32mfunc UserExist(c *gin.Context) {[m
[32m+[m	[32m//[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m//添加用户[m
[32m+[m[32mfunc AddUser(c *gin.Context) {[m
[32m+[m	[32m//todo[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m//查询单个用户[m
[32m+[m
[32m+[m[32m//查询用户列表[m
[32m+[m[32mfunc GetUsers(c *gin.Context) {[m
[32m+[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m//编辑用户[m
[32m+[m[32mfunc EditUser(c *gin.Context) {[m
[32m+[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m//删除用户[m
[32m+[m[32mfunc DeleteUser(c *gin.Context) {[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/go.mod b/go.mod[m
[1mindex 4e7e825..4c24d63 100644[m
[1m--- a/go.mod[m
[1m+++ b/go.mod[m
[36m@@ -4,14 +4,14 @@[m [mgo 1.18[m
 [m
 require ([m
 	github.com/gin-gonic/gin v1.7.7[m
[32m+[m	[32mgithub.com/go-sql-driver/mysql v1.6.0[m
[32m+[m	[32mgorm.io/driver/mysql v1.3.2[m
 	gorm.io/gorm v1.23.3[m
 )[m
 [m
 require ([m
[31m-	github.com/go-sql-driver/mysql v1.6.0 // indirect[m
 	github.com/jinzhu/inflection v1.0.0 // indirect[m
 	github.com/jinzhu/now v1.1.5 // indirect[m
[31m-	gorm.io/driver/mysql v1.3.2 // indirect[m
 )[m
 [m
 require ([m
[1mdiff --git a/routes/router.go b/routes/router.go[m
[1mindex 0d78804..3b18421 100644[m
[1m--- a/routes/router.go[m
[1m+++ b/routes/router.go[m
[36m@@ -1,9 +1,9 @@[m
 package routes[m
 [m
 import ([m
[32m+[m	[32m"ginblog/api/v1"[m
 	"ginblog/utils"[m
 	"github.com/gin-gonic/gin"[m
[31m-	"net/http"[m
 )[m
 [m
 // InitRouter 入口路由[m
[36m@@ -12,11 +12,15 @@[m [mfunc InitRouter() {[m
 	r := gin.Default()[m
 	router := r.Group("api/v1")[m
 	{[m
[31m-		router.GET("hello", func(c *gin.Context) {[m
[31m-			c.JSON(http.StatusOK, gin.H{[m
[31m-				"msg": "ok",[m
[31m-			})[m
[31m-		})[m
[32m+[m		[32m//用户模块路由[m
[32m+[m		[32mrouter.POST("user/add", v1.AddUser)[m
[32m+[m		[32mrouter.GET("users", v1.GetUsers)[m
[32m+[m		[32mrouter.PUT("user/:id", v1.EditUser)[m
[32m+[m		[32mrouter.DELETE("user/:id", v1.DeleteUser)[m
[32m+[m
[32m+[m		[32m//分类模块路由[m
[32m+[m		[32m//文章模块路由[m
[32m+[m
 	}[m
 [m
 	r.Run(utils.HttpPort)[m
[1mdiff --git a/utils/errmsg/errmsg.go b/utils/errmsg/errmsg.go[m
[1mnew file mode 100644[m
[1mindex 0000000..cccb5f6[m
[1m--- /dev/null[m
[1m+++ b/utils/errmsg/errmsg.go[m
[36m@@ -0,0 +1,35 @@[m
[32m+[m[32mpackage errmsg[m
[32m+[m
[32m+[m[32mconst ([m
[32m+[m	[32mSUCCESS = 200[m
[32m+[m	[32mERROR   = 500[m
[32m+[m
[32m+[m	[32m//code=1000+ 用户模块错误[m
[32m+[m
[32m+[m	[32mERROR_USERNAME_USED    = 1001[m
[32m+[m	[32mERROR_PASSWORD_ERROR   = 1002[m
[32m+[m	[32mERROR_USER_NOT_EXIST   = 1003[m
[32m+[m	[32mERROR_TOKEN_EXIST      = 1004[m
[32m+[m	[32mERROR_TOKEN_RUNTIME    = 1005[m
[32m+[m	[32mERROR_TOKEN_WRONG      = 1006[m
[32m+[m	[32mERROR_TOKEN_TYPE_WRONG = 1007[m
[32m+[m	[32m//code=2000+ 文章模块错误[m
[32m+[m
[32m+[m	[32m//code=3000+ 分类模块错误[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32mvar codeMsg = map[int]string{[m
[32m+[m	[32mSUCCESS:                "OK",[m
[32m+[m	[32mERROR:                  "FAIL",[m
[32m+[m	[32mERROR_USERNAME_USED:    "用户名已存在",[m
[32m+[m	[32mERROR_PASSWORD_ERROR:   "密码错误",[m
[32m+[m	[32mERROR_USER_NOT_EXIST:   "用户不存在",[m
[32m+[m	[32mERROR_TOKEN_EXIST:      "TOKEN不存在",[m
[32m+[m	[32mERROR_TOKEN_RUNTIME:    "TOKEN已过期",[m
[32m+[m	[32mERROR_TOKEN_WRONG:      "TOKEN错误",[m
[32m+[m	[32mERROR_TOKEN_TYPE_WRONG: "TOKEN类型错误",[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mfunc GetMsg(code int) string {[m
[32m+[m	[32mreturn codeMsg[code][m
[32m+[m[32m}[m

[33mcommit fb2ecddee9df9312f98eda25a1b4856d34a0519e[m
Author: xiaowangtongxue22 <2047134743@qq.com>
Date:   Sun Mar 27 11:26:47 2022 +0800

    Create vcs.xml
    
    666

[1mdiff --git a/.idea/vcs.xml b/.idea/vcs.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..94a25f7[m
[1m--- /dev/null[m
[1m+++ b/.idea/vcs.xml[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<project version="4">[m
[32m+[m[32m  <component name="VcsDirectoryMappings">[m
[32m+[m[32m    <mapping directory="$PROJECT_DIR$" vcs="Git" />[m
[32m+[m[32m  </component>[m
[32m+[m[32m</project>[m
\ No newline at end of file[m

[33mcommit dece61a926e36ad75b637425babdf613094bb59a[m[33m ([m[1;31morigin/学习[m[33m, [m[1;32m学习[m[33m)[m
Author: xiaowangtongxue22 <2047134743@qq.com>
Date:   Sun Mar 27 00:09:23 2022 +0800

    学习gin框架第二天

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..66fd13c[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,15 @@[m
[32m+[m[32m# Binaries for programs and plugins[m
[32m+[m[32m*.exe[m
[32m+[m[32m*.exe~[m
[32m+[m[32m*.dll[m
[32m+[m[32m*.so[m
[32m+[m[32m*.dylib[m
[32m+[m
[32m+[m[32m# Test binary, built with `go test -c`[m
[32m+[m[32m*.test[m
[32m+[m
[32m+[m[32m# Output of the go coverage tool, specifically when used with LiteIDE[m
[32m+[m[32m*.out[m
[32m+[m
[32m+[m[32m# Dependency directories (remove the comment below to include it)[m
[32m+[m[32m# vendor/[m
[1mdiff --git a/.idea/.gitignore b/.idea/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..35410ca[m
[1m--- /dev/null[m
[1m+++ b/.idea/.gitignore[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32m# 默认忽略的文件[m
[32m+[m[32m/shelf/[m
[32m+[m[32m/workspace.xml[m
[32m+[m[32m# 基于编辑器的 HTTP 客户端请求[m
[32m+[m[32m/httpRequests/[m
[32m+[m[32m# Datasource local storage ignored files[m
[32m+[m[32m/dataSources/[m
[32m+[m[32m/dataSources.local.xml[m
[1mdiff --git a/.idea/.name b/.idea/.name[m
[1mnew file mode 100644[m
[1mindex 0000000..b5770f1[m
[1m--- /dev/null[m
[1m+++ b/.idea/.name[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mginblog[m
\ No newline at end of file[m
[1mdiff --git a/.idea/dataSources.xml b/.idea/dataSources.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..2576d59[m
[1m--- /dev/null[m
[1m+++ b/.idea/dataSources.xml[m
[36m@@ -0,0 +1,19 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<project version="4">[m
[32m+[m[32m  <component name="DataSourceManagerImpl" format="xml" multifile-model="true">[m
[32m+[m[32m    <data-source source="LOCAL" name="@localhost" uuid="a0e262b7-d70c-4b58-a9c8-1f7f65cc430d">[m
[32m+[m[32m      <driver-ref>mysql.8</driver-ref>[m
[32m+[m[32m      <synchronize>true</synchronize>[m
[32m+[m[32m      <jdbc-driver>com.mysql.cj.jdbc.Driver</jdbc-driver>[m
[32m+[m[32m      <jdbc-url>jdbc:mysql://localhost:3306</jdbc-url>[m
[32m+[m[32m      <working-dir>$ProjectFileDir$</working-dir>[m
[32m+[m[32m    </data-source>[m
[32m+[m[32m    <data-source source="LOCAL" name="@localhost [2]" uuid="5fef3f07-d541-487d-abce-c16eaf7697ed">[m
[32m+[m[32m      <driver-ref>mysql.8</driver-ref>[m
[32m+[m[32m      <synchronize>true</synchronize>[m
[32m+[m[32m      <jdbc-driver>com.mysql.cj.jdbc.Driver</jdbc-driver>[m
[32m+[m[32m      <jdbc-url>jdbc:mysql://localhost:3306</jdbc-url>[m
[32m+[m[32m      <working-dir>$ProjectFileDir$</working-dir>[m
[32m+[m[32m    </data-source>[m
[32m+[m[32m  </component>[m
[32m+[m[32m</project>[m
\ No newline at end of file[m
[1mdiff --git a/.idea/ginblog.iml b/.idea/ginblog.iml[m
[1mnew file mode 100644[m
[1mindex 0000000..9be2e12[m
[1m--- /dev/null[m
[1m+++ b/.idea/ginblog.iml[m
[36m@@ -0,0 +1,10 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<module type="WEB_MODULE" version="4">[m
[32m+[m[32m  <component name="Go" enabled="true" />[m
[32m+[m[32m  <component name="NewModuleRootManager">[m
[32m+[m[32m    <content url="file://$MODULE_DIR$" />[m
[32m+[m[32m    <orderEntry type="inheritedJdk" />[m
[32m+[m[32m    <orderEntry type="sourceFolder" forTests="false" />[m
[32m+[m[32m    <orderEntry type="module" module-name="ini.v1@v1.57.0" />[m
[32m+[m[32m  </component>[m
[32m+[m[32m</module>[m
\ No newline at end of file[m
[1mdiff --git a/.idea/modules.xml b/.idea/modules.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..13ea923[m
[1m--- /dev/null[m
[1m+++ b/.idea/modules.xml[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<project version="4">[m
[32m+[m[32m  <component name="ProjectModuleManager">[m
[32m+[m[32m    <modules>[m
[32m+[m[32m      <module fileurl="file://$PROJECT_DIR$/.idea/ginblog.iml" filepath="$PROJECT_DIR$/.idea/ginblog.iml" />[m
[32m+[m[32m      <module fileurl="file://$PROJECT_DIR$/../../../../pkg/mod/gopkg.in/ini.v1@v1.57.0/.idea/ini.v1@v1.57.0.iml" filepath="$PROJECT_DIR$/../../../../pkg/mod/gopkg.in/ini.v1@v1.57.0/.idea/ini.v1@v1.57.0.iml" />[m
[32m+[m[32m    </modules>[m
[32m+[m[32m  </component>[m
[32m+[m[32m</project>[m
\ No newline at end of file[m
[1mdiff --git a/LICENSE b/LICENSE[m
[1mnew file mode 100644[m
[1mindex 0000000..f736c5b[m
[1m--- /dev/null[m
[1m+++ b/LICENSE[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32mMIT License[m
[32m+[m
[32m+[m[32mCopyright (c) 2022 小王同学[m
[32m+[m
[32m+[m[32mPermission is hereby granted, free of charge, to any person obtaining a copy[m
[32m+[m[32mof this software and associated documentation files (the "Software"), to deal[m
[32m+[m[32min the Software without restriction, including without limitation the rights[m
[32m+[m[32mto use, copy, modify, merge, publish, distribute, sublicense, and/or sell[m
[32m+[m[32mcopies of the Software, and to permit persons to whom the Software is[m
[32m+[m[32mfurnished to do so, subject to the following conditions:[m
[32m+[m
[32m+[m[32mThe above copyright notice and this permission notice shall be included in all[m
[32m+[m[32mcopies or substantial portions of the Software.[m
[32m+[m
[32m+[m[32mTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR[m
[32m+[m[32mIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,[m
[32m+[m[32mFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE[m
[32m+[m[32mAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER[m
[32m+[m[32mLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,[m
[32m+[m[32mOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE[m
[32m+[m[32mSOFTWARE.[m
[1mdiff --git a/README.en.md b/README.en.md[m
[1mnew file mode 100644[m
[1mindex 0000000..ccdbb3c[m
[1m--- /dev/null[m
[1m+++ b/README.en.md[m
[36m@@ -0,0 +1,36 @@[m
[32m+[m[32m# ginblog[m
[32m+[m
[32m+[m[32m#### Description[m
[32m+[m[32mgin+vue全栈制作博客[m
[32m+[m
[32m+[m[32m#### Software Architecture[m
[32m+[m[32mSoftware architecture description[m
[32m+[m
[32m+[m[32m#### Installation[m
[32m+[m
[32m+[m[32m1.  xxxx[m
[32m+[m[32m2.  xxxx[m
[32m+[m[32m3.  xxxx[m
[32m+[m
[32m+[m[32m#### Instructions[m
[32m+[m
[32m+[m[32m1.  xxxx[m
[32m+[m[32m2.  xxxx[m
[32m+[m[32m3.  xxxx[m
[32m+[m
[32m+[m[32m#### Contribution[m
[32m+[m
[32m+[m[32m1.  Fork the repository[m
[32m+[m[32m2.  Create Feat_xxx branch[m
[32m+[m[32m3.  Commit your code[m
[32m+[m[32m4.  Create Pull Request[m
[32m+[m
[32m+[m
[32m+[m[32m#### Gitee Feature[m
[32m+[m
[32m+[m[32m1.  You can use Readme\_XXX.md to support different languages, such as Readme\_en.md, Readme\_zh.md[m
[32m+[m[32m2.  Gitee blog [blog.gitee.com](https://blog.gitee.com)[m
[32m+[m[32m3.  Explore open source project [https://gitee.com/explore](https://gitee.com/explore)[m
[32m+[m[32m4.  The most valuable open source project [GVP](https://gitee.com/gvp)[m
[32m+[m[32m5.  The manual of Gitee [https://gitee.com/help](https://gitee.com/help)[m
[32m+[m[32m6.  The most popular members  [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)[m
[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..58a4480[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,37 @@[m
[32m+[m[32m# ginblog[m
[32m+[m
[32m+[m[32m#### 介绍[m
[32m+[m[32mgin+vue全栈制作博客[m
[32m+[m
[32m+[m[32m#### 软件架构[m
[32m+[m[32m软件架构说明[m
[32m+[m
[32m+[m
[32m+