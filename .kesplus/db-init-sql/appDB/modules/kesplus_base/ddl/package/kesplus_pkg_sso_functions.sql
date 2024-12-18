CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso_functions" AUTHID CURRENT_USER AS
	 /**
     * @Description 加密数据使用base64格式解密
     * @param resourceCode 第三方平台编码
     * @param accessToken token
     * @param ssoData 请求数据
     * @param res 解密结果
     */
	PROCEDURE base64_decrypt_from(resourceCode text, accessToken text, ssoData INOUT text, res OUT jsonb);
	/**
     * @Description 使用base64格式加密
     * @param resourceCode 第三方平台编码
     * @param encryptToken 加密token
     * @param ssoResult 加密后数据
     */
	PROCEDURE base64_encrypt_to(resourceCode text, ssoResult INOUT text, encryptToken OUT text) ;
    /**
     * @Description 请求数据解密
     * @param ssoData 解密数据
     */
	PROCEDURE decrypt_sso_data(ssoData INOUT text);
    /**
     * @Description 返回数据加密
     * @param ssoResult 加密后数据
     */
	PROCEDURE encrypt_sso_result(ssoResult INOUT text);
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso_functions" AS WRAPPED
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
bEqzvuIS5D1IVE6s
END;

