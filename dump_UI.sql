DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `caseid` int NOT NULL AUTO_INCREMENT COMMENT 'unique',
  `projectname` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `srctype` varchar(50) DEFAULT NULL COMMENT '源码框架类型uni-app/mpvue',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `casetag` varchar(50) DEFAULT NULL COMMENT '标签：冒烟用例/xx特性',
  `module` varchar(50) DEFAULT NULL COMMENT '模块tab：首页/客服/订单等',
  `casename` varchar(255) DEFAULT NULL COMMENT '用例名和描述',
  `create_time` DATETIME DEFAULT NULL COMMENT '用例创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `eventlist` longtext COMMENT '用例步骤',
  PRIMARY KEY (`caseid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8 ROW_FORMAT = COMPACT;
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `resultid` int NOT NULL AUTO_INCREMENT COMMENT 'unique',
  `caseid` int NOT NULL COMMENT '用例ID',
  `taskid` int NOT NULL COMMENT '任务ID',
  `case_assert` int NOT NULL COMMENT '是否是用例快照，用作用例截图对比基准',
  `case_assert_time` DATETIME DEFAULT NULL COMMENT '快照时间',
  `gen_src_code` longtext COMMENT '生成代码',
  `start_time` DATETIME DEFAULT NULL COMMENT '用例执行起始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '用例执行结束时间',
  `devops_info` longtext DEFAULT NULL COMMENT '蓝盾信息，存储截图，buildid等信息',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `eventlist_result` longtext COMMENT '用例执行步骤和对应结果',
  PRIMARY KEY (`resultid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8 ROW_FORMAT = COMPACT;
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `reporid` int NOT NULL AUTO_INCREMENT COMMENT 'unique',
  `taskid` int NOT NULL COMMENT '任务ID',
  `fail_caseid` varchar(100) DEFAULT NULL COMMENT '失败用例ID列表',
  `run_caseid` varchar(100) DEFAULT NULL COMMENT '执行用例ID列表',
  `start_time` DATETIME DEFAULT NULL COMMENT '报告执行起始时间',
  `end_time` DATETIME DEFAULT NULL COMMENT '报告执行结束时间',
  `email_config` longtext DEFAULT NULL COMMENT '邮件收件人配置，预留',
  `rate` varchar(10) DEFAULT NULL COMMENT '报告用例通过率',
  `reporttname` varchar(100) DEFAULT NULL COMMENT '报告描述',
  `reportpath` varchar(100) DEFAULT NULL COMMENT '报告路径',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`reporid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 DEFAULT CHARSET = utf8 ROW_FORMAT = COMPACT;