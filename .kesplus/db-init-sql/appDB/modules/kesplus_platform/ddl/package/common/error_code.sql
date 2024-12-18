CREATE OR REPLACE PACKAGE "kesplus_platform"."error_code" AUTHID CURRENT_USER AS
	/**
	 * 通用返回
	 */
	SUCCESS CONSTANT TEXT := '200'; 
	FAIL CONSTANT TEXT := '500'; 
	NO_PERMISSION CONSTANT TEXT := 'kesplus_token_5010';  
	/**
	 *
	 */
	WITHOUT_LOGIN CONSTANT TEXT := 'kesplus_token_401';
	TOKEN_EXPIRED CONSTANT TEXT := 'kesplus_token_601';
	TOKEN_ILLEGAL CONSTANT TEXT := 'kesplus_token_603';
	/**
	 *
	 */
    NOT_FOUND_API CONSTANT TEXT := 'kesplus_router_301';
	NOT_SUPPORT_SQL_FUNCTION CONSTANT TEXT := 'kesplus_router_2001';
	MISS_REQUIRED_PARAM CONSTANT TEXT := 'kesplus_router_2002';
	FUNCTION_NAME_ANALYSIS_ERROR CONSTANT TEXT := 'kesplus_router_2003';
	NO_DEFINE_FUNCTION CONSTANT TEXT := 'kesplus_router_2004';
	EXECUTE_FAIL CONSTANT TEXT := 'kesplus_router_2005';
    NULL_SQL_RESULT CONSTANT TEXT := 'kesplus_router_2006';
    QUERY_NO_ROWS CONSTANT TEXT := 'kesplus_router_3001';
    DATA_NO_FOUND CONSTANT TEXT := '404';  
    
    ERROR_U_P CONSTANT TEXT := 'kesplus_user_1000';  
    USER_NO_EXIST CONSTANT TEXT := 'kesplus_user_1001'; 
    USER_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_user_1002'; 
    USER_NO_AUTH CONSTANT TEXT := 'kesplus_user_1003'; 
    LOGIN_CAPTCHA_ERROR CONSTANT TEXT := 'kesplus_login_1001'; 
    LOGIN_USERNAME_NULL CONSTANT TEXT := 'kesplus_login_1002'; 
    LOGIN_PASSWORD_NULL CONSTANT TEXT := 'kesplus_login_1003'; 
    LOGIN_NO_PERMISSION CONSTANT TEXT := 'kesplus_login_1004'; 
    LOGIN_CAPTCHA_EXPIRE CONSTANT TEXT := 'kesplus_login_1005'; 
    LOGIN_CAPTCHA_NULL CONSTANT TEXT := 'kesplus_login_1006'; 
    /**
     * 函数&存储过程错误码
     */
    FUNCTION_NAME_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_func_1000'; 
    FUNCTION_CHILD_NO_DELETE CONSTANT TEXT := 'kesplus_func_1001'; 
    FUNCTION_IS_NULL CONSTANT TEXT := 'kesplus_func_1002'; 
    FUNCTION_REST_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_func_1003'; 
    FUNCTION_CODE_NULL CONSTANT TEXT := 'kesplus_func_1004'; 
    FUNCTION_CODE_VALUE CONSTANT TEXT := 'kesplus_func_1005'; 
    FUNCTION_API_NO_DELETE CONSTANT TEXT := 'kesplus_func_1006'; 
    FUNCTION_RELATION_NULL CONSTANT TEXT := 'kesplus_func_1007'; 
    
    TABLE_NAME_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_tables_1001'; 
    TABLE_CHILD_NO_DELETE CONSTANT TEXT := 'kesplus_tables_1002'; 
    TABLE_ID_NULL CONSTANT TEXT := 'kesplus_tables_1003'; 
    VIEW_ID_NULL CONSTANT TEXT := 'kesplus_tables_1004'; 
    NULL_CONSTRAINT_CONDITION CONSTANT TEXT := 'kesplus_tables_1005'; 
    ILLEGAL_TABLE_CREATION_STATEMENT CONSTANT TEXT := 'kesplus_tables_1006'; 
    CAN_NOT_CREATE_MULTIPLE CONSTANT TEXT := 'kesplus_tables_1007'; 
    CAN_NOT_OPERATE_MULTIPLE CONSTANT TEXT := 'kesplus_tables_1008'; 
    UNSUPPORTED_OPERATION_TYPE CONSTANT TEXT := 'kesplus_tables_1009'; 
    UNSUPPORTED_PARTITION_TYPE CONSTANT TEXT := 'kesplus_tables_1010'; 
    /**
     * 包错误码
     */
    PACKAGE_NAME_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_pkg_1000'; 
    PACKAGE_NAME_NULL CONSTANT TEXT := 'kesplus_pkg_1001'; 
    PACKAGE_CHILD_NO_DELETE CONSTANT TEXT := 'kesplus_pkg_1002'; 
    PACKAGE_ANALYSIS_ERROR CONSTANT TEXT := 'kesplus_pkg_1003'; 
    
    KESPLUS_PLATFORM_PACKAGE_CRON_EXPRESSION_ERROR CONSTANT TEXT := 'kesplus_platform_pkg_1004'; 
    KESPLUS_PLATFORM_PACKAGE_EXPRESSION_NOT_SUPPORT CONSTANT TEXT := 'kesplus_platform_pkg_1005'; 
    KESPLUS_PLATFORM_PACKAGE_CANNOT_SET_SUPERIOR CONSTANT TEXT := 'kesplus_platform_pkg_1006'; 
    KESPLUS_PLATFORM_PACKAGE_CURRENT_SUB_CANNOT_BE_SUPERIOR CONSTANT TEXT := 'kesplus_platform_pkg_1007'; 
    KESPLUS_PLATFORM_PACKAGE_SUPERIOR_NOT_EXISTS CONSTANT TEXT := 'kesplus_platform_pkg_1008'; 
    KESPLUS_PLATFORM_PACKAGE_NOT_SET_QUERY_CONDITION CONSTANT TEXT := 'kesplus_platform_pkg_1009'; 
    QUERY_CONDITION_NOT_MATCHS_QUERY_VALUES CONSTANT TEXT := 'kesplus_platform_pkg_1010'; 
    KESPLUS_PLATFORM_PACKAGE_NOT_GET_USER_DEPT CONSTANT TEXT := 'kesplus_platform_pkg_1011'; 
    KESPLUS_PLATFORM_PACKAGE_TAB_NOT_EXISTS_OR_NO_PERMESSIONS TEXT := 'kesplus_platform_pkg_1012'; 
    KESPLUS_PLATFORM_PACKAGE_FAIL_GEN_SELECT_STATEMENT TEXT := 'kesplus_platform_pkg_1013'; 
    KESPLUS_PLATFORM_JOB_CRON_EXPRESSION_ERROR CONSTANT TEXT := 'kesplus_platform_job_1014'; 
    
    KESPLUS_PLATFORM_PACKAGE_INVALID_INPUT_PARAMS TEXT := 'kesplus_platform_pkg_1014'; 
    KESPLUS_PLATFORM_PACKAGE_OBJECT_NOT_EXISTS TEXT := 'kesplus_platform_pkg_1015'; 
    KESPLUS_PLATFORM_PACKAGE_PERMISSION_DENIED_FOR_OBJECT TEXT := 'kesplus_platform_pkg_1016'; 
    KESPLUS_PLATFORM_PACKAGE_ATTRIBUTE_NOT_MATCH TEXT := 'kesplus_platform_pkg_1017'; 
    
    KESPLUS_PLATFORM_PACKAGE_PARAM_INPUT_OUTPUT_ERROR TEXT := 'kesplus_platform_pkg_1018'; 
    KESPLUS_PLATFORM_PACKAGE_STATEMENT_MISSING_SCHEMA TEXT := 'kesplus_platform_pkg_1019'; 
    KESPLUS_PLATFORM_PACKAGE_PARAMETER_NOT_RIGHT TEXT := 'kesplus_platform_pkg_1020'; 
    KESPLUS_PLATFORM_PACKAGE_PLEASE_INPUT_DATA TEXT := 'kesplus_platform_pkg_1066'; 
    KESPLUS_PLATFORM_PACKAGE_PLEASE_SELECT_DELETE_DATA TEXT := 'kesplus_platform_pkg_1067'; 
    KESPLUS_PLATFORM_PACKAGE_QUERY_PARAM_NOT_EMPTY TEXT := 'kesplus_platform_pkg_1068'; 
    KESPLUS_PLATFORM_PACKAGE_QUERY_ID_IS_NULL TEXT := 'kesplus_platform_pkg_1069'; 
    KESPLUS_GENERATOR_UPDATE_DATA_NULL TEXT := 'kesplus_platform_pkg_1070'; 
    KESPLUS_GENERATOR_CONDITION_DATA_NULL TEXT := 'kesplus_platform_pkg_1071'; 
    KESPLUS_GENERATOR_GET_MORE_ERROR TEXT := 'kesplus_platform_pkg_1072'; 
    
    KESPLUS_PLATFORM_PACKAGE_CACHE_USER_ID_NOT_EMPTY TEXT := 'kesplus_platform_pkg_cache_1022'; 
    KESPLUS_PLATFORM_PACKAGE_CACHE_RESTFUL_ID_NOT_EMPTY TEXT := 'kesplus_platform_pkg_cache_1023'; 
    
    KESPLUS_PLATFORM_PACKAGE_CONF_TEMPLATE_CONF_NOT_EXISTS TEXT := 'kesplus_platform_pkg_conf_1024'; 
    CONF_DELETE_PLATFORM_CONF_NOT_PERMIT TEXT := 'kesplus_platform_pkg_conf_1025'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_NOT_EXISTS TEXT := 'kesplus_platform_pkg_conf_1026'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_ILLEGAL_PARAMS TEXT := 'kesplus_platform_pkg_conf_1027'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_ID_EXISTS TEXT := 'kesplus_platform_pkg_conf_1028'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_ID_NOT_EXISTS TEXT := 'kesplus_platform_pkg_conf_1029'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_CODE_EXISTS TEXT := 'kesplus_platform_pkg_conf_1030'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_EXISTS_IN_CURRENT_REGION TEXT := 'kesplus_platform_pkg_conf_1031'; 
    KESPLUS_PLATFORM_PACKAGE_CONF_KEY_NOT_EMPTY TEXT := 'kesplus_platform_pkg_conf_1032'; 
    
    KESPLUS_PLATFORM_PACKAGE_APP_APP_CODE_NOT_EMPTY TEXT := 'kesplus_platform_pkg_app_1033'; 
    KESPLUS_PLATFORM_PACKAGE_APP_APP_NAME_NOT_EMPTY TEXT := 'kesplus_platform_pkg_app_1034'; 
    KESPLUS_PLATFORM_PACKAGE_APP_DIR_ID_NOT_EMPTY TEXT := 'kesplus_platform_pkg_app_1035'; 
    KESPLUS_PLATFORM_PACKAGE_APP_DIR_NAME_NOT_EMPTY TEXT := 'kesplus_platform_pkg_app_1036'; 
    KESPLUS_PLATFORM_PACKAGE_APP_CLASSIFY_ID_NOT_EMPTY TEXT := 'kesplus_platform_pkg_app_1037'; 
    KESPLUS_PLATFORM_PACKAGE_APP_USER_ID_EXISTS TEXT := 'kesplus_platform_pkg_app_1038'; 
    KESPLUS_PLATFORM_PACKAGE_APP_USER_NAME_EXISTS TEXT := 'kesplus_platform_pkg_app_1039'; 
    KESPLUS_PLATFORM_PACKAGE_APP_DATASOURCE_SCHEMA_EMPTY TEXT := 'kesplus_platform_pkg_app_1040'; 
    KESPLUS_PLATFORM_PACKAGE_APP_UPDATE_SYSUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1041'; 
    KESPLUS_PLATFORM_PACKAGE_APP_UPDATE_GITUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1042'; 
    KESPLUS_PLATFORM_PACKAGE_APP_UPDATE_APPUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1043'; 
    KESPLUS_PLATFORM_PACKAGE_APP_SAVE_SYSUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1044'; 
    KESPLUS_PLATFORM_PACKAGE_APP_SAVE_GITUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1045'; 
    KESPLUS_PLATFORM_PACKAGE_APP_SAVE_APPUSER_FAIL TEXT := 'kesplus_platform_pkg_app_1046'; 
    KESPLUS_PLATFORM_PACKAGE_APP_SESSION_TIMEOUT TEXT := 'kesplus_platform_pkg_app_1047';
    
    KESPLUS_PLATFORM_PACKAGE_APPUSER_INIT_APPUSER_FAIL TEXT := 'kesplus_platform_pkg_appuser_1047'; 
    KESPLUS_PLATFORM_PACKAGE_APPUSER_USER_EXISTS TEXT := 'kesplus_platform_pkg_appuser_1048'; 
    
    KESPLUS_PLATFORM_PACKAGE_GIT_REPOSITORY_EXISTS TEXT := 'kesplus_platform_pkg_git_1049'; 
    KESPLUS_PLATFORM_PACKAGE_GIT_SAVE_FAIL TEXT := 'kesplus_platform_pkg_git_1050'; 
    
    KESPLUS_PLATFORM_PACKAGE_GITUSER_USER_EXISTS TEXT := 'kesplus_platform_pkg_gituser_1051'; 
    
    KESPLUS_PLATFORM_PACKAGE_LOGS_PARSE_JSON_FAIL TEXT := 'kesplus_platform_pkg_logs_1052'; 
    KESPLUS_PLATFORM_PACKAGE_LOGS_PARSE_URL_FAIL TEXT := 'kesplus_platform_pkg_logs_1053'; 
    KESPLUS_PLATFORM_PACKAGE_LOGS_LOGTYPE_NOT_EMPTY TEXT := 'kesplus_platform_pkg_logs_1054'; 
    
    KESPLUS_PLATFORM_PACKAGE_MARKET_DATA_NOT_EXISTS TEXT := 'kesplus_platform_pkg_market_1055'; 
    
    KESPLUS_PLATFORM_PACKAGE_MEMBER_USERNAME_EXISTS TEXT := 'kesplus_platform_pkg_member_1056'; 
    NON_ADMIN_MODIFY_MSG_NOT_PERMIT TEXT := 'kesplus_platform_pkg_member_1057'; 
    MODIFY_USER_MSG_NOT_PERMIT TEXT := 'kesplus_platform_pkg_member_1058'; 
    NONADMIN_MODIFY_STAT_NOT_PERMIT TEXT := 'kesplus_platform_pkg_member_1059'; 
    USERS_CANNOT_MODIFY_THEIR_OWN_STATE TEXT := 'kesplus_platform_pkg_member_1060'; 
    AMDIN_ROLE_USER_CANNOT_UNBOUND TEXT := 'kesplus_platform_pkg_member_1061'; 
    AMDIN_ROLE_USER_CANNOT_BE_DELETED TEXT := 'kesplus_platform_pkg_member_1062'; 
    AMDIN_ROLE_USER_CANNOT_BE_DISABLED TEXT := 'kesplus_platform_pkg_member_1063'; 
    
    KESPLUS_PLATFORM_PACKAGE_INPUT_API_PATH TEXT := 'kesplus_platform_pkg_statics_1063'; 
    
    KESPLUS_PLATFORM_PACKAGE_SYSTEM_API_CANNOT_ADD TEXT := 'kesplus_platform_SYSTEM_1064'; 
    KESPLUS_PLATFORM_PACKAGE_SYSTEM_API_CANNOT_EDIT TEXT := 'kesplus_platform_SYSTEM_1065'; 
    /**
     * 应用管理错误码
     */
    
    APP_NAME_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_app_3002'; 
    APP_MANAGER_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_app_3003';
    APP_ID_NULL CONSTANT TEXT := 'kesplus_app_3004';
    APP_ID_NO_EXISTS CONSTANT TEXT := 'kesplus_app_3005';
    APP_CODE_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_app_3006'; 
    APP_TYPE_NO_DELETE CONSTANT TEXT := 'kesplus_app_3007'; 
    APP_CODE_NULL CONSTANT TEXT := 'kesplus_app_3008';
    
    MODULE_ID_NO_EXISTS CONSTANT TEXT := 'kesplus_module_1002';
    MODULE_ID_NULL CONSTANT TEXT := 'kesplus_module_1003';
    MODULE_PATH_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_module_1004';
    /**
     * Restful错误码
     */
    RESTFUL_SYSTEM CONSTANT TEXT := 'kesplus_restful_1000';
    RESTFUL_NAME_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_restful_1001'; 
    RESTFUL_CHILD_NO_DELETE CONSTANT TEXT := 'kesplus_restful_1002'; 
    RESTFUL_PATH_NULL CONSTANT TEXT := 'kesplus_restful_1003'; 
    RESTFUL_PATH_ALREADY_EXISTS CONSTANT TEXT := 'kesplus_restful_1004'; 
    RESTFUL_ID_NULL CONSTANT TEXT := 'kesplus_restful_1005'; 
    RESTFUL_NAME_NULL CONSTANT TEXT := 'kesplus_restful_1006'; 
    GENERATOR_REPEAT CONSTANT text := 'kesplus_generator_1000'; 
        /**
       	菜单错误码
       	*/
    MENU_CODE_EXISTS CONSTANT TEXT := 'kesplus_menu_1000'; 
    MENU_CODE_NULL CONSTANT TEXT := 'kesplus_menu_1001'; 
    
    ROUTER_ERROR_MODUE_CODE CONSTANT TEXT := 'kesplus_router_1000'; 
    ROUTER_PREVENT_DEVELOPER CONSTANT TEXT := 'kesplus_router_1001'; 
    ROUTER_PREVENT_KESPLUS_API CONSTANT TEXT := 'kesplus_router_1002'; 
    ROUTER_PREVENT_APP_API CONSTANT TEXT := 'kesplus_router_1003'; 
    ROUTER_FOUND_NO_USER CONSTANT TEXT := 'kesplus_router_1004'; 
    ROUTER_ANALYSIS_TOKEN_FAILED CONSTANT TEXT := 'kesplus_router_1005'; 
    ROUTER_ENCRYPT_ERROR CONSTANT TEXT := 'kesplus_router_1006'; 
    ROUTER_TOKEN_NO_PUBLIC_SECRET CONSTANT TEXT := 'kesplus_router_1007'; 
    ROUTER_TOKEN_NO_PRIVATE_SECRET CONSTANT TEXT := 'kesplus_router_1008'; 
    ROUTER_PROC_ANALYSIS_FAILED CONSTANT TEXT := 'kesplus_router_1009'; 
    ROUTER_PROC_NOT_EXIST CONSTANT TEXT := 'kesplus_router_1010'; 
    ROUTER_ERROR_SETTINGS CONSTANT TEXT := 'kesplus_router_1011'; 
    ROUTER_PARAM_TYPE_UNDEFINED CONSTANT TEXT := 'kesplus_router_1012'; 
    ROUTER_ERROR_DBNAME CONSTANT TEXT := 'kesplus_router_1013'; 
    ROUTER_USERNAME_CANNOT_BE_NULL CONSTANT TEXT := 'kesplus_router_1014'; 
    ROUTER_FAILED_TO_CREATE_TOKEN CONSTANT TEXT := 'kesplus_router_1015'; 
    ROUTER_USERID_CANNOT_BE_NULL CONSTANT TEXT := 'kesplus_router_1016'; 
    
    UTIL_NODE_LEVEL_ERROR CONSTANT TEXT := 'kesplus_tree_1000'; 
    
    VERSION_CANNOT_BE_NULL CONSTANT TEXT := 'kesplus_version_1000'; 
    UPGRADE_ONLY_IN_PLATFORM CONSTANT TEXT := 'kesplus_upgrade_1000'; 
    SYSTEM_ROLE_CANNOT_BE_NULL CONSTANT TEXT := 'kesplus_system_1000'; 
    SYSTEM_NO_MODULE CONSTANT TEXT := 'kesplus_system_1001'; 
    SYSTEM_DONOT_INIT_REPEAT CONSTANT TEXT := 'kesplus_system_1002'; 
    SYSUSER_ALREADY_EXIST CONSTANT TEXT := 'kesplus_sysuser_1000'; 
    SYSUSER_NOT_ENOUGH_AUTH CONSTANT TEXT := 'kesplus_sysuser_1001'; 
    SYSUSER_DELETE_IN_APP_FIRST CONSTANT TEXT := 'kesplus_sysuser_1002'; 
    SYSUSER_DELETE_GIT_ACCOUNT_FIRST CONSTANT TEXT := 'kesplus_sysuser_1003'; 
    SYSUSER_NEED_OLD_PASSWORD CONSTANT TEXT := 'kesplus_sysuser_1004'; 
    SYSUSER_CHECK_PASSWORD_ERROR CONSTANT TEXT := 'kesplus_sysuser_1005'; 
    SYSUSER_OLD_PASSWORD_ERROR CONSTANT TEXT := 'kesplus_sysuser_1006'; 
    SYSUSER_PASSWORD_CONFIRM_ERROR CONSTANT TEXT := 'kesplus_sysuser_1007'; 
    SYSUSER_PREVENT_DEVELOPER CONSTANT TEXT := 'kesplus_sysuser_1008'; 
    SYSUSER_USERID_CANNOT_BE_NULL CONSTANT TEXT := 'kesplus_sysuser_1009'; 
    SYSUSER_DISABLED CONSTANT TEXT := 'kesplus_sysuser_1010'; 
    KESPLUS_PARAM_NOT_NULL CONSTANT TEXT := 'kesplus_param_not_null'; 
    KESPLUS_TABLE_NOT_EXIST CONSTANT TEXT := 'kesplus_table_not_exist'; 
    KESPLUS_MEMBER_DISABLED CONSTANT TEXT := 'kesplus_member_disabled'; 
    KESPLUS_PARAM_NOT_MATCH CONSTANT TEXT := 'kesplus_param_not_match'; 
    KESPLUS_PARAM_NOT_DEFINE CONSTANT TEXT := 'kesplus_param_not_define'; 
    KESPLUS_CANNOT_DELETE_SELF TEXT := 'kesplus_cannot_delete_self'; 
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."error_code" AS WRAPPED
/BI7rN81Kb9WpM8RmlhM/w==
END;
