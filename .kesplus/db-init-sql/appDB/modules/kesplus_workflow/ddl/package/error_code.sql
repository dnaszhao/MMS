CREATE OR REPLACE PACKAGE "kesplus_workflow"."error_code" AUTHID CURRENT_USER AS
    WORKFLOW_ASSIGNEES_NULL CONSTANT TEXT := 'kesplus_workflow_1000';
    WORKFLOW_ASSIGNEES_PATH_NULL CONSTANT TEXT := 'kesplus_workflow_1001';
    WORKFLOW_PENDING_NO_EXISTS CONSTANT TEXT := 'kesplus_workflow_1002';
    WORKFLOW_PENDING_COMPLETED CONSTANT TEXT := 'kesplus_workflow_1003'; 
    WORKFLOW_PENDING_NO_PERMISSION CONSTANT TEXT := 'kesplus_workflow_1004'; 



    FLOW_ID_NULL CONSTANT TEXT := 'kesplus_workflow_1008';
    FORM_NO_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1009';
    FORM_ID_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1010';
    MISSING_PARAMETERS CONSTANT TEXT := 'kesplus_workflow_1011';
    UNDEFINED_PROCESS_DEFINITION CONSTANT TEXT := 'kesplus_workflow_1012'; 
    OPINIONS_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1013'; 
    TASK_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1014';  
    PROCESS_ID_EXISTS CONSTANT TEXT := 'kesplus_workflow_1015';
    PROCESS_NOT_PUBLISH CONSTANT TEXT := 'kesplus_workflow_1016';
    PROCESS_VARIABLE_EMPTY CONSTANT TEXT := 'kesplus_workflow_1017';
    PROCESS_NOT_SPECIFIED CONSTANT TEXT := 'kesplus_workflow_1018'; 
    APPROVER_NOT_SPECIFIED CONSTANT TEXT := 'kesplus_workflow_1019'; 
    USERS_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1020'; 
    PREV_TASK_OP_ID_NULL CONSTANT TEXT := 'kesplus_workflow_1021'; 
    REJECTFIRSTTASK_NOT_SUPPORT CONSTANT TEXT := 'kesplus_workflow_1022'; 
    START_PROCESS_FAIL CONSTANT TEXT := 'kesplus_workflow_1023'; 
    CALLBACK_ERROR CONSTANT TEXT := 'kesplus_workflow_1024'; 
    NOT_SUPPORT_WITHDRAW CONSTANT TEXT := 'kesplus_workflow_1025'; 
    ENTER_DATA_NULL CONSTANT TEXT := 'kesplus_workflow_1026'; 
    SELECT_DELETE_DATA CONSTANT TEXT := 'kesplus_workflow_1027'; 
    PUBLISHED_PROCESS_NOT_DELETE CONSTANT TEXT := 'kesplus_workflow_1028'; 
    ACTIVE_PROCESS_NOT_DELETE CONSTANT TEXT := 'kesplus_workflow_1029'; 
    ID_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1030'; 
    MODELER_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1031'; 
    PROCESS_TYPE_ERROR CONSTANT TEXT := 'kesplus_workflow_1032'; 
    ACTIVE_PROCESS_NOT_UPDATE CONSTANT TEXT := 'kesplus_workflow_1033'; 
    PROCESS_VERSION_ERROR CONSTANT TEXT := 'kesplus_workflow_1034'; 
    PROCESS_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1035'; 
    FORM_CODE_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1036'; 
    PROCESS_DEFINITION_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1037'; 
    PROCESS_DEFINITION_ERROR CONSTANT TEXT := 'kesplus_workflow_1038'; 
    PROCESS_KEY_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1039'; 
    MODELER_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1040'; 
    PARSER_EX_ERROR CONSTANT TEXT := 'kesplus_workflow_1041'; 
    KESBPMNDATA_SUBMIT_ERROR CONSTANT TEXT := 'kesplus_workflow_1042'; 
    CONDITION_IS_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1043'; 
    TASKID_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1044'; 
    TASKID_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1045'; 
    TASKDEFKEY_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1046'; 
    NEXTTASKNODE_ERROR CONSTANT TEXT := 'kesplus_workflow_1047'; 
    ENDNODE_IS_NULL CONSTANT TEXT := 'kesplus_workflow_1048'; 
    PROCESS_DEFINITION_NOT_NULL CONSTANT TEXT := 'kesplus_workflow_1049'; 
    NEXTTASKDEF_ERROR CONSTANT TEXT := 'kesplus_workflow_1050'; 
    NEXTTASKDEFKEY_MORE CONSTANT TEXT := 'kesplus_workflow_1051'; 
    PROCESS_INSTANCE_ID_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1052'; 
    ASSIGNEE_USER_NOT_EXISTS CONSTANT TEXT := 'kesplus_workflow_1053'; 
    CALCULATE_ERROR CONSTANT TEXT := 'kesplus_workflow_1054'; 
    USER_TASK_ERROR CONSTANT TEXT := 'kesplus_workflow_1055'; 
    USER_REJECT_TASK_ERROR CONSTANT TEXT := 'kesplus_workflow_1056'; 
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."error_code" AS WRAPPED
/BI7rN81Kb9WpM8RmlhM/w==
END;

