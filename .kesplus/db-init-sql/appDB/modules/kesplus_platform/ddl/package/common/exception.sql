-- "kesplus_platform"."exception" definition

CREATE OR REPLACE PACKAGE "kesplus_platform"."exception" AUTHID CURRENT_USER AS
    error_template text := '{"code":%s,"message":"%s"}';
    /**
     * @Description 设置异常返回信息
     * @Examples raise exception '%',"kesplus_platform".exception.set(code,message);
     * @param code 错误码
     * @param message 错误描述信息
     * @Return text
     */
    function set(code int,message varchar) return text;
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."exception" AS
    /**
     * @Description 设置异常返回信息
     * @Examples raise exception '%',"kesplus_platform".exception.set(code,message);
     * @param code 错误码
     * @param message 错误描述信息
     * @Return text
     */
    function set(code int,message varchar) return text as
    declare
        res text;
    begin
        res := format(error_template,code,message);
        --raise exception '%',res;
        return res;
    end;
end;