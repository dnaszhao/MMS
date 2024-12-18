-- "kesplus_workflow"."kes_bpmn_listener" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_listener";

CREATE TABLE "kesplus_workflow"."kes_bpmn_listener" (
		"id" character varying(32 char) NOT NULL,
    	"form_code" character varying(128 char) NULL DEFAULT NULL::varchar,
    	"listener_type" smallint NULL DEFAULT 2,
    	"listener_content" character varying(512 char) NOT NULL,
    	"node_id" character varying(64 char) NULL DEFAULT NULL::varchar,
    	"listener_index" integer NULL DEFAULT 1,
    	"create_by" character varying(32 char) NOT NULL,
    	"create_time" datetime NOT NULL,
    	"update_by" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"update_time" datetime NULL DEFAULT NULL::timestamp without time zone,
    	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
    	"config_id" varchar NOT NULL,
	CONSTRAINT "pk_kes_bpmn_listener" PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."form_code" IS '表单编号';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."listener_type" IS '2-用户任务监听；其他待定义';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."listener_content" IS '监听器的表达式';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."node_id" IS '节点定义ID';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."listener_index" IS '执行顺序';
COMMENT ON COLUMN "kesplus_workflow"."kes_bpmn_listener"."config_id" IS '流程配置表id';