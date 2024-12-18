INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
	 ('a2eb1ca1615048ac876e3577ebf9ef2d','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_dept','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_dept" AUTHID CURRENT_USER AS
	 /**
     * @Description 组织新增
     * @param jsonData 组织信息
     * @Return 组织详情
     */
	FUNCTION add(jsonData text) return JSON;
    /**
    * @Description 组织删除
    * @param id 组织id
    */
    PROCEDURE delete(id varchar);
    /**
     * @Description 更新组织信息
     * @param jsonData 组织信息
     * @Return 组织详情
     */
    FUNCTION update(jsonData text) return JSON;
    /**
     * @Description 根据id更新组织信息
     * @param jsonData 组织信息
     * @Return 组织详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 修改组织上级组织
     * @param newPid 新父级id
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION move_dept(newPid varchar, id varchar) RETURN boolean;
	/**
     * @Description 组织关联用户
     * @param uid 用户id
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION add_dept_user(id varchar, uid varchar) RETURN boolean;
	/**
	 * 获取组织
	 * 若deptName有值,则筛选整个树,
	 * 否则,为懒加载,即,获取当前pid的子组织
	 */
	FUNCTION tree_dept_lazy(pid varchar, deptName varchar) RETURN JSON;
	/**
     * @Description 通过组织名称筛选,或者组织树
     * @param enabled 状态
     * @param deptName 组织名称
     * @Return 组织详情
     */
	FUNCTION get_dept_by_name(enabled varchar, deptName varchar) RETURN JSON;
    /**
     * @Description 获取当前关联组织
     * @param id 状态
     * @param deptName 组织名称
     * @param enabled 状态
     * @Return 组织树形列表
     */
	FUNCTION tree_current_cascade_dept(id text, deptName text, enabled int) RETURN JSON;
    /**
     * @Description 获取树形列表
     * @param ids 组织id 多个 逗号分隔
     * @param id 组织id
     * @Return 组织树形列表
     */
	FUNCTION tree_part(id text, ids TEXT[]) RETURN JSON;
	/**
     * @Description 获取当前父级id的子组织,可以通过状态筛选
     * @param enabled 状态
     * @param id 组织id
     * @Return 组织列表
     */
	FUNCTION list_current_children (id varchar, enabled varchar) RETURN JSON;
	/**
     * @Description 修改组织状态,启用/停用
     * @param enabled 状态
     * @param id 组织id
     * @Return boolean
     */
	FUNCTION change_dept_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 获取组织详细信息
     * @param deptId 组织id
     * @Return 详细信息
     */
	FUNCTION get_company(deptId varchar) RETURN JSON;
	/**
     * @Description LDAP导入逻辑
     * @param jsonData 导入数据
     * @Return 导入计数
     */
	FUNCTION batch_insert_dept(jsonData text) return json;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_dept" AS WRAPPED
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
a6wPy2geoDIMTF7kLHTI9YFbdw==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',1),
	 ('125bcaea3bac47f7a2189bbb69137fed','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_dictionary','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_dictionary" AUTHID CURRENT_USER AS
	/**
     * @Description 添加字典
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION add(jsonData text) RETURN JSON;
	/**
     * @Description 批量添加
     * @param jsonData 字典信息
     * @Return null
     */
	FUNCTION add_batch(jsonData text) RETURN JSON;
	/**
     * @Description 更新字典
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION update(jsonData text)RETURN JSON;
/**
 * @Description 删除字典-批量
 * @param ids 字典id 逗号分隔
 * @Return boolean
 */
FUNCTION delete(ids varchar) RETURN boolean;
	/**
     * @Description 删除字典
     * @param ids 字典id
     */
	PROCEDURE del(id varchar);
    /**
     * @Description 唯一检查
     */
	FUNCTION check_form_unique(id varchar, pid varchar, name varchar, code varchar) RETURN boolean;
	/**
     * @Description 查询字典详情
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_dictionary(id varchar) RETURN JSON;
    /**
     * @Description 查询字典详情
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
    /**
     * @Description 查询字典详情 -根据code查询
     * @param id 字典id
     * @Return 字典详情
     */
	FUNCTION get_by_code(code varchar) RETURN JSON;
	/**
     * @Description 添加字典值
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION add_val(jsonData text) RETURN JSON;
	/**
     * @Description 更新字典值
     * @param jsonData 字典信息
     * @Return 字典详情
     */
	FUNCTION update_val(jsonData text)RETURN JSON;
	/**
     * @Description 删除字典所有值
     * @param dictionaryId 根节点id
     * @Return boolean
     */
	FUNCTION delete_val_by_dictionary(dictionaryId varchar) RETURN boolean;
    /**
     * @Description 查询字典值
     * @param id 字典id
     * @Return 字典值
     */
	FUNCTION get_val_by_id(id varchar) RETURN JSON;
	/**
     * @Description 获取字典值详细情况
     * @param id 字典id
     * @Return 字典值详细情况
     */
	FUNCTION get_dictionary_val(id varchar) RETURN JSON;
    /**
     * @Description 获取字典
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典详情
     */
	FUNCTION get_one_by_val(code varchar, val varchar) RETURN JSON;
	/**
     * @Description 根据字典编号和值获取描述
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典描述
     */
	FUNCTION get_name_by_val(code varchar, val varchar) RETURN varchar;
	/**
     * @Description 根据字典编号和值获取完整描述
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典完整描述
     */
	FUNCTION get_fullname_by_val(code varchar, val varchar) RETURN varchar;
	/**
     * @Description 根据字典编号和值获取描述数组
     * @param code 字典编码
     * @param val 字典值
     * @Return 字典描述数组
     */
	FUNCTION get_names_by_val(code varchar, val varchar) RETURN varchar[];
	/**
     * @Description 根据字典编号、描述、上级值获取当前值
     * @param code 字典编码
     * @param name 字典名称
     * @param parentVal 上级字典值
     * @Return 字典描述
     */
	FUNCTION get_val_by_name(code varchar, name varchar, parentVal varchar) RETURN varchar;
	/**
     * @Description 根据编号和上级值获取值集
     * @param code 字典编码
     * @param filters 过滤数据
     * @param parentVal 上级字典值
     * @Return 字典列表
     */
	FUNCTION list_by_parent_val(code varchar, parentVal varchar, filters JSON) RETURN JSON;
    /**
     * @Description 根据根节点id和上级值获取值集
     * @param dictionaryId 字典根节点id
     * @param filters 过滤数据
     * @param parentId 上级字典id
     * @Return 字典列表
     */
	FUNCTION list_by_parent(dictionaryId varchar, parentId varchar, filters JSON) RETURN JSON;
    /**
     * @Description 查询字典树形列表
     * @param dictionaryId 字典根节点id
     * @param filters 过滤数据
     * @param parentId 上级字典id
     * @param maxLevel 最大层级
     * @Return 字典树形列表
     */
	FUNCTION tree_by_parent(dictionaryId varchar, parentId varchar, maxLevel int, filters JSON) RETURN JSON;
	/**
     * @Description 树状查询字典值集
     * @param code 字典编码
     * @param filters 过滤数据
     * @Return 字典树形列表
     */
	FUNCTION tree_by_code(code varchar, filters JSON) RETURN JSON;
	/**
     * @Description 分页查询字典-树形
     * @param page 当前页
     * @param size 每页大小
     * @param blurry 过滤内容
     * @Return 字典树形列表
     */
	FUNCTION page_for_tree(page int, size int, blurry varchar) RETURN JSON;
	/**
     * @Description 分页查询字典
     * @param jsonData 查询数据
     * @Return 字典分页数据
     */
	FUNCTION page_dictionary(jsonData text) RETURN JSON;
    /**
     * @Description 字典唯一校验
     */
	PROCEDURE check_unique(beanObj JSON, TYPE_ int DEFAULT 0);
    /**
     * @Description 字典值唯一校验
     */
	PROCEDURE check_unique_val(beanObj JSON, TYPE_ int DEFAULT 0);
	/**
     * @Description 字典搜索树
     * @param jsonData 查询数据
     * @Return 字典树形列表
     */
	FUNCTION search_tree(jsonData text) RETURN JSON;
    /**
     * @Description 节点构造函数
     * @param jsonArray 总数据
     * @param pid 父级节点id
     * @param returnJson 组装后数据
     * @Return 字典树形列表
     */
	FUNCTION loop_node(jsonArray JSON,pid varchar,returnJson json) RETURN JSON;
    /**
     * @Description 根据字典编码以键值对的形式获取字典子集数据的值和名称
     * @param code 字典编码
     * @Return {值：名称}
     */
	FUNCTION get_val_name_pairs(code$ varchar) RETURN JSON;
    _SCHEMA_NAME constant text := ''kesplus_base'';
    _TABLE_NAME constant text := ''kesplus_dictionary'';
    _PK_COLUMN constant text := ''id'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_dictionary" AS WRAPPED
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
2UIGO3fNwlb+BYaghthge6YpTpMqQ6mSjOubEVxlfNmMWH7GIuUQJYUMfe5t
jlxLMTkGDTD4uuKPCFWsxcIwSaD15azC8vLpfuXEsb+AzlmZ8Lnu51vBe5wD
nnkzNmDYynCrTcCn8VDVCTfe7QBf71IXvefkk7NOyoswLQlUbw1xUEhbHoj1
ouiPjPc0kiqMyFtvcvjysVc+mSgeRXFoHHbL4AW6F1uoPHzo+ali5E98P7oX
vRQ/aEgQUikfQd79/G8irFhdWHsGn977pxf0pS3Pod7YLcxVNXchW+HMV9oH
NE1lrHAB0kqZjdz3LWVskAf0IFA2E1FMMBxpuMnvsjsJvTwyJEFvVAnjs/ke
dnyX+oLRC2TZzRi5Gl/kdwp1n2IrO/bYG+7WGpZh+eA+LZf+a4CdRAIvLk5s
ykD2rOItAX5liwq/QFxL/QB8SuuO0ee86d73XPyqo+y+dHvCGyf/y0GRuTuz
0/OmSrIEcavTNtLlil5+BhctSupKuPeUUm8cGQje/dEbdTzAmhc72TegTxo0
IaWC9W6f1JBuKq0Pt3GDwJ0v58qqRgi7l8PtGymW21kH2mBrXK81PSPYqgjk
cD8xbmOlwBG8sheCwsvYH+dxI+nzSB8VZvq+s68gj8m78TiTtyjgdx/q6DhR
5zVhJZOx3y+D0xgzFfbZq4/k7gGWT7x42FIvSPkuD/vkZZ7wYjm/b9HFL+UD
IL3i5OY/lyCeKn9LJZxQw32Tdi0czY/V9pW756iqdPwv8C7tp8ixrrElCWPO
uN1gbiARVAW0GwlpSvG1M7WZ6mFwYNMfjGun6+7ITE4A39saKlHvFUWUkO9I
GYoKtz9RpK0+dFZ8jtUx5wycUTpXsCGQffutFeiwu165nxEz8Og36JPbLPxQ
Kw+hieUaE/hnMNRUNuaqoW34nhJ6tlI4KypmZMxMm1X23LT77w8spnPyKH82
yVJ6cIqm1PUikIzcpMTezcb2AAueusNGTAICoxFbSN+IyIhYWue89yOUOjrL
y+P8r+mXu1MX3/zbwDpHNoC7NxlZyGLdhQN5ETPw6Dfok9ss/FArD6GJ5dpN
wZy0hmGIeN2ViosxetEO5/bXaH6uRcyanx/CeK690pXPp+oHvyOCRgRl1P3H
BnKqCM/3/5IBWeDaw9ppyoU9fADJiPtHPqT68PC2I7gfNj/71IDOAoiOJvQB
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
8bwkJUpCnoKXInlajr8jX8tG5ZZK4bZwaJyv9mX0INFp6JNpr/iC4Ie1bXou
iLi3oCjiFdI0QAeeBkLLkQanT5vcKKt+6l4+swyZM7kTJt+dyY8/A15SQtxm
dSF7UjhWDaoRfnL20VtIXnMzb857M46iCrHh/rEMLQIf4pVuzF7xEQx/2NeE
X+4Ze+Iffnm74Ok/Y8Ang7CpMpb9dpzSTU+mbUzkHCbpSS625sz/Rj6zVU/2
6yeW52QlR/y3jpywZ7UvtLEWI16e3vbFmMgtPUgZ6wpQ+0tH7rcZhInNyTYr
YZCWyNU4XPZS5NJaGNKPljekrsVHtKnced/JBhKZomJt9/SJ9x9voh3U3Wti
v0eXX1PEOwEqVNMC2QixuBenmskWbK/z1lZwPRHOnKQyuYl/vLS9hxDG0cFn
Qh+bTEOBGMN/xG3VS558dToHqUonH1MvKR797LEGPhPfboyQxrjWVHuVTac9
bMf7fbXQP/a+b9bPfZraiSw0waNjgHtv8wd1OzQC/4wkYk6/ldSiL6vG+Ri7
EpxFdXa4F0PL8SwJRWPdUwR3UWSmNFRiwhYn0iQkGVdueWlumhjGVbIotdci
v4H9KOlouyFFTHIEJPCLuyH4xkErtLUXmjVTGMce5ti/5iTNDBqisY7ddrDG
T1XYp4gvnZNWRvjdd9rn+kpynldJRkQwSc6ub+B1GHj6L4rXx0k08QhES4lQ
cHRWCJuDzeX6CsMLcDDJ71COdHw86CRWaoTdGGH68Z4H4A8pt0O5+zVqG8Dq
grDStt1gnq58fr27v8rjHIwVZkFs+OIlBu/i1PO63KtAI3ttecy9+RCXeD2d
bYufwlUvzz85ikMkv1ddy2cpVPQ37t38W1lrRcCOPShCOpg9Jt229GCZruUh
cu7vq7LF89tU8OL2WvPee2TmIB5PynONwvDi9lrz3ntk5iAeT8pzjcLw4vZa
8957ZOYgHk/Kc43C8OL2WvPee2TmIB5PynONwg4y7T5fVkcL56Blhy46toZy
7khSky6LrkETVPPjgsKFbBd3paZ5WFsuzVhFelUwEtgbrV5LymgnDrx+g0im
POmUl7NtBAhU/lsZx0hxy5oJllEfdcVnRwYOm0tWQgjkAYax6MMfSDFF7n5x
4p+kd7yL7w8HFlYEevixwXQfluvHQcgBDw7JzQ+vMQR+X1Kf80shymuvQO+2
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
bBt/YA==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',2),
	 ('1e3eed789be44c0099ac62511bd8cf54','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_execution','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_execution" AUTHID CURRENT_USER AS
    /**
     * @Description 创建快照
     * @param code 编码
     * @Return boolean
     */
	FUNCTION create_snapshot(code text) RETURN boolean;
    /**
     * @Description 删除快照
     * @param id 快照id
     * @Return boolean
     */
	FUNCTION delete_snapshot(id text) RETURN boolean;
    /**
     * @Description 快照分页数据
     * @param pageIndex 页数
     * @param pageSize 每页数量
     * @param code 快照code
     * @param flag 标识
     * @param snapshotId 快照id
     * @param queryType 查询类型
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @Return 快照列表数据
     */
	FUNCTION page_snapshots(pageIndex int, pageSize int, code text, flag boolean, snapshotId text, queryType int, startTime text, endTime text) RETURN JSONb;
    /**
     * @Description SQL分析
     * @param snapshotId1 快照1
     * @param snapshotId2 快照2
     * @param moduleId 模块id
     * @param threshold 标识
     * @param limitSize 大小
     * @Return 分析数据列表
     */
	FUNCTION analysis_sql_execution(snapshotId1 text, snapshotId2 text, moduleId text, threshold int, limitSize int) RETURN JSONb;
	_MAX_DEEP_LEVEL INT := 99;
	_MAX_NODE_SIZE INT := 10;
	_SCHEMA_NAME varchar := ''kesplus_base'';
	_TB_SNAPSHOT VARCHAR := ''kesplus_snapshot'';
	_TB_EXECUTION VARCHAR := ''kesplus_query_execution'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_execution" AS WRAPPED
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
LlgLe5YCoUZgQQyLM86VCx+hvMbSk3ggLpF6SA==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',3),
	 ('eb9bb7d995514c7fbd3d0c3fe5a30c5d','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_job','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_job" AUTHID CURRENT_USER AS
	/**
     * @Description 新增岗位
     * @param jsonData 岗位信息
     * @Return 岗位详情
     */
    FUNCTION add(jsonData TEXT) RETURN JSON;
    /**
     * @Description 删除岗位
     * @param id 岗位id
     * @Return boolean
     */
    FUNCTION delete(id varchar) RETURN boolean;
	/**
     * @Description 修改岗位
     * @param jsonData 岗位信息
     * @Return 岗位详情
     */
    FUNCTION update(jsonData TEXT) RETURN JSON;
	/**
     * @Description 批量删除岗位
     * @param ids 岗位id 逗号分隔
     * @Return boolean
     */
    FUNCTION delete_batch(ids varchar) RETURN boolean;
	/**
     * @Description 岗位详情
     * @param id 岗位id
     * @Return 岗位详情
     */
    FUNCTION get_job(id varchar) RETURN JSON;
    /**
     * @Description 岗位详情
     * @param id 岗位id
     * @Return 岗位详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 更改岗位状态
     * @param id 岗位id
     * @param enabled 岗位状态
     * @Return boolean
     */
	FUNCTION change_job_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 列表查询岗位
     * @param ids 岗位id 逗号分隔
     * @param blurry 查询内容
     * @param jobType 岗位类型
     * @param enabled 岗位状态
     * @Return 岗位列表
     */
	FUNCTION list_job(ids varchar, blurry varchar, enabled varchar, jobType varchar) RETURN JSON;
	/**
     * @Description 分页查询岗位
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param jobType 工作类型
     * @param enabled 状态
     * @Return 岗位列表
     */
	FUNCTION page_job(page integer, SIZE integer, blurry varchar, enabled varchar, jobType varchar) RETURN JSON;
	/**
     * @Description 新增岗位分配
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION add_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 移除岗位关联
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION remove_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 修改岗位关联
     * @param id 岗位id
     * @param userDeptIds 用户组织id
     * @Return boolean
     */
	FUNCTION update_relation(id varchar, userDeptIds varchar) RETURN boolean;
	/**
     * @Description 修改岗位关联
     * @param ids 岗位id
     * @param deptId 组织id
     * @param userId 用户id
     * @Return boolean
     */
	FUNCTION update_relation_by_user(userId varchar, deptId varchar, ids varchar) RETURN boolean;
    /**
     * @Description 查询岗位列表-根据组织id
     * @param deptId 组织id
     * @Return 岗位列表
     */
    FUNCTION list_by_dept(deptId varchar) RETURN JSON;
    /**
     * @Description 查询岗位分页列表
     * @param page 当前页
     * @param size 每页个数
     * @param jobName 岗位名称
     * @param deptId 部门id
     * @Return 分页列表
     */
	FUNCTION page_job_by_dept(page integer, SIZE integer, jobName varchar, deptId varchar)RETURN JSON;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_job" AS WRAPPED
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
k5rP0AqEk78iG8N927IxngKe0+Fo8hniVSkGrSy8/4IcMatfzJoWkcDLZEaT
/aGmZ2p8R7/ZTbxXpiirUw70Lfx4vbmTlMb+04wpVdbeQzL02/DxJJnQLXIm
nA/r/qQkIsjm0yzUCmcWEsgbuXDd7OgSWonb5dLLXiFFYs9/5smPUvKK7mkQ
ZW2q/S2MsCd8ZclJvwXRTbm0KpRCMQe7OQfaEJLAxPo8g0mpK3/Dm5JeqfQm
AbTN9ocXPmlgfvXhs3YF3Noa6REqVgHasoO+u1h/XwpGixc0wKrWqZO9vjtf
ty2f0mdqUIdi0S9G1mOHB+uGaHzLetAm9SSmdF67As6+IUAeAEK/u8OMikIE
QlOkkiQGjDXKXvHAthXY0cEh0dCsEfNkXUdTSWrWBDbU1oKaZF95YaDwNwRW
fkbm0M6ymK51q7XSf8DJMIxKNCsye/9EdJ+ixJjky+XQ1GaP+22bSn+kmDv8
qqI+9VIv4dcRM/DoN+iT2yz8UCsPoYnl2k3BnLSGYYh43ZWKizF60Q7n9tdo
fq5FzJqfH8J4rr0RQ5lFC9vVotfnJVwClETpueOxAwaqfokyIEum3RBoMoe9
TltDi2onKHdalr50m4WisDYKNYz15srqReRmeKV0H/DaTC3W1abPeK5eegXo
sXxZ+tw68N+dMHz6cC1WKGmynOeldErNA0obIpuJ2cHXd3df3WCmPAsADVhv
BHkhDJ5rt7cG+IgYkxLxJA0J/QjfZJr7ZratD5rfCdeXqBuLoPUnJKW+yGPQ
L/LLWTlJ9RO7OdB9N+tUVF7lcTsndkODCSXRRv61Zlp0m7BMW63piIHGXlFM
jCUA6ukKl8+rI0L1ePLL2d3cWUMR1+mgXyf2lYp5Cz6K2MuyghXLF/unKPWz
GunZKYF4xSFCm+XXVe35uJSmoM7rea2NSXf4Ks6bVQG9ffIpgi4T0dLTga59
1Hzip/yYv77pYqBj1mbrHaJNZoUNK8hg2DZfmYDxTodM0ezpPPFPB34UUc5v
uWvC4ZE2R5+0eIPgZX/DRmR6BYy5mctlDoQe5mSBnBGUsdAp3I7G84jG5Lsg
fYVzCA8OsQ2IoCKA2F6WAndMdn0qUGDGz8RkzhqiNeRDgBmpFYvqno25jaS/
W8KG3glMRGr2yiJW+qiLL4BJ26A5o1t48lrnRDqnp1JzKdgOgnCnFbdSpYfV
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
iLjNHjh3AepoGRwtnblR5EJ8oFupdkCCWUiwppaZuyFUxWFfyAw34BmFv8lY
ict+d1sQl6Q5f1NGwUlOX4zdgz/7cZ2Q/1ao207OM554R+2ert0ct0n6xvEj
iXV2jjYWURXTfZNCHRoKwx8mK/4FhQE6FCe79rfNVX3LUr0OrPKWCX48kFAt
zIKNGSFfMi8KZ3zBRHmfo7B76PUS+3DqZANI4+sjjS/uN/vkSg5iJ+iGS/49
NsXTWdUDXjwhwOfXoYn/6luVnL0zy3jLSXmYqNMZm3Eo7SOkj0XQIzC8gjnO
eFPYK8JYNpOhV0foyQSUWSD+SlknLxW9RHxuBG2+b+oF06A+xsDhe+SbZXL0
vJZWD/SHHDaqPt5Dd+etS3TQ3YHYXfuDsaFH6hfrHPnssR745jHSa9leFAZX
p2AkIuXfFQNEUgHIjHxnR6BCO0E1x0U5AHQbo7kiZlu7hr3PYsOXDrZ4PUga
ayhXeccC3rgRvN+rqVvoy7vXpoorYULjOxcyZs0kO2DnBY/p37zQ3ue1rHZz
NcLgXKjZRoc7CFooBsnsHMc7kzNPaPCVcJznbdskx5qe7U49rYPm6ATM72VK
HQtB8a0vMF70yM4ZRTKsCQXRWtJjHcieMjLyYKbvOy1PqRVX0CvBwrdfAHpr
WHxNxEoyfOEQ+0JVLZ/yuGXhfNCGoSFOFKNWPFo0TuMfdEIXKOdlhUjAHjZM
PjQwFDF9C36R7OjQgSxkEf9V/s9JrhG2B4iTAxjl4IClshQT+9SKTy6PsIlQ
m8j8Q7EqRUQDqdegsnu3/GP+pfwQNnSC4EBwzwggJ+xmDTkBX8aY4xycAdUZ
8ebZeLnCR3e8jaYaFK1s3SJ61U8Jcz4stZyCKo+NbXnM9CW7Nmi0pXEQuaxp
825HL3lPlOBEdBGGn3MgpWzTMJMfvNny6YRV2yi4oUQ5iXBf3Jp/VXaTOr/9
PmcPl8vuaB6RXFu8O72urYTEPo22ohGKRC10IdNrGs0vCeCKfTTneeW3GB5Y
tnJqVwHuU/2Qb+Wch4ss0ZBR/p8jA92RROzeL9C9PVCpNz966MFRPSPwmni1
U+mBjqnVfxEGg547vfs/oke7Zub6azjdOtNnepEEqv4PEjM9Mr9nEcNTt8Yj
trVgmEpOFyCodmuDayiu/eGedBT+bvEdKjWHhe0Ua8iIBfW26XirS0k7fcfp
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
i4uaTmMEau9AQb01pgrcdepvoK6x2CuS21LqqUQ=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',4),
	 ('e21cad66701a449ea919040f330d417e','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_menu','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_menu" AUTHID CURRENT_USER AS
    /**
     * @Description 查询菜单详情
     * @param id 菜单id
     * @Return 菜单详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
	/**
     * @Description 修改菜单状态
     * @param id 菜单id
     * @param enabled 菜单状态值
     * @Return 菜单详情
     */
	FUNCTION change_menu_enabled(id varchar, enabled int) RETURN boolean;
	/**
     * @Description 查询当前用户菜单数据
     * @Return 菜单树形列表
     */
	FUNCTION tree_menus_by_owner() RETURN JSON;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_menu" AS WRAPPED
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
J3tsxzQhpko=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',5),
	 ('9edd0d534e1f4986aac68c650aa13a95','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_permission','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_permission" AUTHID CURRENT_USER AS
    /**
     * @Description 查询当前角色code数组
     * @Return 角色code数组
     */
	FUNCTION list_by_owner() RETURN text[];
    /**
     * @Description 查询权限树形数据
     * @Return 权限树形数据
     */
	FUNCTION tree_all() RETURN jsonb;
    /**
     * @Description 根据表单编号获取表单下表字段的权限
     * @param formCode 表单编号
     * @param authType 权限类型,支持''SELECT'', ''UPDATE'', ''INSERT'', ''DELETE'',默认为''SELECT''
     * @param TYPE 查询模式 0-黑名单模式,其它-白名单模式
     * @Return 权限树形数据
     */
	FUNCTION list_field_permission(formCode TEXT, authType TEXT, TYPE int) RETURN text[];
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_permission" AS WRAPPED
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
pI5gC6YZmMIz8f/oPx/rcOw=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',6),
	 ('3e2926f76d9e4b8fa6e636db1cabf550','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_policy','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_policy" AUTHID CURRENT_USER AS
	/**
     * @Description 查询策略详情
     * @param id 策略id
     * @Return 策略详情
     */
	FUNCTION get(id TEXT) RETURN JSONB;
	/**
     * @Description 查询策略下级列表--懒加载
     * @param parentId 策略id
     * @param objType 节点类型
     * @Return 策略列表
     */
	FUNCTION list_children(parentId TEXT, objType TEXT) RETURN jsonb;
	/**
     * @Description 获取当前模块数据,tree状数据返回
     * @param moduleId 模块id
     * @Return 策略tree状数据
     */
	FUNCTION tree(moduleId TEXT) RETURN jsonb;
	/**
     * @Description 获取所有模块数据,tree状数据返回
     * @Return 策略tree状数据
     */
	FUNCTION tree_all() RETURN jsonb;
    /**
     * @Description 查询策略参数定义-分页数据
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @Return 策略定义列表
     */
	FUNCTION page_policy_param_define(page integer, size integer, blurry text) RETURN JSONB;
    /**
     * @Description 保存策略参数定义
     * @param jsonData 策略信息
     * @Return 策略定义id
     */
	FUNCTION save_policy_param_define(jsonData text) RETURN jsonb;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_policy" AS WRAPPED
7VIHUwRQPn/cyviuph/+xPrmvk1iuB1TDds6Bh1dNquPkbWMDNFvglSnMPsv
W8lrktCLmUr+A/LQHWYN4O4Fbfy0DkrfkTTD1iPZDR3MTLDXwNihNn6Wk0yT
ao02G6fyoh/aaUzz69HzQUz/LvHHWMGO24dd/5KZzsmCV7JlczJaxrJvuNDo
9FazxC8hMbEux9IpW5rv89dhzVnDlz80guVaSUpShGcVC+IdDP28q31gRjGI
/Kjx6RQhJAduguJFB4fUIZjoxGxQyUOpx2mmG/3SFoHv6kiVr934SFAlCsIZ
0jRmWxQZnl4aYFNNkykcEqhL32na2zGQQY1yfTPAKrdDlQCHEsrdEjyKOPmz
1t+lXJ+2rQ1siqH2NiM49yF6gm4wZKggHEygLpq1QXb9YP/weE1ZTmpFZ040
KPfFF99ZpaeRvOyinsJjPuOkkkUyeL8Y3bc2ynb64fhlI9qsO+4UuRGDE5GT
gyrgMnV6AoROcitlyL7nNTOTVtTGQdsqiftobsb3dRPDjH9SGeITDwSdW5hs
oDyoN1wgS6lbshAb63Enl+DblHt33wnNCck3G13Nm5uvnZ5mSuAM3tEwSiuZ
ZJ9TTcT5T64mjJA+ndXc/6xi70846GFzDCraVIifJNr10GQ8HNgaKN9teOjo
jdHUoZORdvQg4oxPGY8iWI/7CqHH+Gh394i3rIGcFD27PwIrsjdLI480/6Zi
xn8Rl6ikDMGk8eDp4/W7GoIj04T9foIikk7Rr6F0LXzjYxb+R5QuRtn2mWgy
F/08IjF+CvIRtQdQvK27z/2xjVvBPL0iAJxkHFcYHRScBzyG/OM/jNZpeS6r
jUTk6Nyq/QE5IsHmK5/CdiHw7uvQjP52wQioN190olxMscEuEuPsluZwxDR2
If8Hd0iWuam5z+yr8bmz7B5iqBCLAWQlIkpqfcKu7f7a7Zas5W7jDfTwMT7z
w9gV1rECLlNPTd9yuc9OfA0XVNxJkugGK9lY/k3zbphzjBYq5n04xcss37T5
Rxd5C4RYmoJcuCRd8O8X+YtGY1SrkuToDvHo6EP/6+0WYLxZ6ToJXpOfrPRQ
z6gy+PcaDtWDbiozTEDMufyry0iAz5E881AFZBLApcKZiHZ3e/AIuPMevABi
RXfD3WKUer89RPpeP9nGzYRHk4cgKERDKCjFNyxfrd/mjm5M1C9q0S6gd21F
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
eCL2BwoRBqfD5aA=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',7),
	 ('8376de5ef43f454083ebaa942383b434','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_role','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_role" AUTHID CURRENT_USER AS
    /**
     * @Description 添加角色
     * @param jsonData 角色数据
     * @Return 角色详情
     */
	FUNCTION add(jsonData text) RETURN jsonb;
    /**
     * @Description 删除角色
     * @param id 角色id
     * @Return boolean
     */
    FUNCTION delete(id text) RETURN boolean;
    /**
     * @Description 更新角色
     * @param jsonData 角色数据
     * @Return 角色详情
     */
    FUNCTION update(jsonData text) RETURN jsonb;
    /**
     * @Description 更新详情
     * @param id 角色id
     * @Return 角色详情
     */
    FUNCTION get(id text) RETURN jsonb;
    /**
     * @Description 更新详情
     * @param id 角色id
     * @Return 角色详情
     */
    FUNCTION get_with_auth(id text) RETURN jsonb;
    /**
     * @Description 模块授权
     * @param jsonData 角色数据
     * @Return boolean
     */
    FUNCTION grant_auth(jsonData TEXT) RETURN boolean;
    /**
     * @Description 用户授权
     * @param id 角色id
     * @param users 用户信息
     * @Return boolean
     */
    FUNCTION grant_user(id TEXT, users jsonb) RETURN boolean;
    /**
     * @Description 取消用户授权
     * @param id 角色id
     * @param userId 用户id
     * @param deptId 组织id
     */
    PROCEDURE revoke_user_role(id text, userId text, deptId text);
    /**
     * @Description 根据角色，查询当前角色关联的用户
     * @name "kesplus_base"."kesplus_pkg_role".list_user_by_role
     * @Examples select "kesplus_base"."kesplus_pkg_role".list_user_by_role(roleId, blurry, deptId);
     * @param roleId IN TEXT 当前角色ID
     * @param blurry IN TEXT 筛选字段，包括用户名、姓名、手机号
     * @param deptId IN TEXT 筛选字段，部门ID
     * @return JSONB 用户信息
     */
    FUNCTION list_user_by_role(roleId TEXT, blurry TEXT, deptId TEXT) RETURN JSONB;
    /**
     * @Description 用户分页列表-根据角色
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param roleId 角色id
     * @param deptId 部门id
     * @Return 用户信息列表
     */
    FUNCTION page_user_by_role(page integer, SIZE integer, roleId TEXT, blurry TEXT, deptId TEXT) RETURN JSONB;
    /**
     * @Description 角色分页列表-根据组织
     * @param page 当前页
     * @param size 每页个数
     * @param roleName 角色名称
     * @param deptId 部门id
     * @Return 角色信息列表
     */
    FUNCTION page_role_by_dept(page integer, SIZE integer, roleName TEXT, deptId TEXT)RETURN JSONB;
    /**
     * @Description 查询所有角色
     * @Return 角色列表
     */
    FUNCTION list_all_roles() RETURN jsonb;
    /**
     * @Description 获取当前用户角色
     * @Return 角色编码
     */
    FUNCTION get_current_role_codes() RETURN TEXT;
    /**
     * @Description 角色分页列表
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @Return 角色列表
     */
    FUNCTION page(page integer, SIZE integer, blurry TEXT) RETURN JSONB;
	/**
     * @Description 下级角色列表-懒加载
     * @param parentId 上级角色id
     * @param objType 节点类型
     * @Return 角色列表
     */
	FUNCTION list_children(parentId TEXT, objType TEXT) RETURN jsonb;
	/**
     * @Description 获取当前模块数据,tree状数据返回
     * @param moduleId 模块id
     * @Return 角色树形列表
     */
	FUNCTION tree(moduleId TEXT) RETURN jsonb;
	/**
     * @Description 获取所有模块数据,tree状数据返回
     * @Return 角色树形列表
     */
	FUNCTION tree_all() RETURN jsonb;
	FUNCTION tree_classify() RETURN jsonb;
end kesplus_pkg_role;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_role" AS WRAPPED
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
AAAAAAAAAAAAAAAA
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',8),
	 ('1789b94082bd41bb8b352651c186e640','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_serial_numbers','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_serial_numbers" AUTHID CURRENT_USER AS
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
    TB_NAME VARCHAR := ''kesplus_serial_numbers'';
    PK_COLUMN_NAME VARCHAR := ''id'';
    CONDITIONS json := ''[{"blurry":"code","queryType":"like","keyName":"code"},{"blurry":"name","queryType":"like","keyName":"name"}]''::json;
end;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_serial_numbers" AS WRAPPED
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
jli1jpF1XiARRg==
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',9),
	 ('3bf241290bc24db1a6503d53bb5f97bf','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_sso','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso" AUTHID CURRENT_USER AS
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
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso" AS WRAPPED
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
T0s/0vMh9Tk=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',10);
INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
	 ('42b415837fd54314a94d54beb87a610c','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_sso_functions','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_sso_functions" AUTHID CURRENT_USER AS
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
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_sso_functions" AS WRAPPED
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
bEqzvuIS5D1IVE6s
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',11),
	 ('e4ca636c2f4a45e085c8b6a431412d94','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kesplus_pkg_user','CREATE OR REPLACE PACKAGE "kesplus_base"."kesplus_pkg_user" AUTHID CURRENT_USER AS
	/**
	 * @Description 新增用户
	 * @param jsonData 用户信息
	 * @Return 返回用户详情
	 */
	FUNCTION add(jsonData text) return JSON;
    /**
	 * @Description 删除用户
	 * @param id 用户id
	 * @Return 无
	 */
    FUNCTION delete(id varchar) RETURN boolean;
    /**
	 * @Description 更新用户
	 * @param jsonData 用户信息
	 * @Return 返回用户详情
	 */
    FUNCTION update(jsonData text) RETURN JSON;
    /**
	 * @Description 根据用户id获取用户信息
	 * @param id 用户id
	 * @param deptId 组织id
	 * @Return 返回用户详情
	 */
    FUNCTION get_user(id varchar, deptId varchar DEFAULT NULL) RETURN JSON;
     /**
     * @Description 根据id查询用户详情
     * @param id 用户id
     * @Return 返回用户详情
     */
	FUNCTION get_by_id(id varchar) RETURN JSON;
    /**
     * @Description 根据用户名查询用户详情
     * @param username 用户名
     * @Return 返回用户详情
     */
	FUNCTION get_by_username(username varchar) RETURN JSON;
    /**
     * @Description 根据用户id和组织id删除用户
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION delete_user_dept(id varchar, deptId varchar) RETURN boolean;
    /**
     * @Description 设置默认组织
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION set_default_dept(id varchar, deptId varchar)RETURN boolean;
    /**
     * @Description 设置登录默认组织
     * @param id 用户id
     * @param deptId 部门id
     * @Return boolean
     */
	FUNCTION set_login_dept(id varchar, deptId varchar)RETURN boolean;
    /**
     * @Description 用户分页查询-根据组织id
     * @param page 当前页
     * @param size 每页个数
     * @param blurry 查询内容
     * @param enabled 启用状态
     * @param orderColumns 排序数据
     * @param deptId 部门id
     * @Return 用户信息列表
     */
	FUNCTION page_dept_user(page integer, SIZE integer, blurry varchar, enabled int, CASCADE boolean, deptId varchar, params json, orderColumns varchar)RETURN JSON;
    /**
     * @Description 用户列表查询
     * @param username 用户名
     * @param deptId 部门id
     * @Return 用户信息列表
     */
	FUNCTION list_user(username varchar, deptId varchar)RETURN JSON;
    /**
     * @Description 重置密码
     * @param id 用户id
     * @param pwd 新密码
     * @Return boolean
     */
	FUNCTION reset_password(id varchar, pwd varchar)RETURN boolean;
    /**
     * @Description 更新密码
     * @param oldPwd 旧密码
     * @param pwd 新密码
     * @Return boolean
     */
	FUNCTION update_password(oldPwd varchar, pwd varchar)RETURN boolean;
    /**
     * @Description 更新手机号
     * @param phone 手机号
     * @param pwd 密码
     * @Return boolean
     */
	FUNCTION update_phone(pwd varchar, phone varchar)RETURN boolean;
    /**
     * @Description 更新邮箱
     * @param email 邮箱
     * @param pwd 密码
     * @Return boolean
     */
	FUNCTION update_email(pwd varchar, email varchar)RETURN boolean;
    /**
     * @Description 用户登录
     * @param uuid 验证码key
     * @param captchaValue 验证码值
     * @param username 用户名
     * @param password 密码
     * @param email 邮箱
     * @param isRememberMe 是否记住
     * @Return token、用户信息
     */
	FUNCTION login(uuid varchar, captchaValue varchar, username varchar, password varchar, isRememberMe varchar) RETURN JSON;
    /**
     * @Description 内部用户登录
     * @param username 用户名
     * @param expireDay 超时时间
     */
	FUNCTION login(username varchar, expireDay int) RETURN JSON;
    /**
     * @Description ldap登录
     * @param username 用户名
     * @param password 密码
     * @Return token、用户信息
     */
	FUNCTION login_ldap(username varchar, password varchar) RETURN JSON;
    /**
     * @Description 变更登录组织
     * @param deptId 组织id
     * @Return token、用户信息
     */
	FUNCTION change_login_dept(deptId varchar) RETURN JSON;
    /**
     * @Description 获取用户token信息
     * @param deptId 组织id
     * @Return token、用户信息
     */
	FUNCTION user_login(userId varchar, deptId varchar DEFAULT NULL) RETURN JSON;
    /**
     * @Description 变更用户状态
     * @param deptId 组织id
     * @param enabled 状态
     * @param id 用户id
     * @Return token、用户信息
     */
	FUNCTION change_user_enabled(id varchar, deptId varchar, enabled int) RETURN boolean;
    /**
     * @Description 变更用户状态
     * @param deptId 组织id
     * @param enabled 状态
     * @param id 用户id
     * @Return token、用户信息
     */
	FUNCTION add_user_roles(id varchar, deptId varchar, roleIds varchar) RETURN boolean;
    /**
     * @Description 用户锁定检查
     * @param _username 用户名
     */
    procedure check_lock(_username varchar) ;
    function lock_user(userName varchar,isLock boolean,increment int default 100) return int;
    /**
     * @Description 批量插入用户信息
     * @param jsonData 用户信息
     * @Return 插入统计数据
     */
    FUNCTION batch_insert_user(jsonData text) return json;
    /**
     * @Description 根据当前部门id查询用户
     * @param userJson 用户信息
     * @Return user信息
     */
    FUNCTION get_user_top_dept(userJson json) RETURN varchar;
    /**
     * @Description 获取用户角色id
     * @param userId 用户id
     * @param deptId 组织id
     * @param tenantId 租户id
     * @Return 角色id
     */
    FUNCTION get_user_role_ids(userId varchar, deptId varchar, tenantId varchar) RETURN varchar[];
    /**
     * @Description 获取用户角色版本
     * @param userId 用户id
     * @param deptId 组织id
     * @Return 角色版本
     */
    FUNCTION get_user_role_version(userId varchar, deptId varchar) RETURN varchar;
    /**
     * @Description 获取用户分页列表-根据组织id
     * @param page 当前页
     * @param size 每页大小
     * @param deptId 组织id
     * @param realName 用户姓名
     * @Return 用户列表
     */
    FUNCTION page_user_by_dept(page integer, SIZE integer, realName varchar, deptId varchar)RETURN JSON;
    /**
     * @Description 根据组织id获取用户列表
     * @param pid 组织id
     * @Return 用户列表
     */
    FUNCTION get_child_dept_user(pid varchar) RETURN JSON;
    /**
     * @Description 根据用户id获取用户列表
     * @param ids 用户id 逗号分隔
     * @Return 用户列表
     */
    FUNCTION get_users_detail(ids varchar) RETURN JSON;
    LOGIN_ERROR_COUNT int := 5;
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kesplus_pkg_user" AS WRAPPED
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
UcL702wOnyQDUtgwWft8dSgtVjtQS6v+jeFa3hAsLqE83UqR9WJt1ianeNEu
lsqNqpmojCtYwsSxhP3wwQfHxf0KGBFzzIvyhyoOqHHZZFnX9aqwZRukza35
MG6MiTZP+7Y9kw9t3uSSmXqlyMKaKONzR4u/BEOCfraljI+6st5uzL60326y
YANjt99mAwA/6Hzvyp5+vFrSb9vNGZG1MFebT1Ddy4ZniC018kCnDBcWlOot
Zm18U0Y5uEU2HGGZIvTNp+GyypbcDLIZv2O5PFZML5krpOq6cMfsuipDkGLJ
v0GcmSjLq5bbPhxf+4k0HQeaF+cFE8Qi6eyjPBi3MhdnF4sAgHbCqHcrYa5k
koIcAH37qHD0oEZt1G5LUWLs1slgAbeuDFsWH9hoDnEyICy0Ze5MJ+q1KdtB
MVW8MWrbRfomJFeZpAN16tCZt3VWIAm92gqgnh4wG/ksbfI4jE81aIu2Bapn
IYEmhm0K3SutY8G2UmUN+W7kb4qI57T2evrdoT0W0jjarOu6QZz1cGlRIYaI
yULadnEFkCVFBbnnugy5P6LvDxMhNTzv8JY5/76BD9zPJselBwURyYtoasaf
QhqEPAegoPUnJKW+yGPQL/LLWTlJ9dWxsRMkPF4jwF1RtkdqmfnjGzI6pOa4
qqNzvHBCqV51pizdi7hSfTn4QDAoMBf1Rycj95qn10kq/tpnx2sMg2mp43KE
oDT9MX8jCxXGmRPJNtAWwUUCNk53/0VA0Mwd+PIW0e7lvOVAlNMB3Eytkv7Q
uLt4k5aWdlMayCM2I78MbULSmd0wEIPd+1kXBk9KVoqhYK21fToM+9cnp+m2
rDtTLKS6FnmQM9QAYBKSyXxHwaMwQDHG2Mo82r9+UgcC2ztaJf0pyKp+uE16
SiO1yRqybT+H1xTPGmK/OdzRnbF7VYNn7lav8d7Gesp6X3lnGkZAO34+i0CR
+OexR5SE8fbSqq3Bqklse0+9R/ga8rpav7cWkEWLV8PTq7YLtzVws+Ygv3Tq
INZXSdflkatpLoVT4pSk+I3W9qAFF/bSqQyNZxHDU7fGI7a1YJhKThcgqEYn
pdeaMrpWr9XyyqS4Z/DsVCbYLDNnd0gPK5D4bnIg50P8kfdBW5rOmQgAtHwT
85x7IVQ//DTewLIkCl9vYM3a+GMq94W3JozEVy3CJ/2yOkhv+vKpkfPy54OM
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
Toki13k4vkJxXcu6u3RrWWWRpH815hSdp5jQ0p0Slr7SUU1RCf2NcKtQp4p7
G3TxbNneTGYnz19tZf5bNTs2zo8tqVEx8eGRTkkjjKnzI5o3tyrAYJIlez/f
Y/veqLeBBAeBCRicy42D96SffEBTDQazX7vFfwxRybITTNnNwoocBDm4x4B/
HY94xnYtpdS5KOCISeyOKhXs/0m5I1xZxDI/crh5+D6UP/vCXPIvdobRjexL
JptLWX7XDIXSErwZZCXEsyGIbPBaTToIYQDssxJestC0rEGZIzb5ox1b6+hX
v1kvCBRkWJeqnXRjLbeU55QINFZOVdbiijANCxpqkD0sXouITsKw9NNbfs7F
BcGxLURXidqDwA9+DHo3ulS4DclSif8b0SocH1G7qoTOqvaviaZ0hvP9GK7n
NKYXiqSAyx4umuGpejUJgCuWh7WCYslpP4E3H/o5iAHqs/WneNITTh5uC7xb
TH5hnjS7aqnldUCQsMjdjTs64IlU5n42m8cqkMpkwj9tyC+bVXeIRYqXMI3z
uW1nBElRVx+4OIbmd/DoJc67enptL3cWcxeaYhqm6xvkxQVvdxjB0AzwEKjX
IEfebuJH2ZnZr6snSITFiVGcykF6XIwS93uuV/hDZYjif9WNkXUMOKulZvnC
VKW6c3wxo+haSSSKjTUEg8vEp5lZ4WOi6W9kuH6HxBqxcoRuAZDcmx5d/Zyu
13QdoQzI4w0KsPJtZtxwLNAGDCg0iTJiIJUd6nesYiI/M1iGU8IioUIuwFNS
Q+tJGB3lmoCFD2X4fCORL/nhChveoPbojwSd7SODRA23amlqsoF/HBgaVYXb
SgNtt4c2EJSm8DFjIxbLr1zUZD65hLwT3QVsPQGpwndpQB2bZm/cqDcOFV10
YKKr34nbnSHfdydqq5pzAnVLlbw5fuBQqDW/5sOUZpHZi0v3OEWy9puNp6Dq
US2J1gq7WVIGDdpza3iWNA58jyv8lU1H4StyVtEKR787aCXXeP7VZMoFMA4g
1OAXuqySv5CftR62mp6QQYM7npaxUwI1wxaofxpgJHsI/6QHLeXy4wcXH0HT
DovVGK5Xzd1vUweOpVNb3CNHTIUrwvTHXkuvzLKpSIIAJKvh8/53DljflL7s
GHeNfcn0SoiekcylklGHTXmhuhA+4ihgsAnYgoKVhvE1/NsfcplJC8FcuG0G
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
YvfeHR3lkNm8cVb/pRMMBzvWphc2BBIT/H1LQ2p1mF82ZGPAp8+E+l0O9+Nh
7iTCSdLpJZ9C407mCWsmnu32sG4/5V1lWHybsvRpx911+ax5eGrg8gpni08h
l483MeTlgqzGHiweC5UVEsAEaq1jJBf8qt1CzhE6oWhRRVm2VZuc1Aedklxf
hpxvnfRfTdyauHE5jIYwbqL4mTKfvahznpdt6DeTDo1xlu/6H1iRGjWilBcj
KogHCo9z8DhnBMoa11tFHimr0D9qFBTo6oYwC9yggjosd1tnAEbeIEVRHumX
Vfdqi3hSUtdntHnaP1+MLFXEdICnntoc6dMVLfSsdYiznHLOXH7FKOMwdPbE
9E75qps2e6m4db6lSZ9ibdgDh+rV5MJf3KwKSUk2yIn7LgHoAFkyp3GJzCrC
ZNpZZJUaNs9GqVeXP6DyGDxJB/lDNlSl13yI+sZZ+4HI1MIr3MUoEgIh+M3g
TnCB9ps+EriZQpMFoig6/nVeRTIBOhQnu/a3zVV9y1K9Dqzy1fSHDzkywqr9
rcUkTnooJHYhyr5mR3QYSD1QpJtJ1dMffRBLUiG0N8gA30NJECeenpkLpjT1
lKPDvRrs5ZTq1RZhrY36j7P8mk6ADolCVGLzL5YD35JEi0zyq3eWZc1d0dfC
7rvnp85B+3cZ5zMrj4+tAnUULxuCPKN0Xfw7jIlmqWzvyyxMyN1WmSJy1dzK
fEsf305xUg1OQFjtoMd9abwsNdMH6l136YYP0xnieuxaTZtg4ihWr1G8UpZQ
Pb2Z32Sa+2a2rQ+a3wnXl6gbi6D1JySlvshj0C/yy1k5SfVw5eVM8oyRH7Vd
c3FINEh85UcaM115WBz08fDy/eGY2LIj8rxEnmOiJzuPx0UK9QCQO484iIzi
uJo/PLlbeW593X2HlmaVh0M6Kklu5hKdRm39y6dVR5KG4mi3yrq4Rk2FCuxu
DmrgG0H23plZnqjBP/gVc/BanlQYz6G9KGoV/sRQ82SwAV16GiSon4uPyVqn
bnaSKzvY3HmG3b+rpzr0Kx/fKI9ro6PZ089t/7rVCGmfnK0hjSbkfTp1iNzn
JR8r7X+oA5Rk1sQBSNlkO5S0D8YcOgs4WP4VQhOMF988QIYTfeAZ9WdeL6Ev
l7Lmsu1b3PylRYxMIdfeiAvYUg2qzZV+ETN84h1M4AmAocX+ER75KA7aU50J
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
4s7/noN8+waPup0Rlr+WnrPPugG7k0UkIkazNqsNEpA7WeP5jnFKKjF9C36R
7OjQgSxkEf9V/s/a3YgKh+zFj/HXPzW8D6H86iYi28avVGqpTv00EymC7Qq4
G9t8y5LLe3zeVf4WWoa4nzhM30nPlHkOH5NNTC9LEOwbESw6i0Ii/KPFHhEM
rWC48PiWy4/mOV0lzdEBmVpTo3AyxJq1R16Uz+0XzFKG6vdCtOX8pooytrJ0
uOZzHuC57f8l3J5akoyIEGffhqd6HWpqrQLl8fmxtKDVWJ+TDUqAWvskCu8u
gb2lX9KE/UbETN7cfTXxHYxsw2oqOZBUZ186B3DibT6mjqU8aqmipYUqw989
SGUIEOMk7LiVyVQvEf6sWtnapFObXy9r2mrMqbS/PPp6ElTDZO0VUaDwf/LX
cl5ryR19GGWhS93WgOEsURjihxWn6NBqHTookkv74+98kdBgv0C9dAGnRuV4
5AAgqYeyaMd+oavPT/uOPpEtoU+X4ineH9lmy8QJ7RT0Oc2kGvu6+5OhE7Wz
Z52Bbcma2X+6DeJASc/UF7JbZ2gjLxqbOck1tISdCpoce8uGEZ5YGsJ+oqAM
8KBC/jmWXtO5pZEGlCwuIMLCsHtCiRWZg5XGf19HTV/L5FAXHbgSavDTsCnD
7F0YoYQKRm4AIHvj1kHARpjVuX5kT3lM803zYkJSq0UNDxUpInJFMPnEjIBu
VZU0LXXWm72QiVGb/6098mCooksi30p4eWFmuPJPzaqoqX0Wpuw/oieg5Cz9
6zz3dLp8FpLxnPG8jtlSMeWeHZXbf5f23BBo/7DxEG7refJVyK98GirO5PG7
hx8IlBAi2kKDMeBkEXr6MUFj0AdTm3naOfLw3P73PG1LgPGDhUCmoMHB7gug
9hZPsluN/H8jmREoLb+XPabBqVOpenNvRleekJJjO5XRlp6gips0jOpi7FeH
CNam7e/Y6wmCB+mswhqdJLsRP/kl3iecdvWARt60955B6MtZ5DZmrC2pdUfr
NA7MW2/H8K79kDa/baPM/ACd0LMhioZUQV/SMFhEuQyHmY/sdJLiHIWubfAl
rekGyEHs/ubfL5aE/l2qhcXZkKPkfkHjcrsLw/VMIgCcZBxXGB0UnAc8hvzj
Pw6cm77Gp9xuQTRds1MWARUopUhahffc+lnIHNukZ18rd74cJU4ORYTjfpX/
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
SXxYLcJk2ZtFUoPUiIJAJYDie9Wdm/I0ybJqKce0UP0Nxphs+7Z3/o6x7vr5
ZVMGvzBrJet3Bmyi4RHY7EV+TQvT2uP+gizL2+vUEe8rsR/77fuJABvLtiCn
AmfgQs1Nj1AHXhS4cpO+vwQZRcyTOyNMMr3X7KqOOWHLkD5MYe7DJus99ESF
4JMCG+w9vVinc+usR7z+V6i2Gk+Wxyyw6hq9jy6zOcEPr2SklBVHJaRcgjmh
IIE3w4hi2wKcF0HGshycEEqjfxBNsEJW6e7447F6bLvpbSAkc+6iXHIGxbHC
e52/0YkTDKkkpxvgb0zz2lnW0cicfTFHXsqeUBlpnxZBAIFP8YSqnN1Un3gS
1zCSkG6bmAiikD7o99G1S9KoSvQ4aJitmFjUlKAmAsy1mN+mYEdUWa4S2dj/
E23qp7GxHOPGUX5fJOMcVXMuC63DCHTOhNr6q7N/yWsp9hGWoj2i0vqyecpr
aAYDcGejv6nK0LUUlvOYjBZ9Ll1ylNSjEce88rr4YXjgN9uaVMZeZKhT9PbZ
40AS8ffpc/LwLpZblOrQTzOrK6ls6OSn8B5ts6AuX8C8hR+BUVTk0P3WN/pS
c4C6RdttxYtojqyqOPvxsRLTPCfF3erQIHuEez7/uSUmMw48mtLkLTS2LF9q
SCGSiD88VlRvgOBM2LFiFkAApZRtvGkzs8DNytYP7ReKAB5AFCsWWP6N50sv
xheIdknyzDnJVAYwJma8oshNCpw9B9i1ucbgKK2U9e7hesIYH37Ux/ZnYG9n
cyN9h8Ax7Nqu+IsomcbL5j0yMkeQXaXh0CiqwLGjGOA9eWS8Nw0HKmAydMKW
UVk2hbQO5nFEeoZCj1hJB/lDNlSl13yI+sZZ+4HImeAOsaQENyNJ3v1EZ6fR
bK1XLY82gecrDjFbKlCa3vH0K6hHL2yShMjwxWiHOz5ds5AwcHQklVqDfiM6
+1tlaZNwxRKfAR9Oo1F+D+TD+py6yLYB8tCzuNTGuPuNVqfq8XVuFgTPDwlM
VvlQrMguw+qejbmNpL9bwobeCUxEavbKIlb6qIsvgEnboDmjW3jyNKpIeUY5
fAPcOJ/NXm6z03Pq1WTEuD7K+vHmSjrHznOaN30GhkUC+a4CyjF+yTyav/Xi
uu3KPC/S7ts17hitEXynebcl2Do2aRMDGH6e1xn88sljjxjCAcLKI+skRFWR
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
qPg=
END;','package',NULL,SYSDATE,SYSDATE,NULL,'546508b9842c4e3698a1f2d3ae6fa917','0','obj',12);

INSERT INTO kesplus_base.kes_packages ("id","parent_id","module_id","app_id","schema_name","authid_name","name","header_content","body_content","type","remark","create_time","update_time","update_by","create_by","tenant_id","obj_type","sort_num") VALUES
     ('db626b8ccd4147469aefbcdccaf63c18','5','dfb8894291c34ac28e3458bba277e0ff','e32e248da25c448ab9eff93c7a74025a','kesplus_base','current_user','kes_plus_pkg_selector','CREATE OR REPLACE PACKAGE "kesplus_base"."kes_plus_pkg_selector" AUTHID CURRENT_USER AS
    /**
     * 树形查询-懒加载
     */
	FUNCTION tree_relation_lazy(pid varchar, title varchar) RETURN JSON;
    /**
     * 树形查询-全加载
     */
	FUNCTION tree_relation(pid varchar, title varchar) RETURN JSON;
	/**
	 * 对外提供的restful API
	 */
	FUNCTION page_selector_candidates(actors JSON, assignType varchar, variables JSON, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
	 * 获取全部筛选数据
	 */
	FUNCTION get_selector_candidates_all(actors JSON, variables JSON) RETURN JSON;
	/**
	 * 第一次请求,需要计算全部类型,并且需要计算出左侧的筛选数据
	 */
	FUNCTION page_selector_candidates_first(actors JSON, variables JSON) RETURN JSON;
	FUNCTION get_candidates_filters(candidates json, assignType text) RETURN JSON;
	/**
	 * 非第一次请求,只需要计算当前tab页下的分页数据即可
	 */
	FUNCTION page_selector_candidates_simple(actors JSON, assignType varchar, variables JSON, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
     * 根据关系获取条件列表
     */
	FUNCTION list_candidates_by_relations(relations JSON, variables JSON, assignType varchar) RETURN JSON;
    /**
     * 根据类型获取条件列表
     */
	PROCEDURE list_candidates_by_type(typeActors JSON, relationCandidatas JSON, assignType varchar, table1 OUT JSON, table2 OUT JSON);
    /**
     * 根据类型获取条件分页列表
     */
	FUNCTION page_candidates_by_type(table1 json, table2 json, assignType varchar, pageIndex int, pageSize int, ids varchar, blurry varchar) RETURN JSON;
    /**
     * 所有条件列表
     */
	FUNCTION list_all_candidates(userTable1 json, userTable2 json, deptTable1 json, deptTable2 json, roleTable1 json, roleTable2 json, jobTable1 json, jobTable2 json) RETURN JSON;
    /**
     * 检查-所有用户
     */
	FUNCTION check_is_for_alluser(assignType varchar, table1 json) RETURN boolean;
    /**
     * 获取执行SQL-所有用户
     */
	FUNCTION get_execute_sql_for_alluser() RETURN varchar;
    /**
     *  获取执行SQL
     */
	FUNCTION get_execute_sql(assignType varchar) RETURN varchar;
    /**
     * 获取关系详情
     */
	FUNCTION get_relation_by_code(code varchar) RETURN JSON;
    /**
     * 执行关系
     */
	FUNCTION execute_relation(one JSON, variables json) RETURN varchar;
	_SCHEMA_NAME VARCHAR := ''kesplus_base'';
	_TYPES VARCHAR[] := ARRAY[''user'', ''dept'', ''role'', ''position''];
	_TYPE_RELATION VARCHAR := ''relation'';
END;','CREATE OR REPLACE PACKAGE BODY "kesplus_base"."kes_plus_pkg_selector" AS WRAPPED
zGN2tcigLGbGCGDD9Wv27hj53573Wqcu5w0HMEsQBrkSrqFUnKM4yt8T3cZb
oDX0jcbu4TUf3wAqlnTctbwvUydiBiBIEUiAnYcBE4ipA8T6Knexe/3PrKbk
8J+hov/rsVceMcnS+BJrO2xGHjkKQzhnQsJ5nPq06GmGQxRrGCGhVAyehYZW
yiTcNDP+b0oXUqA5RGirlPsLUguISxcCgrG4ojDujVHzBcpdyeQUOOCIQPOl
n6VaZQGf2tcBVnfcCtCVEF9VuIpDTCbUKgJJVylGON5OVdRsqr4R+hyrIU0P
JACCGLlV65T3TQIabFHUjw0YyxRV33gDMu1LPNTSVEmroteBZc8TQZHGoR52
deKlQ01VXWe+ybPP6kC5OMGoeUb4hOOj8/RaJDfMYpOA65Y7fuhXvGwe3X3r
IHmc64KH5SnZty2QL6bxKExJ3Fko53HaLelcvCShuE/5fzM7rRkAkv3DfkCU
G2Ii2ANe96GElFl8y4PjywLiVfE4c2QJVcWgSTYHwM6ae60vHj+KnYuoz+50
v1tWKNmwgh2/RZOSmXqlyMKaKONzR4u/BEOCbkX4LfOG0Gkh1xAUuku1jACe
xYfnkUobxgptWGkSviYprJtzBsWC5vjPpk0b15o6plFkKr9pQQgWxFZWcBRS
7pgtMKJbZfub2m52+AWM7uc1UOFsvE454ZDE0ImtdoBT+lW8VOqDWnLHeuwr
YyRT6XiLY0x6jxNKNMqNA9quolIiboqoG8jpLandn0CbiIwxKGSWAAE+cA3z
WXt0KxovhgGgAII2cKa+hjxy+26Cw5mn7R+8/KP4AQ7ZU8t6ycOh/IEe2LTd
9KXdO+l2+4U3O8QDx43FieKRsb9GDEZyEFf8bZ5zAbu2MHDYedrydFNe1cMt
ueBpRlIulKwxHwbOgUG20t4MV7JJykYj8h/gau70FaFqzNUMzmyy/DOCwtof
SLBEGWtlLNxR4bpgUe9/qezQ/v3Lv5RHBXMJajKk0IrdS+yPRLC/kIsULQLK
gsF2R01axvClMOQaHOJq5UB50ccWaSqAvN3SxXaVOGfQ3EPvrNj8XWrcthWD
D6cRjK9yRUykInuWupOH4IUe35QGFRf8jrRJ5WlER8f9epn7rkmC6Lq6meMF
JIy534naxy2v5U6J0qF9qSTQpQKPJuZwcoCdK4EiphjAm6r8h+jouQQkFpHq
GuGpzuZgGGTY2Oqr38slKqQBs2w93XxHmzCFeN5VJHIvhXqbnR7St8f86fJ4
tQELZtXcoPk3ptknHrLN7AK+pogDP/sd6c4bTNUrOeRKLuLwSTT3sFq0Jl9N
+wgQXZZbGyeov4xRA407/Uw84Vj4vZSj4HJXD01lWPj28/vGlbygit+CRVIl
6q8t09HMH+Qjdym4q4d38IJ/kVEpvvlxa4U0aSGCcjc+QqnlTKwI4idTuCiA
lv1Ac7TrkuncCrZirzwWB5bBcFJDJ/AZvxgQHbe9LyNEkI9t54ojvj2tvzhd
UirExopucnAkg4K8IW6nLEmh9xYVFtyY5F43DHBtC/CQel/V1ND/DOhz2nuH
z/Hfb6Ay7lRZ9wAa4RdsdXpYTqwW/dm2tOsPYllYKhxo4GyHP8jHA76HXfnJ
+OWmDI02dEDqunXz/QdRk5zcl7m23vWXKoVRflshymJ32d8hnRdQIDgPWOBB
oxQ72XOJRmytCpU4j+Zw2XYUFB99pXPRglNkEjdLZj35eIlOHzVI0sacUb24
nm7PkUOitaDxlhnA5bNI/Rq+Vmrp862wDWwTz2UQsmHY1m5ZCXg4+fsiacNz
/cYYacMj66XWqPQV6TZYkdh5jJzzpBL7vSfDJeHB/fzFSY0P+L8gtlPIofE3
ObZmfdTpyxJUWEMVfoKu7wE3Yctd9u93yW5DXO+AELPDtN/gJ6vd5VegZbSI
3rdcQdPdwnr3FBQDpmRiPSfh8coXf5ectHAx3o4XJLgyLr5J++A621wg0o0W
4JduP5/AJ1nRHgzuGiIA0YEvFUOTxAOQ51IgqGKOgX7oieewp30XagdwlY27
fuQoEusE6VPiCPFz1kYYbYb/I4+jdTER0eD741KrtkYCyc0i3uDadQ0bDhe5
QdRZnRO6Pk7f8KDebmicf+8iV8mvc7TiNV3YV26LtuP7d3Zmo0ZFO4QBB59I
ES46yXtGmLYT5x0CFUgR0ikAZ0j5Vq3QmKCecx9vjyBlxloNRUhvJzhKBJjL
x4XELqshcwPj4UyQ3mQJCBiEONBWnlV0bfGdtfxk9MXhLRhUmm87JEQCl1Ff
AQiipMNBVQc6f/puh3CbDC5QwEsQdX+t2J3HvnEoRarppLwQhE8DCHC1n+3e
7UeqIJbyDLWvOaOkoE+moOO3kSJbHiecm+WxXoQvdcStc9KJ9pm4aaVvcJVw
fog2Yj7LkoduxqIs9BMT/ZtnwC5ayguiVlJDhT4HHyG2FHqeDkZcvZnoZxbd
P14fu1BGzuOFTYzDdFxY75KqPt31wNgd/WbelAoGTFewBqL8kqfTQqYm8TCl
gGtPBdixDUn1WSa9Luqo376vHE7Z9wx6I2t2z3fmv9Nta9dOIs6d3m4xQcbQ
/1Y2VkLBbtSBcPXhIWHjTnGzkrf6hOVBR5ZNk4VS+OJBb2vNFWSGKEoa5vcm
ZgUNRPJ0EmMkeb80NtHUiUuV9CFXNJYqi4rReVUfysWyPKkCqHvIjfKzwwY0
EbCaGCB3+7cXZHVDAAw4IjSzNPwTVGf2qICpJY+r85PcP1MOLo069D+KBuLt
ymgqR9NdG7S5OIExMtRng9gytImRAo0gdSewaj8+IYj6n5gOPnMEpDtaNHvm
BU6OAU8CjvH8JbbDctZbKoPiJMswKuF4e+ct2hNwIJXPXLd+lL7hmdDT76Sh
Eg8kgv7ziPwsyVAUy5XtI82PD2hHiSS+g16N+8t5+Lm49rOW9ShYa5cSTWj0
YHU2yPbXBkf/OL7cwSO5yggoj1zJYO+jBzbo0Nkey7O/W+gud8incoybbhAp
ImQ3MdBHcLAGUtVS3Rv2nELlmGsKZZyF3ThGsBqyejdiKXyagBIFPIU1V9Lt
9uKD/wzKpHCLpiuGD+zmQwUqeCigV3Bo0b2k3R2d1TWdwXkiORo+H/huNn/p
QQa3TQrtGdousBkp5WP/UKX8Xrh9GeF0CErZOey/8v0pxkmUapzkzY7I/X08
Abcb0I75fhFOXux2Lgdct+P+P0NA+Yo2tk+pcQmZC6C8IOC0iXQb9LwO7e7W
9NgWs7O+pAMWPs2f5P1EN8sOfMNeNt5OCP8e2FbR0aenROOaB0aRrqvVDBXQ
qgCdM+rd8+vMl8l6vyqIWn+Ue+zfVHvIhuE/cbW6LCzMLljIHObD3ZDT2M7y
e95ZP1nsgt9yiDm4msmyO7Hgl9FEnwZbb/XouAOAagukhgxo1uJzvZ4+6hxE
6gwnXo0h0ewIsVSE/ZRzYRIN0cZTgntRMp2MKOnnSRr5J3Kf32WUlnfam+R+
P0hhyEs8ZpyV/vVASqVoq0t/NnnTGy7vdndRPhTix6Or75h5QhhA9hO/uzZa
bFqLB7PgQB1heixsgUjx95IRlyG71kjO2lFH5rN8e+uX3GUjNwyjAsWQaCHh
WToe07E6BUnVseor4giUiP1di741rTWtRqBKeVYGS5AQvmAt80SV1SgNfnE/
Xf2Ukkc/xb/q/y0TqhVlY7wUtkSk6DqIu3flfrXfAxzVSVFh9akX641UdlC/
uSixA/buJuv5KoRv58govi9/kz4NwXPVGXUwyThvVWvXk6q05GCLeJNfPZgd
6PpcVjPbp5GUbciPrIInm7x5dWGavgnZs9nKfm297EFdc+d+5IEpBpSahFHP
doNrsdk7CgxN1qYcurB2QI4/Sfjwy1AExsL+ZSGUbxn2Er01v8OgVTgjjUg6
gA97M5EBPkjqU2vcexf/qtXZ81LSWy7J1ZtdImT+UeWPaywL9YruYgDWmkIM
ws4BCgzUVMbyyBtqvQ017zmuKHGcZOxYKAlYM/aMO0/PcMDJjQg79p2ZEfvr
KeroR/Kc8RAUk5hhKg4GYkaZnKtksQVbMGJHeo/CDIIQ4k7RyEW+dQejCpBU
T78nLrLT6gHXZ4U1euAgQowQr6OLnhDIF/5TXPu6y4tYchQ4R0Rnax7asrxI
Dvu+Qph8drRK+AWouK5Ja2RwR1x6NrWv27bpXV1Uh3Ml4Y0zOaUBfaD7yhIZ
8ZI8e4LbsvbhQxYCKKm9tYtxtUJrt2j4zxhGGwrIctDenWiaLQ4rKO2iQCdi
52ZO1irfGjy8+ykE+IfqFp1c1Bfa6BML7pa+9BZGvWPA4695la175OE7PDzH
W0ahdVIRNwsaraVq2HNKeVakfIB+EwIWqrCBSI4FWkizEF5Krf9TMqmtiUxZ
2cPe43t1+6m6t9vab3/R23Y6O3Z52xlii4hK8xASRKYQbv7hQeSMxXBrQvlO
B19T972wkwtitj5gOkEDv4J8FbbbGsBqTJ6AGWh2w7Qdt8vmmIpxeLsUup5T
zhxw0lVuOY63/HLTKVMoOMpFYd/z2Jz85mksknARn9CgVtNXXHtoddgCYUV6
JimsBHLxhHCncgLY+1Vqsmij+ank8GAIFPXgiDc/jk4flSnrww+8YqAQh+Nn
6Wc7YfRUbMFmw0lT4dJPqoUfey/1UFPeAV0hvCyd7gBsFmagk5gVEdZdOim4
80IXjOtDDFL6ZlTgzPk+VnwT31R4qzGOF2L2ZbTSXWa2iFrBVjx+XkbQwASW
ULTH6++Sj5jFY+t0wUPKPVqLIIqiZ/7U4SSDv7T7PeLmuDW2lVrVR4Xqwqk8
J2IGIEgRSICdhwETiKkDxEqvFS1CEgUfNlh/D679wWx4k1puBOs9+SbMs4uB
N+ePdnFJwDr/6D8OV9UZ6J0AorM+VyJfGS8kbLsLEApEgbb5ZoQ1Io/aSQbB
q8pKp09I4hDMk2wi/hzNe6o0wfkIYfQ/igbi7cpoKkfTXRu0uTjOVI1uQTDl
LlKSbwmr0e2ppBx0Hxgo2LP5mBofz7anfFUlaLow+GYDVMxjjspsUWwueNqR
dHQ+Nq1bZyJf4IY1mvTmIwOipgq2Qu9Ray11HrpJQjSx/nDuTNvpErZSpgRf
tM0qhnDZ8MUc1mQvSjgYIeijZrausxQ9AnJuPlR0Vd5yaX9oRR+7/5Dfy5iw
F7UJdRk+rygHIAwQNxzjyB0Wx6YODO/C9iaFoJrv+cClpn9dEsEb6+jKTTxC
UrStv3D7NR7uut/1B2RK69QzWX7nUL67imMlvFz9b0r+wu5gUOHgHI6AVL6s
Xaoomq8/Cn/Y1CNi2+Y2b1leBvsTsrcIlnFj3F+2/uaJgcMIOwHZiZ2DyOLn
ur0KD36ZzYDysRyyihbEnmh/slbefYLg6Z71+yS+rzXLJITefffeDw8W5Y2D
xKlgIfpyPcAS22ytsX5zP5Ic27GZXJi+CFHytaLbO9258wdgfRzunthQ0Xd1
+uFj4jym3sRJRX6g5IquqELw4N17s26F1aTHq2jvjLXYB+A8/AuvAhIgxQj3
lDN2odWQarg7ep2O0W3VqCYe1P/EndoAe3MNGAx21US1b+mVj1bkv6FUZw4A
32EhG8EirNCvpCdwzNFc0Ped6bkZS5hN9IcqrqBJGFdu9X/gNMUQV1jeouM/
9Kkx9nEQC0/d4JSQynLMAFKLnXl0g9RR7nJpVf7wLOyEi8cOiiwH/1z9cDqt
tW1W5DaqZyYSpB4Qr9HSu9sat0xWBVRrkMzDAP2ofrIRkeOH1e3FcVFe3V6w
0gsnXnQEF8+86udB8PUzXdcKz3Xbs8qTjVgRqCyyfKZ0W9YIi/ctjHX5ZtXo
lrY4Wg9J7U9rJxy8HZ2vMvCX3tacADJh0p1xu0jA35Ou0kzWFowrOeYW3Ynf
0jYFUfrSCL7vDrG8TyuYN7GxVFTMOiNWWJ957FuS3z31UrKV135s39l0BcaJ
gtar/o60mhtM7xQdahy/7Sw9fLNBPvcwMm5jdzCXwyEXvAjsTKW/nJQf8apx
u2A9ocVcaI3O7SxnNtRRBg+vzIMBfOOxw0TqMrSGN4rbfu+NWQ579JHf5FUf
YccaprxuQDw4Hl5E5ChM4/4NB/Py1Jf2O6niHs34HD71c3bWntajcX0tEiyP
cwSdcFV9FPWHqh8Ca2FZRPCIujv6cEeR3qZ0XePZ346WEQrv8AeYg+et4YD5
wlGR4BDBczXeXgpkYwgQ7k3pIGk/gNdx4HwiQMWtngnH65zz4vNZk2UgX83V
E7sskEfr66z4OLkTpkHt4/8z0fadxx9tVx62vetEVYePBIEinXog5jMxtAmE
hTdFDmGboyDsCIrxzH0YU1zcKjRNir6uzhkiNIfGRls/zRfzdyPG7tGX2tD7
QrPei57HwDVjSdtXOeRJLwl7y0ivIio2/zeQG8dyKOnnSRr5J3Kf32WUlnfa
m+R+P0hhyEs8ZpyV/vVASqVoq0t/NnnTGy7vdndRPhTiY9HuOtNddgyG5B1w
5pjaz1XLYBv3/z1Qp+3/SjzEdxnvzMcq0k3cmanAWTq8aY95zoK213AaM9ew
+Uzn68R2CHxdy071NV6wGGcpvlaI1koxksvjMWzYRno6fE/sZBdYJLU9ZswL
PKjIBLGEXh5sjvsRUFH82CY2bYRk0V28F2GJemBUBYAeDy4ire2OkFz7jCPp
7KTy0BcLyHjuf2uV9+B3H+roOFHnNWElk7HfL4MxH2HkF3PA0PmUGS7MAYp8
nER1X2vdMDW7nueb0nTnnhQXA8S3DUe8PDwIOUWajAYMX5fho+8K5nY2A95C
C2WGyhzoUU8f+rsHO/Dsj6Hvc6Qcbzr55eF2kefWpM4DKctGIIGg+qJG6KEu
U4MID0gih6WGkbRiyLrOy9z0hR9hHScMaisAw7BjOVdgWu/kIaerfogJkbPz
9wg8sw9SEW8QeHS8ijCeWLPl8fAG76ZTPy3SgW1Y9AeLsGVG7KWMliNrqpF9
AMeBHhuq3bS0F9zhbnzIa7AAnpoLgDqKZJ062TjcJXpPHz/L4cdbJOtkKhDu
2AB7/fElo1DzRL2WTjUYm2OdcuxI00ZXdh0KSHbW3CBRhZUDeOrTYCcE0XQk
oE79uC2kNXBYXy0v/YsfNe8Wlo7dc/cx9HqDxxUn+eA4Ey7XQYi/jvaaRoul
qLpbfM2R6T0dKszls28QjUlcM3GXih0vRdng8N7YIyzgMolB/wLYpqKEi0lI
CM3hOYYVB3URV5lpgMZuooBYgZtAhqW0/buSGgcs7/ldTiPkDOUD0WzqRPqc
wdwjWm0iPxyzBsd/5U/otkiwdQSPHsZeqRF1EIqanwmw8WuMESgcEWP1XqkY
qBXMEwA3V289Jxj/Tl0qKzZ06O4tExou16+6Ss4riNmLnO8n9zY3L+J9DVbN
AUmPuTGjTDzmphe2T+cIi8rPVw26n78n9WMGz47OuInf9Upz27pWFFkBZYrg
Xz4WurXKgDpTiaSCXDCGezi8aaIqWfZZa0S/t6WMnnAOFQVivtdzFbJUyPko
qGu7PRvtWa73jpSFZT7bSdDoImJk16vznE4IcWAK9veIXi/jU8QH1PqHEoRF
Gf4XlafCJGnrexBoOrUpqnsVzm/AYCFYLjujq9tcUAvZnOz+WQ8XlpO8Yrxa
WdGkEGYZXqlX6/oU+ihklgABPnAN81l7dCsaL4ZdODhCCsp2Aj1VIVFAu3HL
U+tnlQgmsvxqn+Qa4EBiEt26Wm21afaNltu4Eda+LRoMpK2OHGnTW1kbK/IP
IOG1URwCVE/Dk7xM1SiAm2iAu6fxEXk6QmRF7MpHmq6IK7FE1anSAR7ShlAF
sYvsf9KuqGii76y9DHZ1QwlREniqWOItja806fwkS+Ze5aTnu/o1UCZhP3e4
XlsyDq/pFWA3X6EgtprHFzBoIgsM52YjnoecXoouTfqtPoJGoT9Z0eEqqY2Y
8fZ8XmQol0F1kC80hwqqJXcKuKJM5Gely0Sdzzyw3uuL1Ofg4dv3l9ZPhSqS
mXqlyMKaKONzR4u/BEOCzHWHrebdLT4GVzVHLvKu3AfQ4qFKSpCLKZUloPYP
S9b6WpJYtLSdF8nWR+JUbDQM5nzXv1e9Tl2EGg8t6mwzcfa9Rn+AhOfqGxVL
U62LStHiYPR4xJB4goQmfqlhzTfYlkY5w4c2sbDkLPb11eq1+uRAq6xZHvZr
qmVKOwoORaHr7gNn7b9V+//WGxqTW4I8PNoQZVcUlGNtkPwem2PhT/c74Gdn
0m1utzMBwO7LLVGuUvlKB4xlnwhqP6dh+l1yfNSPSB54GvEh2/5z/KOAsOpo
xU8/svfXV7DpmE2PBHNi8iYF8v1OziP+6f+jO111g4mD1CSVmDOIm5zE7i/0
K3S+JTvnW7qW9GyyMIXKKPIRSxbghjWFKXoBIKmXuDmSdfQjpWix8lfPdFeW
vgnJMeQ4TyibU+UNlzOYrmJCHIoTjs/UxNhDoXl3GLpmeRh8g3/nwUghMixI
P9in6stWdje9uPiv0emyCl5t5HwKXHWt30ocHQEYFmMM5j49T0cuxlr/2SGE
kmOLMypXJf1Bze6KBqQ7uzoiUjWCe57bKf2LqbMuokRfWW5aj0xcprHCBiV1
dZyqTFmqp5gqeox82M5MzTY4uk+a9I7VyoV2Ai30m1oSmd2VyPGTPX+/GASi
hyvZBbWDGlI/vbZLqKVgefvXXNo8FQkSVDV3EVG6+4OVoK3xbMYDOZXFyrJL
7C/iEUsW4IY1hSl6ASCpl7g5kgaSeyAQIM+FBwuntf9cltVVNfU/zcfA2QC8
79wlXXdyFNn16FccZk68Ke6rSkpuKB4go8Mvqf+eRQBk2SprUvXLSzEHBxyl
19XEaeNCYTXOKlvjvxqDSIPs0OjMYgzVDw0EteqXgT/5PFG+2C7kfF2pIHzG
QkpiP2PLUnu2fXDcnix4/EQ/SvbwmolGilhcUs8/OYpDJL9XXctnKVT0N+4h
DOGieOHha3uxHpK6r1FulTAgyKGLlElQmryilvTerc7fHi9QH8Ts2Pfs/PZU
ddoQA4oxwlX1eQbijJuOLVrCXQvdFUbq+l4uC4WwMWuphm7E72plwai9t4id
Ac92lKNmUgsnorQWOMSydZY4dVAAsvfQKbtLKK9vnirY9XKRPHSRc8sH2xnR
qhRODkIaFbDVPimp9e0ehPTV4ojYtkyHspoWKN7lILtLZjBNwSOnJvo1D5y2
6Lsyu91tZFKv6OlKsitSOlJbtRi8l9CrvduvFLElDeLi3mVT7lgSgryBKvx4
vbmTlMb+04wpVdbeQzK1prI9v/uU5wt/eg41Ft975AFWRv0cgICLyi4AgrHu
V28cif8c8Cccvz5H9f86egHZDeCP6SQ17YfQTBGuTUTEGnX7JaTZHBHn6gdq
Q+dNc/IMta85o6SgT6ag47eRIlseJ5yb5bFehC91xK1z0on2Fq9VILTaMFjH
Fh5ol0eK41UlaLow+GYDVMxjjspsUWwueNqRdHQ+Nq1bZyJf4IY1mvTmIwOi
pgq2Qu9Ray11HrpJQjSx/nDuTNvpErZSpgRftM0qhnDZ8MUc1mQvSjgYID+B
JuqhpLCwb09R2zwEqx0Z5QE2tWLSEpXX8WE99Y2oKFs+z+NS61pcVrCK1rwe
LrQRT+JtBzR63YGFbIU4BWnGXgyR7gIy+Cghcoc8+LRwLfFCFjYJCCq1kCE6
tSdu/AfkfKU1umGGWNnMOVLkxikD6di873xdI5hJmOjjA4xaHlMgzmL2ddvn
0TCG4IFpKgXun0/VWthUH3WY+HWk2K9qoOzFaQW7o4KJ052KQ8PZ34FMWgUG
NXe9wh3hFyxofexNLQuMz+rIl0ivWVmIHQ2P5OZzGDjsyhJw75Zc+Pi/EkSK
XQvMqEt2ZWylNHoTDA8XPCfRr6/lm5TZ6lxKn3pzb0ZXnpCSYzuV0ZaeoIp7
WF9QZEn3kgdtnhTYiaq25JlfqbHmRrUqARbwQSEk+h6lEr2XEYjY+4XdPEM2
zMDUQo0evyLHNLdFiiIdeB/++ShPUZNpUxPSb1qmJMXyuGyNYozOy5Z4rgMB
DxMbJW6V6jdZO5BdN+gxE6Mpb2OTxwVVJwjbeDxAR/pxfnz5deKRDMBGIPrA
JH6kRztI4m4V4Z9YwFDoC07oHWuQ6dj/SpgORPTQkq16SCy6DaJEm43O+9bF
s8k7O98zPZLVFmHqIJMiOEYPc962S5UAL08f0wj7XvhPDJ3IMCtWqnoiNSSU
m+yrZDkst/siDsI1bVWPWXlUlTxbCgnq5qB6xEFhMaXl2JENBAGUl1JaftW6
VCAJo/IicBiOse4Cuy+oeznWVruE+aXa9sqZrRwcQhg5IKFv6WYoy8isePZ3
RetBOfTcbu/7pdo9mub+4kft4fMYfU2Mru/2CJjPFBqU3hbRh4GItXvgqvkR
J8UxdBuS0t4o78w1aaMHLjuc3Sf94Y5+RIVxVErZTwmU2HSjsrJybymxO5Qf
GYqCF8gw4MBEiE1YmeVbNJOxhs67yKDFqqNnZdTODx0PE0F8xYlzmJStOSp2
eyokcGRA6k4lui4KdoAXKN774Nz96jaMSZ7JzdfFVWWhRPfD6pUx6jPuv9L1
pkhJK3UkelPs98GYOyvg4IInm7x5dWGavgnZs9nKfm1vn0DTRLxi1HRkZFeJ
MoUG0S0bg4JlAK685wVvtzX4k73UzNLozsLwN/3BnCCJDeb3n1xlDOIuj3LJ
WFvU8foTmP4ff5enidpxxXKMrOfrrTIBzzVkCCJrT2GP/6BklFlBy8oZq7kw
g+NWnhUllBTzics3ZcU0qk+3SvNXS0X+gEYAhZjqFXpcqNSsCqFMZSSN675r
Ve7zBJTDxbNbrTAJS70bw/WomYtEo5iNJugB0pLt8emnDj8A8isKvgDJCY+K
K2GGVfMnYUaB8r/o4esUj0EC9hjtsk92+Xnacpd6n+BjDDh8K2GOfPV2rWQL
I/xU7kHWOMxmHRA08JOjHyrtyw2zQhrCmnwpaSo48PIdxPZRf+S7Uscd0KK/
oC52mk6GHNktNI2PrTuQmebWztVEocp3eAILW0nKafRiMbV5LKnO+kMDHUBG
421pOFo6e70IOwCkPyCHh1RSTLMHKzEiuxQdEEdrjtrZb0mJOSBxZDp5fEFD
rWxapU3autNn4Y8iboqoG8jpLandn0CbiIwxKGSWAAE+cA3zWXt0KxovhrQ2
J6eQofGJyZ8yrrp6Ysw9Y7MqSdcgqiSsOZ6iOHZ3zJCNDLx88lIgFPBQiD5C
2ZYxm0WiPu9tQh6xeDLYJopg4hzE0d/+syDB8DYCEC9f2UD2KilABycAAgUq
oAkLD4Vwitffnyw6uccTJ/ein/XAZ95xZ9LdrmE2hZ5j87Jx1aSr9XrK1sAL
ZruPuG/EF5NwmtaOEvtyocVMGMQw0KZJ3Oy5gFcg9/Rq/Dmqy2QbRhREgRF1
GbgFdCIgVLaODBEZheoI2iINHOakUgNZQuXgrBUx0gZCX0t+KJo/OqW9D9Qr
6rUcdJaAQxdEpQtNZbLkwBLvw17mfr9FJRUH0wqj32Gnfe7cUeteaBEPr39z
ilo1rmd86/WS1ksoK7cmcucWbBhDMmVmb/U7yLALIXReO7XtwPzm1a9XKq/t
RfSOcgBzbOntdKP4tWN+4YjcwP5Llh9qLxY3uvKgBS/pbcb+lXM/lIXc+pwv
vdf0u+usmcl1fTZILvY74EuCtUtbDpFTgHglmvAiLuNfOzv1ENg1OtjRNDDl
e1Jd7jpcc9p4LvqFaasZc2SbQbccJUcYdA2lFIwCFxab+RGtaqMnLBCO6WuB
DUcDULB0nwvuKjz7vOD6qD+871ZITEmJGKpIkgpeNZ+zWBIuJr5+dbVviQou
EuspBP2//c78a0o/+zR3ZBshl7bl0uNbyjYglyS8I9MaSfsqk/9nIPagb33T
o6+w4uocnstW8ax21pfduUwrpOzCAyksRSY2o2va330ZDab9+oQgg9J0Ieeq
pUuLaO3JQfNhNAF3f7bcm7xgL6+DA0/3B+cRgq0FN3fqdTJOmU3+4/0WygUC
hZc78U25YSCTyKyLH6okCim+lVRLWoyQSZSgsEuiZzuJ42ML5FCCoDP9HJpS
8upRQWKo9bZb86beig1y344QvKmb7gYiPZfeJyAOPsyOhDgXbdq3XXFLryK9
y2ehgbBzPDBaA6HNIxZGzkQGPJX6KwWweP/IQVEDkRg6C2sMjaIUXbQzbEkh
Hqm4veZVKsSTzBZgpdDZZHpDSLH/QyucjbwbZjlEqvBakJXKlJxc4OaTcqTq
OLHJNhcwK+c6kI5Pux8afAi8fsPPICPssowosPNj8oY7OfRFun7FqfWBjymW
skdfe1vUk2r/yp+2Lr6NsOJnS9XXsLgNfCeFsaEFZnNsAL/OYWplCpt8jS4p
WSTrPl/VsuXkjCo1o+P8SGUwpFj6kATrExRMQch7pVSz5SwuQOAUO9tO8BUA
r2u/STbxmd7ubSkfq3WLLqQZa/78Nv70GH0a9nWmL+hiUkAzMpQ8fbkKk+Vi
/buSGgcs7/ldTiPkDOUD0ZE1TScBS/k0u6fukbSM5f5TR9iPuCRNIaA/Przq
MzSE7CaLND96pnx6IsRATwY+9/jKvdkELwgcMmJ2BZEoUesOgEiTQgnyXR0w
PzrLbVM6e96XApgZA2+QHkyZTJYV2udnxryRLaGEXH35QsDeUbm1oO8MIA6G
EMgXmbYJMCM/6tuyOEGjr65shv9K8xS8PqB68ZdDchag2yauotYDFoFRr3dZ
1QzsaJLIagK8O29D1AfjqmWlFz6LBoUwjICj/qlqb3t7PfHES9murB00+6fQ
7o+fQilZbeTISCaEDv1QkBwuxxSUBlX/GXMLRxhHdmiprE2+l2JQR0Cq079J
Fpm9+I//MaBByJvUSHeRrCTynygmPkFoWSkdgQWZMlRjosgCOXaQHugiLu3m
TEATjd3rOOVcpHcW0aGo5HnKBkCp/t3ClgkNFaYco+wmktwAq4+JmqfaiXaO
Tvllza/2ffBMjHuw7uVPWIHCQe5y0lau1lOk5NTeYoDCKKLBNKZU4BV0sN76
2FkwyVZ5W6orcVloCsPsUgDvrM/fnDUd0N/IhaMNB4Ghw6iPPHb3TcwA1brE
efy9ff1unTlXNi/rSzwBQrOTMctlFvqR8ylyVrLKY9dC9RVrKS2p6X7HJ3hM
w9erDHM+vbzutGkRGU+c/TJlo0/3rFBwgOrOwL1quU5vp5MSQdMaW/IMNFGU
bcr9vGZyYqS34cdO/HnSATOYucPJ2lBKHGUUyzvkAF3g0Ie8XxF97inkyCLx
VcH3+/9hiI80yi/JJV7DJuPQDuk7pPCLgi08IFMZEbFwWEtwC/0owkRL6yUl
+1nEauE0VuWKBvcj2ejHG3XRRafP14Fx6ZkjBI7VuwKHb21AcPhHLIwMStXd
gLQnWYF36SY0PZxA8f4avsqK9JZp+MlS7xAheBFZ04i1RXy5PeIcsKzJSI48
XAgfDAV73JHIRGdbEynItkSh7iAVi4pDhJYMeCElvXPtq3PtZwfU0GdQGQ+G
U1NnHw0eJT/0jj6yJOfsSJGeCCNtgOf+ZWZgfTXYtwmAHIidsQpHmDdKTyH9
XUQNWDdyQooRk+1fiX0NXOEVnLLzI0saqGtfAbXKJkE7WaNXp4fvlY5VRQsX
rBQ/5qmp0bnwtOzX8CI7KARk2FKAeQXp10IC+ttRLI446sdkXqiE8/8gj9Dp
cSyTpzlkN/FdNN+R1cmmErvYALmbAZK0Jq410I/2TfQFUMTPakc3ZmAGFaZy
9fXX2r6kD/Vc9T/rFZsvWMg03SEBd1/o632/pbyqLh3K2C1rsRoYsliGTI2v
yy/p5I0mlabeC9ry3aNUUp5CpZPSe4fCk64dT8UJerbLQBjaKK5p71oljt/m
r+4bTs3r9QzXYWZutytM0fA+NVIfDkCqXOFXwbUtrFM1fw/VYcxBx2I8YLUy
KU+lDSoIY6X1tVB7mYgxwfQWJdiY0vU8MkyqgepJhAjXA3b9TIv/Mu2uM/V0
Enk8DHogUN/C3xQ21FEGD6/MgwF847HDROoyagdwT/qsI4IfhO+eVMudn+Am
iWLVz/4APswWmj/y/1UkD+tzNlNLCWCXjw1MBCweR4UUW7wkQzBaJ8cYe5gx
7zVAfk+9b8ZVOAUSW3+UWxMBf+61pn8ScgvC+vSanR97x8xRacab5P+ntH0u
YUDBCs5hufJv1gF545ckXbktMmquTbHcXGHPw31ukocRfEjf8VbeiewbDINv
2+s+Bj0tr/ZEES428fmnemB3RwGHkFa0AtuSigfCe47ia07KMkalYMXm90dt
ZEaPxIGD8L5UHEDcd4hq7EMs2NNAWNqgoYSL62sU14loYuXOPvRBvH8iE0RV
IwazwVId4ATroxsmP+pLPnYM6y2Y7Vm9LHmFqYkEeQsq5tLUGBVA/6GGAfYl
M2erDHsEQBsyc8S45mT7Alixt4gizB4xoUkkizfG9kh9d8jiJq4Qp5Teixjd
U5Sm+Y47lUD7ruBvHTUwjjjuIauLgKHzYrgKZ0ckBGV2FHEqDlOBTsBtAvEa
fTGAyPrnYiYGij817tq0bLrivjHylwek7aw5Bz6IZqvNhVNdLwiMljUn1hca
clkGSdlNkkZf+hu+dRpKlpJoljgKI45/H3KqIXcxCVDVK5bAhJo4d8VC+Hj3
t2SEeNVx8YW4aEsNUPC7fLPX1njqj/bDlIHveXAt8UIWNgkIKrWQITq1J25h
YjpZnYwTZgf3ZajFBGhGs8zXQpG2S8XujLGE7CJwllTan7EvzeTrr3mQtiVG
FHnG8sJdcUZ23inhiTyUgIRz8MFe2Air6QnSwGSYvtUKv4CHHNQvmtDBcHya
gZm10URnTL1VKOutGnDwdc0D4iyj1yPtCRnnrj3E81XA2fvh45ObbkVGU/D6
Bc7OHQmNjwKmxGm2+xOI8CzlmHFLdCdnJSXmwu6HN45yOzbRXAjlWaEwyq8y
1NrbDQzb6I3oa/zdpgCfPwBAqPFWBKrShXhDzngWDk+ilAT/W8y3lpbsUvtH
qvWpDMh2xso+B9PYW1vs0zkajrhuvul33sZfLH8+i9oSBJh8ZranIQm6EKvU
gTnTcgkovu60lUDTQETr8qfUQ/L9AYRyjZO3HHolMJzjlexheYF00/ffw2zJ
u3ytEbF/lhoPwseGjg6+DroDdatcDPkXZAHtn7Y9zPfGW3kzPmIZfbSAS5gJ
UujS7HEX8CGjJOV6seqomFm09NAMXptvQkYjmkgamKlAC/wKv+NycC1u+TKc
ZdHYkfFimeYKR4HmoUIfB9VRXqSG7rIH3fri8vqmD6bykFqUnp5PdRovW9lO
hAajAd4QTcNsqC45AFraDHdr1l1AogdQWfh5qOeRymxeNE9OKSd4btHkK/ND
bFLSf2iEJz3bkHljKGgKQx2FULC+p/vvhYT/Na3BthZfaUyjyMFpCQTWEB8+
T+jLTF8wIGDHfTC7h8hCJkB51FxVIZYvPkQNTD+BjXYKP5AJXtp82VVvo7wp
FQvyK23Q14wGpghtcZaFfRpiaDXtWTDwCkNfpxL8qKg14U3rzAihqz3wVi+f
+R0hGp6zTLKclde1rGsUboTRzQRroOpLbnkY271xOvypximbJBkzRBTlhJ/s
5b72W/fX/gEV0tHM9CuoRy9skoTI8MVohzs+XbOQMHB0JJVag34jOvtbZWnr
303nxm1gI3DSW+BzgimaNq2tSc/hJ1tqmNHfGhCZQbCFPlR7FbtFkxlHiTc1
AE8nXEwILYoEFw/ePPq44uOr4sSrXy9I8AEfL4EsGwiiK/EhkT2UxOsaJR7s
0OJCgxA9kvLMrS5dlpOARvKqjcMmmgIhmWASmd3D/aBtqf1TF9HOBJrzNIap
le6kq5JukF8tPDC6mlAeoAPNMnUES334tLJNmYNqu7kXq+MEH8qpcBCmcbm/
lnnLaZmR/OWmaI6/s6mwFLdShZQaSNsI1ri5q3XqoAHHVRpK4I8bjcveKOSo
2+U343Wyjuhzmlidl/LNQeni2A002D9vEcSM0eo+o4jvTGz4h0oRSSFpy4cc
d6Lv2bw4eaXjR1TyXKk2UJMbEipEZ73trHUfbSh/u2e6FsoTfDgDzvVptlb8
AvNqJiRpv+dNGni0dA8YHc0z2pUj6mvHS45za8/T+ln/mTWZjBrdEcXj1+nL
0slnH5MdnInScrLd9+/PsOccTMKEVXgnXrHai/Yo7DI1qf1lxYKaMHqVNSxH
YGQBayz49ZvM9HvCgHWBS0U4aH90n/5ZTYLwRtguj8ZQasDut8GmWFF9oett
41QGq2wXj01wMxY/Q1APjMgBXLpkECxU56KqmM+nC4VfRi2kabeXdZrVllzk
T3nGzYERm1YYpGRMzV6IlD2gODR/Mrm2x8zJFmUsjFayXdB3TznoOsIejOWa
spEEyynTS7aNAQut3vZe07mcgwankJxDCVFVM6ide1bi8qSl1x1vOWe/m8l0
JUk3qiFL1NEMkKI8IxkWjqtLKsoMFm80ILfPbX0P1uSmojb4gTCsBYqwx81u
q15yMgGJ8zxCN8Wch/nQE8noH2Rf30pyx+09v8KJ16YlYP5+9Czj2CpxIdpt
7G8v+hjsK7kHF8+wEjqPGqfMfcuSnAROy5uCFd7cqwF1uHCna0bVzWK5DxJs
oK5tm2c4bMswxRtukfbZ6JgMpeXVvaLfBRdx0zp/lKM51as7+9VXrDrXB6+e
uyHYi7It9bd360RAJcvJJ3k24tzBadq0tnUN9UvJnBJP7Ci8VaWz/JamhXv8
5VI7rSn/EYo1fkkWrGWHR5/noEs7h+qKEVQ1nc6MogWSNH7w6EjxSp5LdfRQ
0YWokWmtDmS50vd/AC6XFX4JKnahMd3HGXiWMG1aMrYsxfCzAFVyA6M51as7
+9VXrDrXB6+euyEU6DbtzVfK6NpGZ2z6MEk385PGlfbbaqL+YOndJG+YN3J5
3BH3lU9RN0ln2rc6kyQPk45DqR41vvdQXzimhIyyQWOmHfwxvZN0L2dfR77I
Dn1NMGX193BOWj25PauMhCHvCc8SNI+257ptu0Og7Afu6mTd13PHkaOqqzG1
USbpjozwvODcC6xf0IvDgtzM3FbsqeDOYC8jjh/pHlY4TfBBUo8TX5lZb5q9
sLD90NyAaLfT3MdNPpsdqxKQm3fQePKXVZExNpB/SlMV4Jh3kh0kwmTZm0VS
g9SIgkAlgOJ71SH7GP30XJy66clNW5Q/i62U70WtIakkE7rk1kmLHgaurT0b
YJTX1psumyADTqV1hW4z9liGSQF1MoU4rRpG8KG93/I1oD3rjDb+r/3N2KFV
xjynFOZgeriFNZjPx+4xfhQcxK81cdppa5B5P0wAAFQ0nalgizkR7OMwCTaB
LQbo7JY2c8ex3tRl1afzGJEQGMThTe+MI8glxfz26VmW4HmnT/1zc5pL4gp0
JQgOU3gqM7zgt5GL3Q8F/rOWeB4SCyjsmnErz3/bhu8i1S25gFeH3MEP6k6X
kM38HUR972G3Hcl0nvxL9XnyOZlGaRQhHfEhkT2UxOsaJR7s0OJCgxA9kvLM
rS5dlpOARvKqjcMmmgIhmWASmd3D/aBtqf1TF9HOBJrzNIaple6kq5JukF8t
PDC6mlAeoAPNMnUES334hMg6nKgFQwtuJzYoduiT7IjxECmhe98e+Y1TVjHK
DgqG51Qd9FBvo4kancx3SzZSASEvNWS07f7leyabXIpr+HadC1DCz+9uChzL
ffS/EJvzsWdul4gkYck8ivxfunwwoaHY7ICAl/7o0Kd0AuzAkUtfw4FLVkk4
PN6e+Dgr/kY3tgpDRK/gU/abaSFZATIKTMNwyMLUUAdWAmufNeogEguL95x6
wswFGG1pi1PGCeQuF1dmj4YK1gBmmWpddTge8QH8TftSHTPWWy+NXjPDUOhU
XNFBnUSjM8IzBVKWW9TskahscenNAez4pBuTX/h2TPProSUQQflY/QNy9uW3
mOnQOz3duBaJOK8BPIbrswLfejuNfYjvOIPOwqK6TnjOOQRTJZRmoF6uyxPr
dx2fv2S5w0oaK4yJ38hTDguR+b/LULE5AxpLFgZ3F9ryIRuxKnoj1CF2Ecnc
TMx6JKWCK9bIRrIr6DOCPFMdM8PBf076pgNe7vmGLeT64ctEo66nLlqp7bB3
1OGCCV4GbBoFPoD37KxWDmpmgLwRBv43E9HtI2L1AepxfugPw9sF0S4t+CB4
5Cm0euv0rDzRjOQdApkbu2+1pf2pEBttRLlYSmerp/ftexq9FhOA8ckrcsd6
PO/WBVcDSjRo1FecMwc/DYEt7udYAN9PGVuYxqcwOw52atjC472X/u2aFcoa
XBbhZXtTQwmSkwDLjfNcUtwMqxCgN44bCYacrBCKKUieHomO/hIXKUEQoQ4K
VDL1oV9NBmfLL5/IFqFxO2nVbRzjdGunAQ4wkUJ6378jttQrn11izYDCFCiL
aeM6E1hG7OvzO9MgbKnuNyuNETBs2LBsU9d+YUz/joX6aXdQYC8fbE2Uy3Ni
dnPdqPFyGXOLO896nolWcJA9xh28zWOlX2Hk/CPYk2eU5o9vip6MUU2poTSF
u4aB5+WlykmBphhlLB6JjZCOL0KEmIdqxDtf3ovFfN11+ax5eGrg8gpni08h
l4/7T2nVu3IKFyXqFf6DYteuYbXsGEoz0NdHsKAlygiuyU1dFldnxMMEMl+S
7Modf45ODQF1fLL4KlIfEVEusDfUSy3x5gcuVxnc2iqx/SW0L0cqlLvH4iNS
/IbG5w1rxJ08hblnHZ6GgLELewSf/JZTy954XVJ4Va/H7Oo+HUCmvFsvwFZP
n238+DtO3CFONylnQChH0lnHUtUduAVZOP18xRICbbel1TxYNEEYJVnZ038c
YZEjaww6g/cCpslWJ+r70UWGJA47mGhp+sZl7uOvbp6/2ObUpKbmqOLy6JqR
u7sn4rRewLfNflCC9dIDSc23GTsAJDuNAnxcAPE6qgKsdUd59xrPII749936
yxYLTlyJW9o/NlWCGZcq9fJ4efH+iBR9js0PUmg7Po7ipIv6E8gp8E4FtxOU
f7M+DOe8Rh9dPJHZS/uUJHWW9iZwW8sMj7H1tOVRzUlevT3NNltmWn6vNynC
6JdhGzkIKUt+NrHGfxEsC0hDaqInKQZeW9gent6eTW6SoBUjR0m99XUOxX8M
UcmyE0zZzcKKHAQ5uICqdyIVyKh1ocsSFD1LFT7Arplw67kzaUTUZS+/aO7d
MUYlKzEd6NT64SsQdtMGMpWhdWxejwS2DqXO3RycIq0PryMHPSoDz5KHOfUz
egQkNK8iygOAkDa+Uft+TbcSHprSwPlj30szkoAMe9jnHQ6po/iTAmLbwxC9
++jVC1ttytUutkjKOzcoU+CtJXkMyysBNceuuasm2mFMK5ZVnsNq/+1DAdKL
Ee5Ny9FmiOm4ZJWgklshYh3Dv5QPbJiEVQqFBcKvXBhIQl/kZmoFiDYe6tRe
LEBaRL9wpBsrY9pJ7RntQyC0I9/9MhSXCRUcGDA4Ruw/2q+17hSV7GRmvKWi
bV9eHikRZl5fxVD5eIoW3XX5rHl4auDyCmeLTyGXj/tPadW7cgoXJeoV/oNi
165WQLe09AyJdFNI9n0d1Y/rzz85ikMkv1ddy2cpVPQ37rfEF/xrZjPM+ixa
2ek9bRK6ZRBpgFnXHdlKucH6uE0Vzz85ikMkv1ddy2cpVPQ37lrptq+Eu9dq
xdR67zWY2vTEezjlNLzxjmFV/Nj4QZZe0Kj2mWChCqRr5L6XKpz+Zl412/Fl
rff09DinTkBZC3ce1b9LLL6UtuUqXc4eTUbOayhnGjEo6q/m5jk5rNfrFg6F
ZZCRKU8sI9fJ2qqaYUy/QUC71GbUENtk5iq4cSR6t+WmTH+7oRPeAmmL9NUM
BtOgggagmt7nY5jmOnPf+2PY2uBj/DmmpncgCJzsknlwACxX2XnOsoLXZ5Lf
pdJAzZoRUBScJubO5iVjjCha/AHxWKs/XJLjY5bPkSBZBRFGa+YgFCGpDlVR
81YGrqe4rzt2358f67FuvWwBeiBRYchQfEx2/k+mynGiZ+pQFEzlxS/SuQ83
oiVOM3D+MK9mwEvifPlpdjXYkk3RVJiFaLQglwRaPGBcM23ZS6Byx3epzjJt
0crxjlJgugFPzYSFQpA7jziIjOK4mj88uVt5bn2wmytFvDQcWoL3i/NtjcoQ
LYzNQBcDL5FmhF+ybj4UtDE4tkt1q4DvTaDrgG9bHSmBu5I7921hj671KpZj
YF+QJ+p/BoEHKABht8U5VrM4E3sWtY5ng5KORrUeYCrx66S0fvHQhkKqmKb1
EF90mGQHzQArDwqhj7qFmmQfie0dBZ3FVi2ZOQeVtZ6JGVzHCzqV3/KHCB0L
qklySeZ9eQuAeY9rOrbgiaD0cYneps+K2qD1JySlvshj0C/yy1k5SfVYYuVF
Od1gLc6JidwfDTc3Ya3ViVAMFKZdbk7+zYHqKNOgggagmt7nY5jmOnPf+2Po
1vRw1fStspvQfrJIZUrghu5ct2sYvxzQXyDHukvsDsv/iHRdZjzmwW90wA5G
LGcofOUSKFHXW0fGMCKqn0Sz43+TRrrWBgNdaSZTluZIDM/2wL3vB8O2PqNb
8Znkl1hBkm8rR93qh5pzVhgLfpyyX03cmrhxOYyGMG6i+Jkyn3TYHLMl+Ywx
8jgYLXg3P1LnQ/yR90Fbms6ZCAC0fBPzWy/AVk+fbfz4O07cIU43KVKPGYUv
dCznkRjnZTzUnS1ybZmXbcHBY9G/P0ky1/3rAX3LX76gyKV/pjS9VHC8tSCB
N8OIYtsCnBdBxrIcnBDr0+sDYvfeHR3lkNm8cVb/SN92ylp1o19GX0uaCN3e
EDRF+fsoM/EfbMpc3Tn4pTAgFJQ9qpkmZ6tLZiS3B0PmpKu148ZRgeGtcuga
/0mNJc8/OYpDJL9XXctnKVT0N+4julCGYpKh63od4t47XX6be/6FwfhQnBCS
+VEq24WAKvaRiZuHgQojETI7FSCziM3LIxuOahnFZj5MVE8gfZVGMkhwemyc
vVgUVXSIcRgg721MJo24FyxsG4o4SzeWT+3/m9id+8K1cXQS8Xk0TYM7K957
H6swAEqHuIj6lc4Ls8rpCBmDUhyT3e1gYCS/f3a6Tc5TTyt2DsTHiJflYXv6
H/mvBGvz6mscB8boT8nQ5R4s18g5XiEy35H8T+/VnXkl/0qezyWQCDKzJIDA
KKlMv0z0kGKF99CcUSQRQkQGrtiYwZ7ue9Fu3uOUkINQr5AOAs/LGCusm3Ab
31ZMTImr8I0UykhXFZcy/PLLignCozA4lu+35s85XldauPNtVhXmiGKz7/kM
/+102yy2K1MBzILnRdpL21mIYQXcKg+1ZhuC+zEDvhP3PgKgEgLCCWygsDVR
/vXWmDaoxxX1LbFrkkH8b2XGjOCbXVK5sQE3+9xTqcyzuPwGYRV28epL7xZF
4MHzWhCgo94wsd7QOFc/L3/kLCLlnaToWv/r5qwtvKJtX14eKRFmXl/FUPl4
ihbddfmseXhq4PIKZ4tPIZeP+09p1btyChcl6hX+g2LXrlZAt7T0DIl0U0j2
fR3Vj+vPPzmKQyS/V13LZylU9Dfu77dmqFX+E25lmBWnegMXDg3pssyyevbs
8RuQMQWW9qmSmXqlyMKaKONzR4u/BEOCA/lnI0eoD6zW+jWhwPs6RN4jeAhm
Ng2hHPsSvOWTvkvJLpxJqoKppPBHMyAC5POK0PbXfVFyIhnth2ymCtq0oNjs
illSF4tHiw20eVFg7pCWMzvUzwZ0z5j2s7lQutdgdYqmXUVb437vascQZPG7
MRkkXCChOLcV9swdBjagw9J0Y3KszDzhwdc+JS6onqh2GKu+uoFPvYqUexyg
racb7uv84Si3MBCw9+gs2v85zca0njySB7e5RkqJLinC7VWgRFw+/Aa2PZ8q
oHI3P0wYnW2M307mnv3TVBvrQp2U2gUZ1+p9Sa54pZ+ZW0Gtx5zmHgq3Y6Bl
IPxsc7QHqmKBANUDbffLz3vc0osHwxBg6M/i3cq/nQySOM/+hfMRr8G/9hV+
PNUaHXyMXYDbGx+GqWlqP/4EcMyt+/WTkcFZg68rATXHrrmrJtphTCuWVZ7D
av/tQwHSixHuTcvRZojpuGSVoJJbIWIdw7+UD2yYhFUKhQXCr1wYSEJf5GZq
BYg2Bw929i1TNOdRsf8QVem3n7D5xKTMf1Ia2p24x1dgzUXPLp8xPE5N6tw/
DodBQYr/wK7LkG/plrdiQGv7gc8b7gE6FCe79rfNVX3LUr0OrPLV9IcPOTLC
qv2txSROeigkL700KoMh+KXDtp44Jt3BpXCu3NknBvqOOEy+JBOaCITKbzXl
nwbRAVHYnfJb+tMgqm3y8xad2ivhtg1jwk36a8Lw5arkyQuXyDcViLVEkRHr
41EbbGtQaWIW8JewPO2PTV0WV2fEwwQyX5Lsyh1/jkj2lSsDvkHtl6xbKHRT
u0MuIc1FPzvwpCqv7xXVTuOil9e7TNgVhOrZ6XLnpini1C6Y16zVSXCzCHni
q+M3VBbONyawMbrI/AfbrKGGXBfxEKq9C0l8oPswsWEcKs8PUKWmDzXjaP0m
x/DJbLc1ZgMkmbFPnW2Mde4Zaxw8bHi3VS3+epyOjTntTIbGW9n2a0BDaPTX
M9RF4B93B/pqH2POTM02OLpPmvSO1cqFdgItfKmTVFO9hqw1lOPMykHB4Tdb
KmXGrz23bZjIK9m6GEBybZmXbcHBY9G/P0ky1/3riv1kqNmHY9NQdxi/5hfc
pGwk39tfpwHRMZwc2YLSO5/4Bs4mOsoPLma2s1LvlRyzw8meeqFWRT4Lh7VX
8rv6nyKBwukmGlj5VLBbRZO+yxu3yhmaGwrbwL5xg1lbBkjWjv4SFylBEKEO
ClQy9aFfTQZnyy+fyBahcTtp1W0c43RrpwEOMJFCet+/I7bUK59dYs2AwhQo
i2njOhNYRuzr83uiKtssXOVuio25A9xnfspVfV5KPpw671sfyIOxa+ob0lAn
y0ph9n8OgFHLxxc5TIivnxeYKyr7GA4DpRJKd4TJVYehJqXhUNRnv8Cqdd2N
mp57dCLrwFOSIrNfWif+FcybnWhYcY6EkTXyI87RRpMhC9bNZSfRFdsU+lr7
XI5qBZ7lmULYmpJHZtKMuV/XxaXCMBc7WYWazZiXao95tY4R+vV8u1sSU8Zr
tMe3txwpXEXhcF2FqwEuvYXiaPYmDkLc8nQ7LpNr70Tphj+cBc4JqsUX8PAh
I9lPnb/6ygDPkEQo+mts26CG8mDxiREmGg6FZZCRKU8sI9fJ2qqaYUwYnf5+
i0dtx99gkmr62T8OIQ0PFxwgF24Ihqnp4sjGSNX0hw85MsKq/a3FJE56KCT+
bbUil4R6SjVYOE+BoW4+IQ0PFxwgF24Ihqnp4sjGSJYJfjyQUC3Mgo0ZIV8y
Lwp/e9NfnRnj3tbgnKUjpzZLyS6cSaqCqaTwRzMgAuTzitD2131RciIZ7Yds
pgratKDY7IpZUheLR4sNtHlRYO6QljM71M8GdM+Y9rO5ULrXYHWKpl1FW+N+
72rHEGTxuzFwNuHpgARPxT3dDFu/UphpZRbVSrnvE5hhQHbd735U8gW3mXDr
Nf7JUcz6QRal6QRKo38QTbBCVunu+OOxemy7/KLUPP98cctYrvD2pyauu7VM
nB91oWcv9O8VqrzkqcZDgjYKaazHoOgL6HHTXFN2Zbbkit5WZFmHafFrhsGb
dXmaM16p8wWePdjhnmOxH7NtjN9O5p7901Qb60KdlNoFGdfqfUmueKWfmVtB
rcec5h4Kt2OgZSD8bHO0B6pigQA+i2YAfnxHK9p88dfW2I2ymhYY5eXR2M5X
FAPKVVAwW4aOvrijtDLuz2JsB38f1syRUTSUkJGBNAjUThL+8RMU9hV+PNUa
HXyMXYDbGx+GqWlqP/4EcMyt+/WTkcFZg68rATXHrrmrJtphTCuWVZ7Dav/t
QwHSixHuTcvRZojpuGSVoJJbIWIdw7+UD2yYhFUKhQXCr1wYSEJf5GZqBYg2
HurUXixAWkS/cKQbK2PaSe0Z7UMgtCPf/TIUlwkVHBgwOEbsP9qvte4Ulexk
Zrylom1fXh4pEWZeX8VQ+XiKFt11+ax5eGrg8gpni08hl4/7T2nVu3IKFyXq
Ff6DYteuKpZFB8jV/Cm7jKvJOXd0ciCBN8OIYtsCnBdBxrIcnBDr0+sDYvfe
HR3lkNm8cVb/LJOr17edjRJt/Hgfq60ioUZCLQlIEhbjsGrC8CXLmPao95lo
AfF77kl3LpNqL6TadYqmXUVb437vascQZPG7MSHZHc2ol43+VlgVVBQfspvL
RNuLwiKJnMF+0lSGI55sMcr+iutwmhGCsA9ieY72wbx94Ffg3cs6+jpdEISX
WRdA20V43eFAIBFoeXPfSSRz1sL8YwgV4N5H6jEetKCZUpmILymlxbC8r8MD
rAEJ34h02ByzJfmMMfI4GC14Nz9S5hHk7Xu6r3F9gXFK2bbKwmk+X4wC6YB5
320FvRChKPDs1uGGfggLU2EhCubkdFHitZ/1aLRvK/sMZtnCMrvuDNPZ7LVK
1ISNQTLSbF7rtefjs6hgxfGqdIEAGAogM275eQpw907DQQ0OTevgByg30sce
+trRFnDSgN2ZMJb8xd2u6ZYRDafEA5txWb4wcPw4xBTR1T0QONmGP3Njc9in
bAKp195cUGU/i9l+8Ap0c85bkz7P++N/pSsqqZ9t2Q8eFjDcXUmJ3p66lN+3
no418u5ROGwOdNlqHGA64zIwsvthBhx3DeDNActaDCAag9yx3rC6sbO49g6/
JlJvvn/KWUtatsJZqWxZU1OjBrA4Wz2whFb4rxs2NCCdKbMUj/b2qtxJJRdi
N1GF8lytV4JKuA22GI10g1o1zeXBBrE/BVcrATXHrrmrJtphTCuWVZ7Dav/t
QwHSixHuTcvRZojpuGSVoJJbIWIdw7+UD2yYhFUKhQXCr1wYSEJf5GZqBYg2
OAdrlcx+qSilzgcXHK9erJ2b8jTJsmopx7RQ/Q3GmGz7tnf+jrHu+vllUwa/
MGslPXwOQUmwLEJ4gp6WeZvlCTRXGTA433K9/SKo0BlMssOoTP4BYOM6Szxo
r9OnC8s+pGs24pbxUiTg5q9AXNkjM+CD3u6zpnPPGlTWsIsHfwoiAJxkHFcY
HRScBzyG/OM/m5Q9x+O9Sgy1nZLY7W031D475vU0dQPFA9da+HQsJb0hdT4x
6mSToW3RR5Bdpl3oxS/SuQ83oiVOM3D+MK9mwFxde5slhGS+xcVtnt8jqbV5
EYaHBTowhraT/DHoFZndTxakRazCGOA4oKp8/1rCJC2d1rKYL1QUH+b+VvoC
7+DVOIL0XwXSi7tpR75Je6VYux1WcPCHnguEeGn9E12WYDpUueqQf3I8/j9L
xjw9eTM6ROShRZUNW2JC/B4pyXqgL3uks3SY+cREibCQZGphRTmop2ES/Jsj
3lUzwonyHUwYi+zG7OVG0sMc3UrYzAwDrlOnzkCsyN0PYbT2xUl2VBM/2rfe
xnMOewXlnQLl6Jbyzt3N0e71/T5B+zAS0FxQ6GC78czOVqPTuTjC9YHiIHCu
3NknBvqOOEy+JBOaCITy60zQJSjIpPbg21mSMXZwOY1dcisCnkKd9VgmZp2Y
zBomKIya9SPsJuh/vSoVTrBai1AbAdZWoh6X35BoB/+dqM0kMH9x0rVG3x7p
tW+1Fakm9o60bb46XrLyN8BPkf3Qj8XsuYk2jWkomzz+AZt5XByuozjwcAuX
aAgWLeDjuHM9aJah++RwGqNTGFrjYfnjatG4URfCBX108NlY+urxHDGrX8ya
FpHAy2RGk/2hpoMTHjn1qiztC5NUM1Qve76ZFs1VCpaOrC8r8oI5NyN1+Wxg
o9qo96LDZLvz5Be8EkA9YXI9IVBOyVS4cD0w2H3AGdRGEmbi+hhI5WME/qU7
sKtax18TSKX9c4kHdnLlRF96E5qnzdIO1j2ksh5QAi9de6/nvkWQsl91cVCw
kFVboRXjl01OjAccXPP0qcjEo54fpsdQz3zR565SS2S1F0BFP/++dC5cJORZ
BlU4nqBKntVfbIyPuPD+2LeUoQr20CWnWP70tNSi0cf8NDTsdmdqMQK/w0tU
D/a7b+rBRPj9AToUJ7v2t81VfctSvQ6s8uZrXOa52Nagxtuu8suEyPCYKY8Q
tqwOV5UYnFltYjDPax9u/XBSADheFzeV66XeEsql4HCbJfnjgVLJ82SAOez+
R1p7paHDJosyAGBqCMeYhvt5bsOsuyGv1JcgmOogyAMwRJOdQBqqS3TCgAt8
H8hyAkkjXB77ELFGN8Js1Ppi7XlU4xoPrUHoqDkusrhgnC6bLsTJn75eFiUC
1kEJsvUh8txi9OG16Dib6+bw1Auko10XnENslEv3PiasTQAkm8yQjQy8fPJS
IBTwUIg+Qtn3sTXa6SmdgMYlOEvVCR0a7rqGuJYNORUJu8dBu45tASaAkC0b
A/3rMt7cENv+M0cA/O5yu1I60FTE7SdswsKvtRC+LEP4eAs3s64ffc81l/Hi
jJyf6wruQiWTGn0tCxdHzOxFlcMJUz+6dPkV/eRmzfvUps3iZgQcLbB4I77P
KTPOlQsfobzG0pN4IC6Rekg=
END;','package',NULL,SYSDATE,SYSDATE,NULL,NULL,NULL,'obj',13);
