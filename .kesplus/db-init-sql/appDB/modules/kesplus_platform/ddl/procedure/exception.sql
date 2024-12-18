--包装异常存储过程
create or replace procedure "kesplus_platform"."exception"(code text) as
declare
begin
    call "kesplus_platform"."router_exception".throw_exception(code);
end;
--包装异常存储过程 输出自定义提示信息
create or replace procedure "kesplus_platform"."exception"(code text,msg text) as
declare
begin
    call "kesplus_platform"."router_exception".throw_exception2(code,msg);
end;

/**
 * 异常 支持占位符的动态生成提示信息
 * code		异常状态编号
 * pram_array 参数值（参数值顺序请与占位符顺序一致）
 * 示例：定义提示信息占位符使用%  例如：密码错误，还有%次机会
 * 执行>kes_plus.exception('custom_100', array['1']);
 * 输出>密码错误，还有1次机会
 */
CREATE OR REPLACE PROCEDURE kesplus_platform.exception(code text, p_array varchar[]) AS
DECLARE
	msg TEXT;
	p varchar;
BEGIN
	IF p_array IS NULL THEN
		call "kesplus_platform"."router_exception".throw_exception(code);
	END IF;
	msg := "kesplus_platform"."router_exception".getMessage(code);
	FOREACH p IN ARRAY p_array LOOP
		msg := regexp_replace(msg,'%',p,'p');
	END LOOP;
    call "kesplus_platform"."router_exception".throw_exception2(code,msg);
end;
