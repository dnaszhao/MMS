-- "kesplus_workflow"."kes_bpmn_modeler" definition

-- Drop table

DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_modeler";

CREATE TABLE "kesplus_workflow"."kes_bpmn_modeler" (
	"ID" character varying(32 char) NOT NULL,
    	"module_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"tenant_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"process_key" character varying(64 char) NOT NULL,
    	"process_name" character varying(255 char) NULL DEFAULT NULL::varchar,
    	"BYTES_" bytea NULL,
    	"process_type" smallint NULL,
    	"process_type_name" character varying(255 char) NULL DEFAULT NULL::varchar,
    	"deployed" integer NOT NULL DEFAULT 0,
    	"enabled" tinyint NULL,
    	"create_by" character varying(32 char) NOT NULL,
    	"create_time" datetime NOT NULL,
    	"update_by" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"update_time" datetime NULL DEFAULT NULL::timestamp without time zone,
    	"del" tinyint NULL,
    	"biz_meta" text NULL,
    	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
    	"process_version" integer NULL DEFAULT 0,
	CONSTRAINT "idx_kes_bpmn_modeler_process_key" UNIQUE (process_key),
	CONSTRAINT "pk_kes_bpmn_modeler" PRIMARY KEY (ID)
);
CREATE INDEX idx_kes_bpmn_modeler_enabled ON "kesplus_workflow".kes_bpmn_modeler USING btree (enabled);