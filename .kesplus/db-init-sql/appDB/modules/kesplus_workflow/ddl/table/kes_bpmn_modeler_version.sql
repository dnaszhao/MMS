DROP TABLE IF EXISTS "kesplus_workflow"."kes_bpmn_modeler_version";
CREATE TABLE "kesplus_workflow"."kes_bpmn_modeler_version" (
	"ID" character varying(32 char) NOT NULL,
    	"process_key" character varying(64 char) NOT NULL,
    	"process_version" integer NULL DEFAULT 1,
    	"BYTES_" bytea NULL,
    	"actived" tinyint NULL,
    	"create_by" character varying(32 char) NOT NULL,
    	"create_time" datetime NOT NULL,
    	"update_by" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"update_time" datetime NULL DEFAULT NULL::timestamp without time zone,
    	"del" tinyint NULL,
    	"dept_id" character varying(32 char) NULL DEFAULT NULL::varchar,
    	"module_code" character varying(128 char) NULL DEFAULT NULL::varchar,
    	"process_type" integer NULL,
    	"process_name" character varying(256 char) NULL,
    	"process_def_id" character varying(128 char) NULL,
    	"variables" json NULL,
    	"process_flows" jsonb NULL,
    	"process_title" character varying(255 char) NULL,
	CONSTRAINT "idx_kes_bpmn_modeler_version_process_key_process_version" UNIQUE (process_key, process_version),
	CONSTRAINT "pk_kes_bpmn_modeler_version" PRIMARY KEY (ID)
);