CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `sub_merchant_info` varchar(255) DEFAULT NULL COMMENT '子商户id',
  `card_id` varchar(255) NOT NULL COMMENT '卡券ID',
  `card_type` varchar(255) NOT NULL COMMENT '卡卷类型',
  `logo_url` varchar(255) NOT NULL COMMENT 'logo地址',
  `code_type` varchar(16) NOT NULL COMMENT 'Code展示类',
  `brand_name` varchar(36) NOT NULL COMMENT '商户名字',
  `title` varchar(27) NOT NULL COMMENT '卡券名',
  `sub_title` varchar(54) DEFAULT NULL COMMENT '券名',
  `color` varchar(16) NOT NULL COMMENT '券颜色',
  `notice` varchar(48) NOT NULL COMMENT '卡券使用提醒',
  `description` varchar(255) NOT NULL COMMENT '卡券使用说明',
  `sku` varchar(255) NOT NULL COMMENT '商品信息',
  `date_info` varchar(255) NOT NULL COMMENT '使用日期',
  `get_limit` int(1) DEFAULT NULL COMMENT '每人可领券的数量限制,不填写默认为50',
  `can_share` varchar(10) DEFAULT NULL COMMENT '卡券领取页面是否可分享',
  `can_give_friend` varchar(10) DEFAULT NULL COMMENT '卡券是否可转赠',
  `deal_detail` varchar(10) DEFAULT NULL COMMENT '团购详情',
  `least_cost` varchar(10) DEFAULT NULL COMMENT '起用金额',
  `reduce_cost` varchar(10) DEFAULT NULL COMMENT '减免金额',
  `discount` varchar(10) DEFAULT NULL COMMENT '打折额度',
  `gift` varchar(10) DEFAULT NULL COMMENT '礼品的名称',
  `default_detail` varchar(10) DEFAULT NULL COMMENT '优惠详情',
  `service_phone` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `major` int(11) NOT NULL,
  `minor` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `last_active_time` int(11) NOT NULL,
  `poi_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `merchant_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `appsecret` varchar(255) NOT NULL,
  `apiclient_cert` varchar(255) DEFAULT NULL,
  `apiclient_key` varchar(255) DEFAULT NULL,
  `rootca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `merchants_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `price` double(22,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pois` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `poi_id` int(11) DEFAULT NULL,
  `business_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `offset_type` tinyint(1) NOT NULL DEFAULT '1',
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `photo_list` longtext,
  `special` varchar(255) DEFAULT NULL,
  `open_time` varchar(255) DEFAULT NULL,
  `avg_price` int(11) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

