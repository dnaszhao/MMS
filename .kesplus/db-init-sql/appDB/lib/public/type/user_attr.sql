-- CREATE TYPE "kesplus_manage"."user_attr";

CREATE TYPE "public"."user_attr" AS ENUM (
	'userId',
	'username',
	'realName',
	'pwdResetTime',
	'enabled',
	'isAdmin',
	'isRememberMe',
	'uKey',
	'comeFrom',
	'companyId',
	'companyName',
	'deptId',
	'deptName',
	'tenantId',
	'roleIds',
	'roles',
	'email',
	'mobile',
	'managerId',
	'managerUserName',
	'managerRealName',
	'supperDeptId',
	'password',
	'isVip',
	'supperDeptName');