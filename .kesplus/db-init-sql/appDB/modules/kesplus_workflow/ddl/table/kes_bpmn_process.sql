-- "kesplus_workflow"."kes_bpmn_process" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_process";

CREATE TABLE "kesplus_workflow"."kes_bpmn_process" (
"id" character varying(32 char) NOT NULL,
	"form_code" character varying(64 char) NOT NULL,
	"business_id" character varying(64 char) NOT NULL,
	"form_role_id" character varying(64 char) NOT NULL,
	"process_key" character varying(64 char) NOT NULL,
	"process_instance_id" character varying(64 char) NULL,
	"root_process_instance_id" character varying(64 char) NULL,
	"parent_process_instance_id" character varying(64 char) NULL DEFAULT 0,
	"submit_user_id" character varying(32 char) NULL,
	"submit_time" datetime NULL,
	"complete_user_id" character varying(32 char) NULL,
	"complete_time" datetime NULL,
	"process_status" character varying(32 char) NULL DEFAULT 0,
	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
	"process_result" integer NULL,
	"process_version" integer NULL DEFAULT 1,
	"start_node_id" varchar NULL,
	"start_node_name" varchar NULL,
	"end_node_id" varchar NULL,
	"end_node_name" varchar NULL,
	"config_id" varchar NULL,
	"title" character varying(255 char) NULL,
	"variables" json NULL,
	"path" character varying(500 char) NULL,
	"form_vue" character varying(255 char) NULL,
	"form_type" integer NULL,
	"process_variables" json NULL,
	"end_flows" jsonb NULL,
	"create_time" datetime NULL,
	"process_type" integer NULL,
	"process_name" character varying(256 char) NULL,
	CONSTRAINT "pk_kes_bpmn_process" PRIMARY KEY (id)
);
CREATE INDEX idx_kes_bpmn_process_form_code_business_id ON "kesplus_workflow".kes_bpmn_process USING btree (form_code, business_id);

CREATE INDEX inxex_kes_bpmn_process_process_instance_id ON kesplus_workflow.kes_bpmn_process USING btree (process_instance_id);
CREATE INDEX inxex_kes_bpmn_process_business_id ON kesplus_workflow.kes_bpmn_process USING btree (business_id);
CREATE INDEX inxex_kes_bpmn_process_process_key_process_version ON kesplus_workflow.kes_bpmn_process USING btree (process_key, process_version);

-- Column comments

COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."form_code" IS '表单编号';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."business_id" IS '业务主键';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."form_role_id" IS '权限角色id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."process_key" IS '流程编号';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."process_instance_id" IS '流程实例id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."root_process_instance_id" IS '流程实例根实例id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."parent_process_instance_id" IS '流程实例上层实例id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."submit_user_id" IS '提交人id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."submit_time" IS '提交时间';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."complete_user_id" IS '完成人id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."complete_time" IS '办结时间';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."process_status" IS '流程最终状态';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."process_result" IS '流程最终结果';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."process_version" IS '流程使用的模板的版本号';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."start_node_id" IS '开始节点的节点id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."start_node_name" IS '开始节点的节点名称';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."end_node_id" IS '结束节点的节点id';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."end_node_name" IS '结束节点的节点名称';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_process"."config_id" IS '流程配置表id';