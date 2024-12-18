-- "kesplus_workflow"."kes_bpmn_task" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_task";

CREATE TABLE "kesplus_workflow"."kes_bpmn_task" (
	"id" character varying(32 char) NOT NULL,
    	"process_instance_id" character varying(64 char) NOT NULL,
    	"execution_id" character varying(64 char) NULL,
    	"create_by" character varying(32 char) NOT NULL,
    	"create_time" datetime NOT NULL,
    	"task_def_key" character varying(64 char) NULL,
    	"task_status" smallint NOT NULL DEFAULT 0,
    	"task_result" character varying(32 char) NULL,
    	"complete_time" datetime NULL,
    	"handler_id" character varying(32 char) NULL,
    	"handler_name" character varying(64 char) NULL,
    	"handler_dept_id" character varying(32 char) NULL DEFAULT 0,
    	"handler_dept_name" character varying(64 char) NULL,
    	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
    	"task_id" character varying(64 char) NOT NULL,
    	"task_name" character varying(128 char) NULL,
    	"prefix_id" character varying(64 char) NULL DEFAULT 0::varchar,
    	"can_retract" integer NULL,
    	"op_status" smallint NULL DEFAULT 0,
    	"update_by" varchar NULL,
    	"update_time" datetime NULL,
    	"variables" json NULL,
    	"task_flows" jsonb NULL,
	CONSTRAINT "pk_kes_bpmn_task" PRIMARY KEY (id)
);
CREATE INDEX idx_kes_bpmn_task_process_instance_id_execution_id ON "kesplus_workflow".kes_bpmn_task USING btree (process_instance_id, execution_id);
CREATE INDEX idx_kes_bpmn_task_process_instance_id_task_def_key ON "kesplus_workflow".kes_bpmn_task USING btree (process_instance_id, task_def_key);

CREATE INDEX inxex_kes_bpmn_task_process_instance_id ON kesplus_workflow.kes_bpmn_task USING btree (process_instance_id);
CREATE INDEX inxex_kes_bpmn_task_prefix_id ON kesplus_workflow.kes_bpmn_task USING btree (prefix_id);
CREATE INDEX inxex_kes_bpmn_task_task_id ON kesplus_workflow.kes_bpmn_task USING btree (task_id);

-- Column comments

COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."process_instance_id" IS '流程实例id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."execution_id" IS '当前执行id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."task_def_key" IS '流程节点定义id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."task_status" IS '任务状态';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."task_result" IS '任务结果';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."complete_time" IS '办结时间';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."task_id" IS '任务id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_task"."task_name" IS '节点名称';