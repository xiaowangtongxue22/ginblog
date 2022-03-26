package model

import (
	"ginblog/utils"
	_ "github.com/go-sql-driver/mysql"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
	"time"
)

//数据库链接
var db *gorm.DB
var err error

func InitDb() {
	dsn := "root:192379" + "@tcp(" + utils.DbHost + ":" + utils.DbPort + ")/" + utils.DbName + "?charset=utf8mb4&parseTime=True&loc=Local"
	//dsn := "root:192379@tcp(localhost:3306)/ginblog?charset=utf8mb4&parseTime=True&loc=Local"
	//		user:pass@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&parseTime=True&loc=Local
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			SingularTable: true, //禁用复数表名
		},
		Logger: logger.Default.LogMode(logger.Silent),
	})
	if err != nil {
		panic("连接数据库失败")
	}
	//模型迁移
	err := db.AutoMigrate(&User{}, Article{}, Category{})
	if err != nil {
		panic("模型迁入错误")
	}

	// 获取通用数据库对象 sql.DB ，然后使用其提供的功能
	sqlDB, err := db.DB()
	if err != nil {
		panic("获取通用数据库对象失败")
	}

	// SetMaxIdleConns 用于设置连接池中空闲连接的最大数量。
	sqlDB.SetMaxIdleConns(10)

	// SetMaxOpenConns 设置打开数据库连接的最大数量。
	sqlDB.SetMaxOpenConns(100)

	// SetConnMaxLifetime 设置了连接可复用的最大时间。
	sqlDB.SetConnMaxLifetime(10 * time.Second) //10s  不要大于框架timing outing的时间
}
