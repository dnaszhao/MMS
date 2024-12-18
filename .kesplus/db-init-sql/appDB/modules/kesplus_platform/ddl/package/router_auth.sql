CREATE OR REPLACE PACKAGE "kesplus_platform"."router_auth" AUTHID CURRENT_USER AS
	_AUTH_FLAG_ATTR CONSTANT varchar := 'authFlag';
	_CURRENT_ROLES_ATTR CONSTANT varchar := 'currentRoles';
	_CURRENT_USER_ROLE CONSTANT varchar := 'current_db_user_role';
	PROCEDURE init_session(requestHeader jsonb);
	/**
	 * 根据用户授权
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE init_auth(request jsonb);
	/**
	 * 根据用户授权
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE grant_user_auth(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 根据api授权
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE revoke_user_auth(request INOUT JSONB, response INOUT jsonb);
	FUNCTION get_user_role_array(comeFrom TEXT, userId TEXT, deptId TEXT, tenantId text) RETURN TEXT[];
	FUNCTION get_user_role_member_array(comeFrom TEXT, userId TEXT, username TEXT, deptId text) RETURN TEXT[];
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."router_auth" AS WRAPPED
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
v/GFP64Kbj+c3ztTMa6y0zxOBCS+1Nf74qj4
END;
