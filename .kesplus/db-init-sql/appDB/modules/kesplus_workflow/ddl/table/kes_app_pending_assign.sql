-- "kesplus_workflow"."kes_app_pending_assign" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_app_pending_assign";

CREATE TABLE "kesplus_workflow"."kes_app_pending_assign" (
	"id" character varying(32 char) NOT NULL,
	"module_code" character varying(50 char) NULL,
	"dept_id" character varying(32 char) NULL,
	"pending_id" character varying(32 char) NOT NULL,
	"assignee_id" character varying(32 char) NOT NULL,
	"assignee_dept_id" character varying(32 char) NULL,
	"assignee_name" character varying(32 char) NULL,
	"assignee_dept_name" character varying(128 char) NULL,
	"create_time" datetime NULL,
	"create_by" character varying(32 char) NULL,
	"update_time" datetime NULL,
	"update_by" character varying(32 char) NULL,
	CONSTRAINT "pk_kes_app_pending_assign" PRIMARY KEY (id)
);


CREATE INDEX inxex_kes_app_pending_assign_pending_id ON kesplus_workflow.kes_app_pending_assign USING btree (pending_id);
CREATE INDEX inxex_kes_app_pending_assign_assignee_id ON kesplus_workflow.kes_app_pending_assign USING btree (assignee_id);