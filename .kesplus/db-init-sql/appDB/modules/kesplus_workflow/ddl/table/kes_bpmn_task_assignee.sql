DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_task_assignee";
CREATE TABLE "kesplus_workflow"."kes_bpmn_task_assignee" (
	"id" character varying(32 char) NOT NULL,
    	"task_id" character varying(32 char) NOT NULL,
    	"assignee_id" character varying(32 char) NOT NULL,
    	"assignee_name" character varying(64 char) NULL,
    	"assignee_dept_id" character varying(32 char) NULL DEFAULT 0,
    	"assignee_dept_name" character varying(64 char) NULL,
    	"task_op_id" character varying(64 char) NULL,
	CONSTRAINT "pkey_bpmn_task_assignee" PRIMARY KEY (id)
);
CREATE INDEX idx_kes_bpmn_task_assignee_assignee_id_assignee_dept_id ON "kesplus_workflow".kes_bpmn_task_assignee USING btree (assignee_id, assignee_dept_id);
CREATE INDEX idx_kes_bpmn_task_task_id ON "kesplus_workflow".kes_bpmn_task_assignee USING btree (task_id);

CREATE INDEX inxex_kes_bpmn_task_assignee_task_op_id ON kesplus_workflow.kes_bpmn_task_assignee USING btree (task_op_id);
CREATE INDEX inxex_kes_bpmn_task_assignee_assignee_id ON kesplus_workflow.kes_bpmn_task_assignee USING btree (assignee_id);