-- "kesplus_workflow"."kes_bpmn_task_flow_log" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_task_flow_log";

CREATE TABLE "kesplus_workflow"."kes_bpmn_task_flow_log" (
	"id" character varying(64 char) NOT NULL,
    	"name" character varying(64 char) NULL,
    	"business_id" character varying(64 char) NULL,
    	"process_id" character varying(64 char) NULL,
    	"flow_text" text NULL,
    	"create_time" datetime NULL,
	CONSTRAINT "pk_kes_bpmn_task_flow_log" PRIMARY KEY (id)
);