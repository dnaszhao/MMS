CREATE OR REPLACE PACKAGE "kesplus_platform"."validate_util" AUTHID CURRENT_USER AS
    /**
     * 判断是否为数字或英文字母
     */
    FUNCTION isCharDigit(str text) RETURNS boolean;
    /**
     * 判断是否为日期
     */
    function isDate(str text) returns boolean;
    /**
     * 判断是否为数字
     */
    function isDigit(str text) returns boolean;

    /**
     * 判断是否为json类型(数字类型处理有问题)
     */
    function isJson(str text) returns boolean;

    /**
     * 判断是否为time类型
     */
    function isTime(str text) returns boolean;

    /**
     * 判断是否为timestamp类型
     */
    function isTimestamp(str text) returns boolean;

    FUNCTION isCommonResult(res text) RETURN boolean;
    /**
     * 密码规则校验
     * 必须包含字母和数字,至少一个大写字母、一个小写字母和一个特殊字符，长度至少包含8个字符，
     */
    function password_check(str text) return boolean;
    /**
     * 字符校验
     * 字母开头、不能全部为数字,不能有特殊字符
     */
    function text_check(str text) return boolean;
end;


CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."validate_util" AS WRAPPED
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
4320fJybg28OJA==
END;

