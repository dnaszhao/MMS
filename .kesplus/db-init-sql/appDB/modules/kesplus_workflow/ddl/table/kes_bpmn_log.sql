-- "kesplus_workflow"."kes_bpmn_log" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_log";

CREATE TABLE "kesplus_workflow"."kes_bpmn_log" (
"id" character varying(32 char) NOT NULL,
	"process_instance_id" character varying(64 char) NOT NULL,
	"execution_id" character varying(64 char) NULL,
	"task_id" character varying(64 char) NULL,
	"handle_type" smallint NULL DEFAULT 0,
	"handle_result" smallint NULL DEFAULT 0,
	"create_by" character varying(32 char) NOT NULL,
	"create_time" datetime NOT NULL,
	"handle_time" datetime NOT NULL,
	"handler_id" character varying(32 char) NOT NULL,
	"handler_name" character varying(64 char) NOT NULL,
	"handler_dept_id" character varying(32 char) NOT NULL DEFAULT 0,
	"handler_dept_name" character varying(64 char) NULL,
	"handle_opinions" json NULL,
	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
	"task_def_key" character varying(64 char) NULL,
	"task_name" character varying(128 char) NULL,
	"task_op_id" varchar NULL DEFAULT 0::varchar,
	CONSTRAINT "pk_kes_bpmn_log" PRIMARY KEY (id)
);
CREATE INDEX kes_bpmn_log_process_instance_id ON kesplus_workflow.kes_bpmn_log USING btree (process_instance_id);
CREATE INDEX inxex_kes_bpmn_log_task_op_id ON kesplus_workflow.kes_bpmn_log USING btree (task_op_id);
-- Column comments

COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."process_instance_id" IS '流程实例ID';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."execution_id" IS '执行ID';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."task_id" IS '流程任务id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handle_type" IS '操作类型1-创建实例；2-创建任务；3-任务办结；4-实例办结';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handle_result" IS '操作结果';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handle_time" IS '办理完成时间';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handler_id" IS '办理人用户id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handler_name" IS '办理人姓名';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handler_dept_id" IS '办理人部门id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."handler_dept_name" IS '办理人部门';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."task_def_key" IS '任务节点定义id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_log"."task_name" IS '任务名称';