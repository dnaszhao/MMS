CREATE OR REPLACE PACKAGE "kesplus_platform"."router_exception" AUTHID CURRENT_USER AS
	/**
	 *
		{
		  "ex_array": [
		    {
		      "ex_code": "exCode",
		      "ex_msg": "exMsg",
		      "ex_desc": "exDesc"
		    }
		  ],
		  "ex_code": "exCode",
		  "ex_msg": "exMsg",
		  "ex_title": "exTitle",
		  "ex_sql_content": "exSqlContent",
		  "ex_url": "exUrl",
		  "ex_stack": "exFormatStack",
		  "ex_responsible_person": "exResponsiblePerson"
		}
	 *
	 */
    /**
     * @Description 根据异常编码获取异常的国际化信息
     * @name kesplus_manage.router_exception.getMessage
     * @Examples select kesplus_manage.router_exception.getMessage(code);
     * @param code IN text 异常编码
     * @return TEXT 异常描述
     */
	FUNCTION getMessage(code text) RETURN text;
	/**
	 * 执行结果
	 * code_		执行状态 数值类型
	 * return		返回执行结果,包括执行状态,信息,无返回值
	 */
	PROCEDURE getMessage(code INOUT TEXT, msg OUT TEXT);
	/**
	 * 获取异常信息,返回json格式数据
	 * state_		异常状态编号
	 * message_		异常描述信息
	 * error_stack	异常堆栈信息
	 * return		返回执行结果,包括执行状态,信息,返回值(异常编号+异常描述)
	 */
	FUNCTION result_exception(state TEXT, message TEXT, errorStack text) RETURN json;
	/**
	 * 抛出异常,异常信息类型为json,
	 * state_		异常状态编号
	 * message_		异常描述信息
	 * error_stack	异常堆栈信息
	 */
	PROCEDURE raise_exception(state TEXT, message TEXT, errorStack text);
	/**
	 * 抛出异常,并根据编号获取相关信息,然后和描述信息拼接
	 * code_		异常状态编号
	 * desc_		异常描述
	 */
	PROCEDURE throw_exception(code TEXT, desc_ TEXT DEFAULT NULL);
	/**
     * 抛出异常,直接抛出编号和描述信息
     * code_		异常状态编号
     * desc_		异常描述
     */
    PROCEDURE throw_exception2(code TEXT, desc_ TEXT);
	FUNCTION get_ex() RETURN jsonb;
	FUNCTION fail(code TEXT, message TEXT DEFAULT null) RETURN JSON;
	/**
	 * 语言,默认为中文
	 */
	_LANG CONSTANT varchar := 'zh-CN';
	/**
	 * 通过操作失败code code值,200
	 */
	_CODE_FAIL CONSTANT TEXT := '500';
	/**
	 * 请求返回信息, 执行失败后无具体返回消息或未配置
	 */
	_MSG_EXCEPTION CONSTANT TEXT := '未知异常';
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."router_exception" AS WRAPPED
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
GiP7R0IV
END;

