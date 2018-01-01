USE oa_db;

INSERT INTO `oa_id_user` (`USER_ID`,`PASS_WORD`,`NAME`,`SEX`,`EMAIL`,`TEL`,
	`PHONE`,  `QQ_NUM`,`QUESTION`,`ANSWER`, `STATUS`,`CREATE_DATE`, 
	`MODIFY_DATE`,`CHECK_DATE`,`CHECKER`, `CREATER`, `MODIFIER`)
	VALUES('admin','e10adc3949ba59abbe56e057f20f883e','孙悟空',1,
	'lixiaohua7@163.com','020-88798789','18998336981','441510427',0,'19810821',1,NOW(),NOW(),NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_user` (`USER_ID`,`PASS_WORD`,`NAME`,`SEX`,`EMAIL`,`TEL`,
	`PHONE`,  `QQ_NUM`,`QUESTION`,`ANSWER`, `STATUS`,`CREATE_DATE`, 
	`MODIFY_DATE`,`CHECK_DATE`,`CHECKER`, `CREATER`, `MODIFIER`)
	VALUES('leesiuwah','e10adc3949ba59abbe56e057f20f883e','徐磊',1,
	'lixiaohau7@163.com','020-8098763','18998336981','44287934',2,'湖南',1,NOW(),NULL,NOW(),'admin',NULL,'admin');


INSERT INTO `oa_id_role` (`NAME`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) 
	VALUES('系统管理员','系统维护',NOW(),NOW(),'admin',NULL);
INSERT INTO `oa_id_role` (`NAME`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) 
	VALUES('普通用户','普通用户',NOW(),NULL,'admin',NULL);

INSERT INTO `oa_id_user_role` (`USER_ID`, `ROLE_ID`) VALUES('admin',1);
INSERT INTO `oa_id_user_role` (`USER_ID`, `ROLE_ID`) VALUES('leesiuwah',2);

INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('0001','系统管理','#','系统管理',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00010001','----用户管理','/admin/identity/selectUser.jspx','用户',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100010001','--------查询操作','/admin/identity/selectUser.jspx','查询操作',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100010002','--------增加操作','/admin/identity/addUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100010003','--------修改操作','/admin/identity/updateUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100010004','--------删除操作','/admin/identity/deleteUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100010005','--------审核操作','/admin/identity/checkUser.jspx','审核操作',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00010002','----角色管理','/admin/identity/selectRole.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020001','--------查询操作','/admin/identity/selectRole.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020002','--------增加操作','/admin/identity/addRole.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020003','--------修改操作','/admin/identity/updateRole.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020004','--------删除操作','/admin/identity/deleteRole.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020005','--------查看角色绑定用户','/admin/identity/selectRoleUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020006','--------查看角色绑定模块','/admin/identity/selectRoleModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020007','--------角色绑定用户','/admin/identity/bindUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020008','--------角色解除用户','/admin/identity/unbindUser.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020009','--------查看角色绑定操作','/admin/identity/selectBindModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100020010','--------角色绑定操作','/admin/identity/bindMoudle.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00010003','----操作管理','/admin/identity/mgrModule.jspx','操作管理',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100030001','--------管理操作','/admin/identity/mgrModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100030002','--------查询操作','/admin/identity/selectModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100030003','--------增加操作','/admin/identity/addModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100030004','--------修改操作','/admin/identity/updateModule.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100030005','--------删除操作','/admin/identity/deleteModule.jspx','管理操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00010004','----流程布署','/admin/identity/mgrPush.jspx','流程布署',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100040001','--------管理布署','/admin/identity/mgrPush.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000100040002','--------流程布署','/admin/identity/pushFlow.jspx',NULL,NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('0002','假期管理','#','假期管理','2012-04-07 13:45:51',NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00020001','----假期类型','/admin/leave/mgrLeaveType.jspx','假期类型管理',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200010001','--------查询操作','/admin/leave/selectLeaveType.jspx','查询操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200010002','--------增加操作','/admin/leave/addLeaveType.jspx','增加操作',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200010003','--------修改操作','/admin/leave/updateLeaveType.jspx','修改操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200010004','--------删除操作','/admin/leave/deleteLeaveType.jspx','删除操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200010005','--------管理操作','/admin/leave/mgrLeaveType.jspx','管理操作',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00020002','----假期明细','/admin/leave/mgrLeaveItem.jspx','假期明细',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200020001','--------管理操作','/admin/leave/mgrLeaveItem.jspx','管理操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200020002','--------查询操作','/admin/leave/selectLeaveItem.jspx','查询操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200020006','--------审核操作','/admin/leave/checkLeaveItem.jspx','审核操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00020003','----用户请假','/admin/leave/selectUserLeave.jspx','用户请假',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200030001','--------查询操作','/admin/leave/selectUserLeave.jspx','查询操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200030002','--------增加操作','/admin/leave/addUserLeave.jspx','增加操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200030003','--------修改操作','/admin/leave/updateUserLeave.jspx','修改操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200030004','--------删除操作','/admin/leave/deleteUserLeave.jspx','删除操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('00020004','----假期审批','/admin/leave/selectAuditLeave.jspx','假期审批',NOW(),NOW(),'admin','admin');
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200040001','--------查看审批操作','/admin/leave/selectAuditLeave.jspx','查看审批操作',NOW(),NULL,'admin',NULL);
INSERT INTO `oa_id_module` (`CODE`,`NAME`, `URL`, `REMARK`, `CREATE_DATE`, `MODIFY_DATE`, `CREATER`, `MODIFIER`) VALUES('000200040002','--------审批请假操作','/admin/leave/auditLeaveSheet.jspx','审批请假操作',NOW(),NULL,'admin',NULL);

INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020002','000200020001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020002','000200020002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020002','000200020006');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010001','000100010001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010001','000100010002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010001','000100010003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010001','000100010004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010001','000100010005');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020001','000200010001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020001','000200010002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020001','000200010003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020001','000200010004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020001','000200010005');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',2,'00020003','000200030001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',2,'00020003','000200030002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',2,'00020003','000200030003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',2,'00020003','000200030004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`)
	VALUES(NOW(),'admin',1,'00010002','000100020003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020005');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020006');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020007');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020008');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020009');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010002','000100020010');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010003','000100030001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010003','000100030002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010003','000100030003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010003','000100030004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010003','000100030005');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020003','000200030001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020003','000200030002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020003','000200030003');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020003','000200030004');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010004','000100040001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00010004','000100040002');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020004','000200040001');
INSERT INTO `oa_id_popedom` (`CREATE_DATE`, `CREATER`, `ROLE_ID`, `MODULE_CODE`, `OPERA_CODE`) 
	VALUES(NOW(),'admin',1,'00020004','000200040002');


INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('001','年假','年假不扣工资','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('002','病假','病假扣10%工资','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('003','休假','补休','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('004','产假','产假','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('005','陪产假','陪产假','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('006','婚假','婚假','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('007','探亲假','探亲假','admin',NOW(),'admin',NOW());
INSERT INTO `oa_leave_type` (`CODE`, `NAME`, `REMARK`, `CREATER`, `CREATE_DATE`,`MODIFIER`,`MODIFY_DATE`) VALUES('008','事假','事假',NULL,NULL,'admin',NOW());


INSERT INTO `oa_id_dept` (`CREATE_DATE`, `MODIFY_DATE`, `NAME`, `REMARK`, `CREATER`, `MODIFIER`) VALUES(NOW(),NOW(),'技术部',NULL,'admin','admin');
INSERT INTO `oa_id_dept` (`CREATE_DATE`, `MODIFY_DATE`, `NAME`, `REMARK`, `CREATER`, `MODIFIER`) VALUES(NOW(),NOW(),'运营部',NULL,'admin','admin');
INSERT INTO `oa_id_dept` (`CREATE_DATE`, `MODIFY_DATE`, `NAME`, `REMARK`, `CREATER`, `MODIFIER`) VALUES(NOW(),NOW(),'财务部',NULL,'admin','admin');
INSERT INTO `oa_id_dept` (`CREATE_DATE`, `MODIFY_DATE`, `NAME`, `REMARK`, `CREATER`, `MODIFIER`) VALUES(NOW(),NOW(),'人事部',NULL,'admin','admin');
INSERT INTO `oa_id_dept` (`CREATE_DATE`, `MODIFY_DATE`, `NAME`, `REMARK`, `CREATER`, `MODIFIER`) VALUES(NOW(),NOW(),'总公办',NULL,'admin','admin');


INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0001','职员',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0002','Java开发工程师',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0003','Java中级开发工程师',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0004','Java高级开发工程师',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0005','系统管理员',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0006','架构师',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0007','主管',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0008','经理',NULL);
INSERT INTO `oa_id_job` (`CODE`, `NAME`, `REMARK`) VALUES('0009','总经理',NULL);



INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('limin','888',NOW(),NOW(),'441510427@qq.com',NULL,'李民','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('liqin','888',NOW(),NOW(),'441510427@qq.com',NULL,'李琴','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('lixiaohu','888',NOW(),NOW(),'441510427@qq.com',NULL,'李小虎','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','5','0009',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('liying','888',NOW(),NOW(),'441510427@qq.com',NULL,'李英','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0001',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangbo','888',NOW(),NOW(),'441510427@qq.com',NULL,'张波','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0008',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老大','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0008',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老二','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老三','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0006',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老四','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0006',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老五','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0005',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老六','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0004',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'老七','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'唐僧','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0002',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'大师兄','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0003',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'二师弟','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0004',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('zhangsan','888',NOW(),NOW(),'441510427@qq.com',NULL,'三师弟','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0004',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('limin','888',NOW(),NOW(),'441510427@qq.com',NULL,'杰克','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('liqin','888',NOW(),NOW(),'441510427@qq.com',NULL,'露丝','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoa','888',NOW(),NOW(),'441510427@qq.com',NULL,'小A','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','5','0009',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaob','888',NOW(),NOW(),'441510427@qq.com',NULL,'小B','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0001',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoc','888',NOW(),NOW(),'441510427@qq.com',NULL,'小C','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0008',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaod','888',NOW(),NOW(),'441510427@qq.com',NULL,'小D','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0008',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoe','888',NOW(),NOW(),'441510427@qq.com',NULL,'小E','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaof','888',NOW(),NOW(),'441510427@qq.com',NULL,'小F','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0006',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaog','888',NOW(),NOW(),'441510427@qq.com',NULL,'小G','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0006',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoh','888',NOW(),NOW(),'441510427@qq.com',NULL,'小H','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0005',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoi','888',NOW(),NOW(),'441510427@qq.com',NULL,'小I','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0004',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaoj','888',NOW(),NOW(),'441510427@qq.com',NULL,'小J','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0007',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaok','888',NOW(),NOW(),'441510427@qq.com',NULL,'小K','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0002',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaol','888',NOW(),NOW(),'441510427@qq.com',NULL,'小L','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','1','0003',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaon','888',NOW(),NOW(),'441510427@qq.com',NULL,'小N','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0004',NULL);
INSERT INTO `oa_id_user` (`USER_ID`, `ANSWER`, `CHECK_DATE`, `CREATE_DATE`, `EMAIL`, `MODIFY_DATE`, `NAME`, `PASS_WORD`, `PHONE`, `QQ_NUM`, `QUESTION`, `SEX`, `STATUS`, `TEL`, `CHECKER`, `CREATER`, `DEPT_ID`, `JOB_CODE`, `MODIFIER`) VALUES('xiaom','888',NOW(),NOW(),'441510427@qq.com',NULL,'小M','e10adc3949ba59abbe56e057f20f883e','13888888888','88888','0','1','1','02088888888','admin','admin','4','0004',NULL);
