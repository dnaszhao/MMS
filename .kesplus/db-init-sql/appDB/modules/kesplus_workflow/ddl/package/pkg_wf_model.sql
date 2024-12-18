CREATE OR REPLACE PACKAGE "kesplus_workflow"."pkg_wf_model" AUTHID CURRENT_USER AS
	/**
	 * restful-api接口实现
	 * @Description 新增流程模板/流程模板版本
	 * @param text jsonData 实体参数
	 * @return json 新增的流程模板数据
	 */
    FUNCTION add_modeler(jsonData text) RETURN JSON;
	/**
	 * restful-api接口实现
	 * @Description 批量删除流程模板
	 * @param varchar ids id,多个id用英文逗号连接
	 * @return boolean 删除结果
	 */
    FUNCTION del_modelers(ids varchar) RETURN boolean;
	/**
	 * restful-api接口实现
	 * @Description 批量删除流程模板的版本
	 * @param varchar ids id,多个id用英文逗号连接
	 * @return boolean 删除结果
	 */
    FUNCTION del_modeler_versions(ids varchar) RETURN boolean;
    
	/**
	 * restful-api接口实现
	 * @Description 修改流程模板/流程模板版本
	 * @param text jsonData 实体参数
	 * @return json 修改的流程模板数据
	 */
    FUNCTION update_modeler(jsonData text) RETURN JSON;
    /**
	 * restful-api接口实现
	 * @Description 流程模板详情
	 * @param text id_ 
	 * @return json流程模板详情
	 */
    FUNCTION get_modeler_by_id(id_ varchar) RETURN JSON;
     /**
	 * restful-api接口实现
	 * @Description 流程模板详情
	 * @param processKey 流程key 
	 * @param processVersion 流程版本
	 * @return json流程模板详情
	 */
    FUNCTION get_modeler_by_version(processKey varchar, processVersion int) RETURN JSON;
     /**
	 * restful-api接口实现
	 * @Description 模板模板启用或挂起
	 * @param id_ id
	 * @param enabled 流程可用标志
	 * @return boolean
	 */
    FUNCTION disabled_modeler(id_ varchar, enabled int) RETURN boolean;
    FUNCTION page_modeler(jsonData text) RETURN JSON;
    FUNCTION page_modeler_versions(jsonData text) RETURN JSON;
    FUNCTION active_modeler_versions(id varchar) RETURN boolean;
    FUNCTION get_xml_content(processKey varchar) RETURN varchar;
    /**
     * 获取流程配置,若版本为空,则获取当前激活版本
     * @param processKey varchar 流程标识
     * @param processVersion int 流程版本,可为空
     * @return json 版本集合
     */
    FUNCTION list_config_by_process(processKey varchar, processVersion int) RETURN JSON;
    FUNCTION list_config_by_form(formCode varchar) RETURN JSON;
    FUNCTION list_process_variables() RETURN JSON;
    FUNCTION list_process_buttons() RETURN JSON;
    _SCHEMA_NAME CONSTANT VARCHAR := 'kes_bpmn';
    _TB_NAME CONSTANT VARCHAR := 'kes_bpmn_modeler';
    _PK_COLUMN CONSTANT VARCHAR := 'ID';
    _CONDITIONS json := '[{"blurry":"process_name","queryType":"Like","keyName":"processName"},{"blurry":"process_type","queryType":"=","keyName":"processType"},{"blurry":"deployed","queryType":"=","keyName":"deployed"}]'::json;
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."pkg_wf_model" AS WRAPPED
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
END;
