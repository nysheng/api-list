create table api_info(
	`id` int(11) not null AUTO_INCREMENT comment '自增主键',
	`url` varchar(64) not null comment 'url地址',
	`params_str` varchar(32) comment 'url参数名，多个参数以‘-’分割',
	`name` varchar(32) not null comment 'api名称',
	`image` varchar(64) not null comment 'api图片',
	`comment` varchar(64) comment 'api说明',
	`create_time` timestamp not null default current_timestamp comment '创建时间',
	`update_time` timestamp not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key(`id`)
) ENGINE=InnoDB AUTO_INCREMENT 10000 DEFAULT CHARSET=utf8 comment "api信息";

