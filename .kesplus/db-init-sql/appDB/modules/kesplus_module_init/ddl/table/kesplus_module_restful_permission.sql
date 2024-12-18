
CREATE TABLE "${moduleSchema}"."kesplus_module_restful_permission" (
     "module_id" character varying(32 char) NULL,
	"tenant_id" character varying(32 char) NULL,
	"restful_id" character varying(32 char) NULL,
	"permission_id" character varying(32 char) NULL,
	"create_time" date NULL,
	"update_time" date NULL,
	"create_by" character varying(32 char) NULL,
	"update_by" character varying(32 char) NULL,
	"dept_id" character varying(32 char) NULL,
	"id" character varying(32 char) NOT NULL
);

