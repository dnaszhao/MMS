INSERT INTO kesplus_platform.kesplus_sys_config ("id","config_key","config_value","scope","scope_id","create_by","create_time","update_by","update_time","is_deleted") VALUES
	 ('1','gitUrl','http://10.12.13.119',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('2','kes_plus.is_single_login','0',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('3','kes_plus.jwt_exp_minutes','30',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('4','kes_plus.env','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('5','kes_plus.login_error_count','5',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('6','kes_plus.jwt_priv_secret',lower(sys_guid()),1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('7','kes_plus.jwt_pub_secret','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('8','kes_plus.prevent_developer','0',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('9','kes_plus.user_default_pwd','SyFuZ2Iyc2U=',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('10','kes_plus.execute_type','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('11','kes_plus.token_check_ip','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
	 ('12','kes_plus.prevent_kesplus_api','0',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
     ('13','klog.log_level','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
     ('14','kes_plus.vs_jwt_exp_hours','30',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
     ('15','kes_plus.sql_injection_check','0',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
     ('16','kes_plus.sql_injection_reg','(SELECT|UPDATE|DELETE|INSERT|DROP|GRANT|CREATE|REVOKE|EXEC|EXECUTE|CALL|PERFORM|UNION|ALTER|REGEXP|LIKE)[\s]+|(CHR\([\d]+\))|[\'''';\\]+|(--)|(/\*(?:[^*]|(?:\*+[^*/]))*\*+/)',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0),
     ('17','kes_plus.password_version','1',1,'0','${currentUserId}',SYSDATE,NULL,NULL,0);