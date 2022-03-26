package model

import "gorm.io/gorm"

type Article struct {
	gorm.Model
	Category   Category `gorm:"ForeignKey:CategoryID;AssociationForeignKey:Name"` //文章类型
	Title      string   `gorm:"type:varchar(100);not null" json:"title"`
	CategoryID int      `gorm:"type:int unsigned;not null" json:"category_id"` //文章类型id
	Desc       string   `gorm:"type:varchar(200)" json:"desc"`                 //文章描述
	Content    string   `gorm:"type:longtext" json:"content"`                  //文章主体
	Img        string   `gorm:"type:varchar(100)" json:"img"`                  //文章图片
}
