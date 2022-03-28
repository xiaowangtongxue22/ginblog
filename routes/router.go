package routes

import (
	"ginblog/api/v1"
	"ginblog/utils"
	"github.com/gin-gonic/gin"
)

// InitRouter 入口路由
func InitRouter() {
	gin.SetMode(utils.AppMode)
	r := gin.Default()
	router := r.Group("api/v1")
	{
		//用户模块路由
		router.POST("user/add", v1.AddUser)
		router.GET("users", v1.GetUsers)
		router.PUT("user/:id", v1.EditUser)
		router.DELETE("user/:id", v1.DeleteUser)

		//分类模块路由
		//文章模块路由

	}

	r.Run(utils.HttpPort)
}
