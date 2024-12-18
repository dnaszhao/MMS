CREATE OR REPLACE PACKAGE "kesplus_platform"."kes_plus_pkg_member" AUTHID CURRENT_USER AS
	/**
     * @Description 分页获取当前应用的成员用户
     * @name "kesplus_platform"."kes_plus_pkg_member".page_kes_appuser
     * @Examples call "kesplus_platform"."kes_plus_pkg_member".page_kes_appuser(page, size, blurry, enabled);
     * @param page IN INTEGER 页数
     * @param size IN INTEGER 每页数量
     * @param blurry IN VARCHAR 用户名或者邮件地址
     * @param enabled IN VARCHAR 用户状态
     * @return JSON 修改结果
     */
	FUNCTION page_kes_appuser(page integer, size integer, blurry varchar,enabled varchar) RETURN JSON;
	/**
	 * 分页获取某一应用未关联的成员用户,
	 * @page  当前获取的页数
	 * @SIZE  每页数据的数量
	 * @blurry 关键字,用来筛选用户的姓名或者用户名
	 * @id 应用id
	 */
    FUNCTION page_user_unrelated(blurry varchar, id varchar) RETURNS JSON;
	/**
	 * 分页获取某一成员用户未关联的应用,
	 * 若当前操作人为管理员,则范围为所有的应用
	 * 否则,为当前操作人创建的应用
	 * @page  当前获取的页数
	 * @SIZE  每页数据的数量
	 * @blurry 关键字,用来筛选应用的名称或者编号
	 * @id 成员用户id
	 */
    FUNCTION page_app_unrelated(page integer, SIZE integer, blurry varchar, id varchar) RETURNS JSON;
	/**
	 * 分页获取某一成员用户已关联的应用,
	 * @page  当前获取的页数
	 * @SIZE  每页数据的数量
	 * @blurry 关键字,用来筛选应用的名称或者编号
	 * @id 成员用户id
	 */
    FUNCTION page_app_related(page integer, SIZE integer, blurry varchar, id varchar) RETURNS JSON;
    /**
	 * 分页获取某一成员用户信息及关联的应用信息,
	 * @param id  用户id
	 * @param appId 应用id
	 */
    FUNCTION get_kesuser_by_id(id varchar, appId varchar) RETURNS JSON;
    /**
     * 为平台添加成员用户,
     * 若成员用户信息中包含id,则使用该id
     * 否则,自动生成uuid作为数据主键。
     * 若无对应用户角色,则为该用户生成用户角色
     * @jsonData 成员用户信息
     */
	function add_plat_member(jsonData varchar) return boolean;
    /**
     * 为应用添加成员用户,
     * 使用成员用户信息中的id作为记录主键
     * 即,应用的成员用户完全复制平台成员用户,包括id
     * @jsonData 成员用户信息
     */
	function add_app_member(jsonData varchar) return boolean;
	/**
	 * 修改成员用户信息
	 * @jsonData 修改后的成员用户信息
	 */
	function modify_member(jsonData varchar) return boolean;
    /**
	 * 修改应用中成员信息
	 * @sys_user 用户信息
	 * @git_user 用户git信息
	 * @app_user 用户与应用关联信息
	 */
	function modify_app_member(sys_user varchar, git_user varchar, app_user varchar) return boolean;
    /**
     * @Description 启用成员用户，非管理员不能修改成员用户状态；自己不能修改自己用户状态。
     * @name "kesplus_platform"."kes_plus_pkg_member"
     * @Examples call "kesplus_platform"."kes_plus_pkg_member"(id);
     * @param id IN VARCHAR 用户id
     * @return BOOLEAN 修改结果
     */
	FUNCTION enable_member(id varchar) RETURN boolean;
    /**
     * @Description 禁用成员用户，非管理员不能修改成员用户状态；自己不能修改自己用户状态；不能修改kesplus用户状态。
     * @name "kesplus_platform"."kes_plus_pkg_member"
     * @Examples call "kesplus_platform"."kes_plus_pkg_member"(id);
     * @param id IN VARCHAR 用户id
     * @return BOOLEAN 修改结果
     */
	FUNCTION disable_member(id VARCHAR) RETURN BOOLEAN;
    /**
	 * 启用成员用户
	 * @id 成员用户记录id
	 */
	function enable_app_member(id varchar) return boolean;
	/**
	 * 停用成员用户
	 * @id 成员用户记录id
	 */
	function disable_app_member(id varchar) return boolean;
	/**
	 * 平台为应用关联成员用户
	 * @id 用户id,kes_sys_user表主键
	 * @app_id 应用id,kes_application表主键
	 * @relate_id  关联id,kes_appuser表主键
	 */
	function relate_plat_member(id varchar, app_id varchar, relate_id varchar, dbFlag int) return JSON;
	/**
	 * 应用为应用关联成员用户
	 * @app_id 应用id,kes_application表主键
	 * @sys_user 用户信息
	 * @git_user 用户git信息
	 * @app_user 用户与应用关联信息,若为空,则说明为手动关联操作,否则,为自动同步操作
	 */
	function relate_app_member(jsonData TEXT) return JSON;
	/**
	 * 解除应用关联的成员用户
	 * @relate_id 关联id,kes_appuser表主键
	 */
	function unrelate_member(relate_id varchar, dbFlag int) return boolean;
	function unrelate_app_member(relate_id varchar, dbFlag int) return boolean;
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."kes_plus_pkg_member" AS WRAPPED
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
XiARRg==
END;
