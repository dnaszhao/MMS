INSERT INTO kesplus_base.kesplus_base_role ("id","name","code","description","global_flag","role_level","data_scope","classify","role_type","hidden_flag","db_role_code","enabled","create_by","create_time","update_by","update_time","tenant_id","module_id","dept_id","obj_type","parent_id","sort_num") VALUES
	 ('aa428946184940fd91ed903e6791b095','流程管理',NULL,NULL,false,-1,NULL,2,1,false,NULL,1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'0','aa428946184940fd91ed903e6791b095','0','dir','0',4);


INSERT INTO kesplus_workflow.kesplus_module_role ("id","name","code","description","global_flag","role_level","data_scope","classify","role_type","hidden_flag","db_role_code","enabled","create_by","create_time","update_by","update_time","tenant_id","module_id","dept_id","obj_type","parent_id","sort_num") VALUES
	 ('0875c9f8633f46eca03cd86ae46c7dd3','流程管理员','bpmn_manager',NULL,false,1,'0',2,0,false,'r:kesplus_workflow:bpmn_manager',1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'0','aa428946184940fd91ed903e6791b095','0','obj','11',NULL),
	 ('0875c9f8633f46eca03cd86ae46c7dd4','业务表单审批角色','bpmn_work',NULL,false,1,'0',2,0,false,'r:kesplus_workflow:bpmn_work',1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,'0','aa428946184940fd91ed903e6791b095','0','obj','11',NULL);