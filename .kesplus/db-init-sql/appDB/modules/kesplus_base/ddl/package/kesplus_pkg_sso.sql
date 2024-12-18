CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso" AUTHID CURRENT_USER AS
    /**
     * @Description 新增配置
     * @param jsonData 配置信息
     * @Return 配置详情
     */
	FUNCTION add(jsonData text) RETURN JSONB ;
    /**
     * @Description 修改配置
     * @param jsonData 配置信息
     * @Return 配置详情
     */
	FUNCTION update(jsonData text)RETURN JSONB ;
    /**
     * @Description 删除配置
     * @param id 配置id
     * @Return boolean
     */
	FUNCTION delete(id text) RETURN boolean;
    /**
     * @Description 获取配置
     * @param id 配置id
     * @Return 配置信息
     */
	FUNCTION get_sso_config(id text) RETURN JSONB;
    /**
     * @Description 配置详情
     * @param id 配置id
     * @Return 配置详情
     */
	FUNCTION get_by_id(id text) RETURN JSONB;
    /**
     * @Description 列表查询配置
     * @param blurry 查询内容
     * @param type 类型
     * @param enabled 状态
     * @param page 当前页
     * @param size 每页个数
     * @Return 岗位列表
     */
	FUNCTION page_sso_config(page int, SIZE int, blurry text, TYPE int, enabled int) RETURN JSONB;
    /**
     * @Description 使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @Return 解密数据
     */
	FUNCTION decrypt_from_token(resourceCode text, accessToken text) RETURN JSONB;
    /**
     * @Description 加密数据使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param accessToken token
     * @param ssoData 请求数据
     * @param res 解密结果
     */
	PROCEDURE decrypt_from(resourceCode text, accessToken text, ssoData INOUT text, res OUT jsonB);
    /**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param 加密后数据
     */
	FUNCTION encrypt_to_token(resourceCode text) RETURN text;
    /**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @param ssoResult 加密后数据
     */
	PROCEDURE encrypt_to(resourceCode text, ssoResult INOUT text, encryptToken OUT text);
    /**
     * @Description 变更配置状态
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @Return 解密数据
     */
	FUNCTION change_sso_enabled(id text, enabled int) RETURN boolean;
    /**
     * @Description 获取模式名
     * @Return 模式数组
     */
	FUNCTION list_schemas() RETURN text[];
    /**
     * @Description 获取模式下包名
     * @param schemaName 模式名
     * @param configType 配置类型
     * @Return 包名数组
     */
	FUNCTION list_packages(schemaName text, configType int) RETURN text[];
    /**
     * @Description 获取包下的函数或存储过程
     * @param schemaName 模式名
     * @param configType 配置类型
     * @param packageName 包名
     * @Return 函数名数组
     */
	FUNCTION list_functions(schemaName text, packageName text, configType int) RETURN text[];
    /**
     * @Description 数据唯一校验
     */
	PROCEDURE check_unique(beanObj JSONB, TYPE int DEFAULT 0);
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso" AS WRAPPED
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
T0s/0vMh9Tk=
END;

