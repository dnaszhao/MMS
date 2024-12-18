-- "kesplus_workflow"."kes_app_pending_his" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_app_pending_his";

CREATE TABLE "kesplus_workflow"."kes_app_pending_his" (
	"id" character varying(32 char) NOT NULL,
	"module_code" character varying(50 char) NULL,
	"dept_id" character varying(32 char) NULL,
	"type" character varying(64 char) NOT NULL,
	"title" character varying(256 char) NOT NULL,
	"path" character varying(500 char) NOT NULL,
	"create_time" datetime NULL,
	"create_by" character varying(32 char) NULL,
	"update_time" datetime NULL,
	"update_by" character varying(32 char) NULL,
	"handler_id" character varying(32 char) NULL,
	"handler_dept_id" character varying(32 char) NULL,
	"handler_name" character varying(32 char) NULL,
	"handler_dept_name" character varying(128 char) NULL,
	"status" tinyint NULL,
	"variables" json NULL,
	"pending_key" character varying(128 char) NOT NULL,
	"complete_time" datetime NULL,
	"business_id" varchar NULL,
	"form_vue" character varying(255 char) NULL,
	"real_name" character varying(256 char) NULL,
    "process_type" integer NULL,
    "process_instance_id" character varying(64 char) NULL,
    "process_status" character varying(32 char) NULL,
    "dept_name" character varying(64 char) NULL,
	CONSTRAINT "pk_kes_app_pending_his" PRIMARY KEY (id)
);

CREATE INDEX inxex_kes_app_pending_his_pending_key ON kesplus_workflow.kes_app_pending_his USING btree (pending_key);
CREATE INDEX inxex_kes_app_pending_his_business_id ON kesplus_workflow.kes_app_pending_his USING btree (business_id);