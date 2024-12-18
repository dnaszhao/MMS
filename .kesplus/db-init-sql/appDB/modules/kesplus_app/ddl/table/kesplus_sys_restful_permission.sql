CREATE TABLE "kesplus_app"."kesplus_sys_restful_permission" (
    "dept_id" character varying(32 char) NULL,
    "id" character varying(32 char) NOT NULL,
     "module_id" character varying(32 char) NULL,
	"tenant_id" character varying(32 char) NULL,
	"restful_id" character varying(32 char) NULL,
	"permission_id" character varying(32 char) NULL,
	"create_time" date NULL,
	"update_time" date NULL,
	"create_by" character varying(32 char) NULL,
	"update_by" character varying(32 char) NULL
);


COMMENT ON COLUMN "kesplus_app"."kesplus_sys_restful_permission"."restful_id" IS  'restful接口';
COMMENT ON COLUMN "kesplus_app"."kesplus_sys_restful_permission"."permission_id" IS  '权限点集合';