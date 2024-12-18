CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_serial_numbers" AUTHID CURRENT_USER AS
    /**
     * @Description 添加序列号
     * @param jsonData 序列号数据
     * @Return 序列号详情
     */
    function add(jsonData text) return json;
    /**
     * @Description 删除序列号
     * @param ids 序列号id 逗号分隔
     * @Return null
     */
    function del(ids varchar) return json;
    /**
     * @Description 更新序列号
     * @param jsonData 序列号数据
     * @Return 序列号详情
     */
    function update(jsonData text) return json;
    /**
     * @Description 查询详情
     * @param id_ 序列号id
     * @Return 序列号详情
     */
    function get_by_id(id_ varchar) return json;
    /**
     * @Description 查询序列号列表
     * @param jsonData 过滤条件
     * @Return 序列号列表
     */
    function list(jsonData text) return json;
    /**
     * @Description 查询序列号分页列表
     * @param jsonData 过滤条件
     * @Return 序列号列表
     */
    function page(jsonData text) return json;
    /**
     * @Description 根据code获取制定模板的流水号
     * @param code VARCHAR 模板code
     * @Return json
     */
    function generate_serial_number(_code VARCHAR) RETURNS json;
    /**
     * @Description 根据code获取制定模板的流水号
     * @param code VARCHAR 模板code
     * @Return 字符串
     */
    function generate(_code VARCHAR) RETURNS text;
    TB_NAME VARCHAR := 'kesplus_serial_numbers';
    PK_COLUMN_NAME VARCHAR := 'id';
    CONDITIONS json := '[{"blurry":"code","queryType":"like","keyName":"code"},{"blurry":"name","queryType":"like","keyName":"name"}]'::json;
end;

CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_serial_numbers" AS WRAPPED
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
jli1jpF1XiARRg==
END;

