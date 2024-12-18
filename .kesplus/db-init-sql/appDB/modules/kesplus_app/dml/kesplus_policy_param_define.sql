INSERT INTO kesplus_app.kesplus_policy_param_define ("id","code","name","title","description","data_type","input_type","data_source","data_info","mult_flag","enabled","create_by","create_time","update_by","update_time","dept_id","module_id","tenant_id","variable_path") VALUES
	 ('1','CURRENT_DEPT_ID','CURRENT_DEPT_ID','被授权用户部门ID','被授权用户部门ID','varchar','auto',1,'{"expression":"USER/user/deptId"}',false,1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'0','dfb8894291c34ac28e3458bba277e0ff','0','USER/user/deptId'),
	 ('2','CURRENT_COMPANY_ID','CURRENT_COMPANY_ID','被授权用户公司ID','被授权用户公司ID','varchar','auto',1,'{"expression":"USER/dept/companyId"}',false,1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'0','dfb8894291c34ac28e3458bba277e0ff','0','USER/dept/companyId'),
	 ('3','CURRENT_USER_ID','CURRENT_USER_ID','被授权用户用户ID','被授权用户用户ID','varchar','auto',1,'{"expression":"USER/user/id"}',false,1,'546508b9842c4e3698a1f2d3ae6fa917',SYSDATE,NULL,NULL,'0','dfb8894291c34ac28e3458bba277e0ff','0','USER/user/id');