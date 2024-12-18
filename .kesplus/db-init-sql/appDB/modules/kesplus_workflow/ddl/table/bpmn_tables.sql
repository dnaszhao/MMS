-- "kesplus_workflow"."ACT_GE_PROPERTY" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_GE_PROPERTY";

CREATE TABLE "kesplus_workflow"."ACT_GE_PROPERTY" (
	"NAME_" character varying(64 char) NOT NULL,
	"VALUE_" character varying(300 char) NULL,
	"REV_" integer NULL,
	CONSTRAINT "ACT_GE_PROPERTY_pkey" PRIMARY KEY (NAME_)
);


-- "kesplus_workflow"."ACT_GE_SCHEMA_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_GE_SCHEMA_LOG";

CREATE TABLE "kesplus_workflow"."ACT_GE_SCHEMA_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"TIMESTAMP_" timestamp without time zone NULL,
	"VERSION_" character varying(255 char) NULL,
	CONSTRAINT "ACT_GE_SCHEMA_LOG_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_HI_ACTINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_ACTINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_ACTINST" (
	"ID_" character varying(64 char) NOT NULL,
	"PARENT_ACT_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NOT NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NOT NULL,
	"EXECUTION_ID_" character varying(64 char) NOT NULL,
	"ACT_ID_" character varying(255 char) NOT NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"CALL_PROC_INST_ID_" character varying(64 char) NULL,
	"CALL_CASE_INST_ID_" character varying(64 char) NULL,
	"ACT_NAME_" character varying(255 char) NULL,
	"ACT_TYPE_" character varying(255 char) NOT NULL,
	"ASSIGNEE_" character varying(4000 char) NULL,
	"START_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"DURATION_" bigint NULL,
	"ACT_INST_STATE_" integer NULL,
	"SEQUENCE_COUNTER_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_ACTINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_ACTINST_ROOT_PI ON "kesplus_workflow".ACT_HI_ACTINST USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_COMP ON "kesplus_workflow".ACT_HI_ACTINST USING btree (EXECUTION_ID_, ACT_ID_, END_TIME_, ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_END ON "kesplus_workflow".ACT_HI_ACTINST USING btree (END_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_PROCINST ON "kesplus_workflow".ACT_HI_ACTINST USING btree (PROC_INST_ID_, ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_ACTINST USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_ACT_INST_RM_TIME ON "kesplus_workflow".ACT_HI_ACTINST USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_START_END ON "kesplus_workflow".ACT_HI_ACTINST USING btree (START_TIME_, END_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_STATS ON "kesplus_workflow".ACT_HI_ACTINST USING btree (PROC_DEF_ID_, PROC_INST_ID_, ACT_ID_, END_TIME_, ACT_INST_STATE_);
CREATE INDEX ACT_IDX_HI_ACT_INST_TENANT_ID ON "kesplus_workflow".ACT_HI_ACTINST USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_AI_PDEFID_END_TIME ON "kesplus_workflow".ACT_HI_ACTINST USING btree (PROC_DEF_ID_, END_TIME_);


-- "kesplus_workflow"."ACT_HI_ATTACHMENT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_ATTACHMENT";

CREATE TABLE "kesplus_workflow"."ACT_HI_ATTACHMENT" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"USER_ID_" character varying(255 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"DESCRIPTION_" character varying(4000 char) NULL,
	"TYPE_" character varying(255 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"URL_" character varying(4000 char) NULL,
	"CONTENT_ID_" character varying(64 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_ATTACHMENT_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_ATTACHMENT_CONTENT ON "kesplus_workflow".ACT_HI_ATTACHMENT USING btree (CONTENT_ID_);
CREATE INDEX ACT_IDX_HI_ATTACHMENT_PROCINST ON "kesplus_workflow".ACT_HI_ATTACHMENT USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_ATTACHMENT_RM_TIME ON "kesplus_workflow".ACT_HI_ATTACHMENT USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_ATTACHMENT_ROOT_PI ON "kesplus_workflow".ACT_HI_ATTACHMENT USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_ATTACHMENT_TASK ON "kesplus_workflow".ACT_HI_ATTACHMENT USING btree (TASK_ID_);


-- "kesplus_workflow"."ACT_HI_BATCH" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_BATCH";

CREATE TABLE "kesplus_workflow"."ACT_HI_BATCH" (
	"ID_" character varying(64 char) NOT NULL,
	"TYPE_" character varying(255 char) NULL,
	"TOTAL_JOBS_" integer NULL,
	"JOBS_PER_SEED_" integer NULL,
	"INVOCATIONS_PER_JOB_" integer NULL,
	"SEED_JOB_DEF_ID_" character varying(64 char) NULL,
	"MONITOR_JOB_DEF_ID_" character varying(64 char) NULL,
	"BATCH_JOB_DEF_ID_" character varying(64 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_USER_ID_" character varying(255 char) NULL,
	"START_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_BATCH_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_HI_BAT_RM_TIME ON "kesplus_workflow".ACT_HI_BATCH USING btree (REMOVAL_TIME_);


-- "kesplus_workflow"."ACT_HI_CASEACTINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_CASEACTINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_CASEACTINST" (
	"ID_" character varying(64 char) NOT NULL,
	"PARENT_ACT_INST_ID_" character varying(64 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NOT NULL,
	"CASE_INST_ID_" character varying(64 char) NOT NULL,
	"CASE_ACT_ID_" character varying(255 char) NOT NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"CALL_PROC_INST_ID_" character varying(64 char) NULL,
	"CALL_CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_ACT_NAME_" character varying(255 char) NULL,
	"CASE_ACT_TYPE_" character varying(255 char) NULL,
	"CREATE_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"DURATION_" bigint NULL,
	"STATE_" integer NULL,
	"REQUIRED_" boolean NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_HI_CASEACTINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_CAS_A_I_COMP ON "kesplus_workflow".ACT_HI_CASEACTINST USING btree (CASE_ACT_ID_, END_TIME_, ID_);
CREATE INDEX ACT_IDX_HI_CAS_A_I_CREATE ON "kesplus_workflow".ACT_HI_CASEACTINST USING btree (CREATE_TIME_);
CREATE INDEX ACT_IDX_HI_CAS_A_I_END ON "kesplus_workflow".ACT_HI_CASEACTINST USING btree (END_TIME_);
CREATE INDEX ACT_IDX_HI_CAS_A_I_TENANT_ID ON "kesplus_workflow".ACT_HI_CASEACTINST USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_HI_CASEINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_CASEINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_CASEINST" (
	"ID_" character varying(64 char) NOT NULL,
	"CASE_INST_ID_" character varying(64 char) NOT NULL,
	"BUSINESS_KEY_" character varying(255 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NOT NULL,
	"CREATE_TIME_" timestamp without time zone NOT NULL,
	"CLOSE_TIME_" timestamp without time zone NULL,
	"DURATION_" bigint NULL,
	"STATE_" integer NULL,
	"CREATE_USER_ID_" character varying(255 char) NULL,
	"SUPER_CASE_INSTANCE_ID_" character varying(64 char) NULL,
	"SUPER_PROCESS_INSTANCE_ID_" character varying(64 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_HI_CASEINST_CASE_INST_ID__key" UNIQUE (CASE_INST_ID_),
	CONSTRAINT "ACT_HI_CASEINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_CAS_I_BUSKEY ON "kesplus_workflow".ACT_HI_CASEINST USING btree (BUSINESS_KEY_);
CREATE INDEX ACT_IDX_HI_CAS_I_CLOSE ON "kesplus_workflow".ACT_HI_CASEINST USING btree (CLOSE_TIME_);
CREATE INDEX ACT_IDX_HI_CAS_I_TENANT_ID ON "kesplus_workflow".ACT_HI_CASEINST USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_HI_COMMENT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_COMMENT";

CREATE TABLE "kesplus_workflow"."ACT_HI_COMMENT" (
	"ID_" character varying(64 char) NOT NULL,
	"TYPE_" character varying(255 char) NULL,
	"TIME_" timestamp without time zone NOT NULL,
	"USER_ID_" character varying(255 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"ACTION_" character varying(255 char) NULL,
	"MESSAGE_" character varying(4000 char) NULL,
	"FULL_MSG_" bytea NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_COMMENT_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_COMMENT_PROCINST ON "kesplus_workflow".ACT_HI_COMMENT USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_COMMENT_RM_TIME ON "kesplus_workflow".ACT_HI_COMMENT USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_COMMENT_ROOT_PI ON "kesplus_workflow".ACT_HI_COMMENT USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_COMMENT_TASK ON "kesplus_workflow".ACT_HI_COMMENT USING btree (TASK_ID_);


-- "kesplus_workflow"."ACT_HI_DECINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_DECINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_DECINST" (
	"ID_" character varying(64 char) NOT NULL,
	"DEC_DEF_ID_" character varying(64 char) NOT NULL,
	"DEC_DEF_KEY_" character varying(255 char) NOT NULL,
	"DEC_DEF_NAME_" character varying(255 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"CASE_DEF_KEY_" character varying(255 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"EVAL_TIME_" timestamp without time zone NOT NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	"COLLECT_VALUE_" double precision NULL,
	"USER_ID_" character varying(255 char) NULL,
	"ROOT_DEC_INST_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"DEC_REQ_ID_" character varying(64 char) NULL,
	"DEC_REQ_KEY_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_HI_DECINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_DEC_INST_ACT ON "kesplus_workflow".ACT_HI_DECINST USING btree (ACT_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_ACT_INST ON "kesplus_workflow".ACT_HI_DECINST USING btree (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_CI ON "kesplus_workflow".ACT_HI_DECINST USING btree (CASE_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_ID ON "kesplus_workflow".ACT_HI_DECINST USING btree (DEC_DEF_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_KEY ON "kesplus_workflow".ACT_HI_DECINST USING btree (DEC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_DEC_INST_PI ON "kesplus_workflow".ACT_HI_DECINST USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_REQ_ID ON "kesplus_workflow".ACT_HI_DECINST USING btree (DEC_REQ_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_REQ_KEY ON "kesplus_workflow".ACT_HI_DECINST USING btree (DEC_REQ_KEY_);
CREATE INDEX ACT_IDX_HI_DEC_INST_RM_TIME ON "kesplus_workflow".ACT_HI_DECINST USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_DEC_INST_ROOT_ID ON "kesplus_workflow".ACT_HI_DECINST USING btree (ROOT_DEC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_ROOT_PI ON "kesplus_workflow".ACT_HI_DECINST USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_TENANT_ID ON "kesplus_workflow".ACT_HI_DECINST USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_DEC_INST_TIME ON "kesplus_workflow".ACT_HI_DECINST USING btree (EVAL_TIME_);


-- "kesplus_workflow"."ACT_HI_DEC_IN" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_DEC_IN";

CREATE TABLE "kesplus_workflow"."ACT_HI_DEC_IN" (
	"ID_" character varying(64 char) NOT NULL,
	"DEC_INST_ID_" character varying(64 char) NOT NULL,
	"CLAUSE_ID_" character varying(64 char) NULL,
	"CLAUSE_NAME_" character varying(255 char) NULL,
	"VAR_TYPE_" character varying(100 char) NULL,
	"BYTEARRAY_ID_" character varying(64 char) NULL,
	"DOUBLE_" double precision NULL,
	"LONG_" bigint NULL,
	"TEXT_" character varying(4000 char) NULL,
	"TEXT2_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_DEC_IN_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_DEC_IN_CLAUSE ON "kesplus_workflow".ACT_HI_DEC_IN USING btree (DEC_INST_ID_, CLAUSE_ID_);
CREATE INDEX ACT_IDX_HI_DEC_IN_INST ON "kesplus_workflow".ACT_HI_DEC_IN USING btree (DEC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_IN_RM_TIME ON "kesplus_workflow".ACT_HI_DEC_IN USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_DEC_IN_ROOT_PI ON "kesplus_workflow".ACT_HI_DEC_IN USING btree (ROOT_PROC_INST_ID_);


-- "kesplus_workflow"."ACT_HI_DEC_OUT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_DEC_OUT";

CREATE TABLE "kesplus_workflow"."ACT_HI_DEC_OUT" (
	"ID_" character varying(64 char) NOT NULL,
	"DEC_INST_ID_" character varying(64 char) NOT NULL,
	"CLAUSE_ID_" character varying(64 char) NULL,
	"CLAUSE_NAME_" character varying(255 char) NULL,
	"RULE_ID_" character varying(64 char) NULL,
	"RULE_ORDER_" integer NULL,
	"VAR_NAME_" character varying(255 char) NULL,
	"VAR_TYPE_" character varying(100 char) NULL,
	"BYTEARRAY_ID_" character varying(64 char) NULL,
	"DOUBLE_" double precision NULL,
	"LONG_" bigint NULL,
	"TEXT_" character varying(4000 char) NULL,
	"TEXT2_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_DEC_OUT_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_DEC_OUT_INST ON "kesplus_workflow".ACT_HI_DEC_OUT USING btree (DEC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_OUT_RM_TIME ON "kesplus_workflow".ACT_HI_DEC_OUT USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_DEC_OUT_ROOT_PI ON "kesplus_workflow".ACT_HI_DEC_OUT USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DEC_OUT_RULE ON "kesplus_workflow".ACT_HI_DEC_OUT USING btree (RULE_ORDER_, CLAUSE_ID_);


-- "kesplus_workflow"."ACT_HI_DETAIL" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_DETAIL";

CREATE TABLE "kesplus_workflow"."ACT_HI_DETAIL" (
	"ID_" character varying(64 char) NOT NULL,
	"TYPE_" character varying(255 char) NOT NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"CASE_DEF_KEY_" character varying(255 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"VAR_INST_ID_" character varying(64 char) NULL,
	"NAME_" character varying(255 char) NOT NULL,
	"VAR_TYPE_" character varying(64 char) NULL,
	"REV_" integer NULL,
	"TIME_" timestamp without time zone NOT NULL,
	"BYTEARRAY_ID_" character varying(64 char) NULL,
	"DOUBLE_" double precision NULL,
	"LONG_" bigint NULL,
	"TEXT_" character varying(4000 char) NULL,
	"TEXT2_" character varying(4000 char) NULL,
	"SEQUENCE_COUNTER_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"OPERATION_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	"INITIAL_" boolean NULL,
	CONSTRAINT "ACT_HI_DETAIL_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_DETAIL_ACT_INST ON "kesplus_workflow".ACT_HI_DETAIL USING btree (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_BYTEAR ON "kesplus_workflow".ACT_HI_DETAIL USING btree (BYTEARRAY_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_CASE_EXEC ON "kesplus_workflow".ACT_HI_DETAIL USING btree (CASE_EXECUTION_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_CASE_INST ON "kesplus_workflow".ACT_HI_DETAIL USING btree (CASE_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_NAME ON "kesplus_workflow".ACT_HI_DETAIL USING btree (NAME_);
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_DETAIL USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_INST ON "kesplus_workflow".ACT_HI_DETAIL USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_RM_TIME ON "kesplus_workflow".ACT_HI_DETAIL USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_DETAIL_ROOT_PI ON "kesplus_workflow".ACT_HI_DETAIL USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_BYTEAR ON "kesplus_workflow".ACT_HI_DETAIL USING btree (BYTEARRAY_ID_, TASK_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_ID ON "kesplus_workflow".ACT_HI_DETAIL USING btree (TASK_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TENANT_ID ON "kesplus_workflow".ACT_HI_DETAIL USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TIME ON "kesplus_workflow".ACT_HI_DETAIL USING btree (TIME_);
CREATE INDEX ACT_IDX_HI_DETAIL_VAR_INST_ID ON "kesplus_workflow".ACT_HI_DETAIL USING btree (VAR_INST_ID_);


-- "kesplus_workflow"."ACT_HI_EXT_TASK_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_EXT_TASK_LOG";

CREATE TABLE "kesplus_workflow"."ACT_HI_EXT_TASK_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"TIMESTAMP_" timestamp without time zone NOT NULL,
	"EXT_TASK_ID_" character varying(64 char) NOT NULL,
	"RETRIES_" integer NULL,
	"TOPIC_NAME_" character varying(255 char) NULL,
	"WORKER_ID_" character varying(255 char) NULL,
	"PRIORITY_" bigint NULL DEFAULT 0,
	"ERROR_MSG_" character varying(4000 char) NULL,
	"ERROR_DETAILS_ID_" character varying(64 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"STATE_" integer NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_EXT_TASK_LOG_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_HI_EXT_TASK_LOG_PROCDEF ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_HI_EXT_TASK_LOG_PROCINST ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (PROC_INST_ID_);
CREATE INDEX ACT_HI_EXT_TASK_LOG_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_HI_EXT_TASK_LOG_RM_TIME ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_HI_EXT_TASK_LOG_ROOT_PI ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_HI_EXT_TASK_LOG_TENANT_ID ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_EXTTASKLOG_ERRORDET ON "kesplus_workflow".ACT_HI_EXT_TASK_LOG USING btree (ERROR_DETAILS_ID_);


-- "kesplus_workflow"."ACT_HI_IDENTITYLINK" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_IDENTITYLINK";

CREATE TABLE "kesplus_workflow"."ACT_HI_IDENTITYLINK" (
	"ID_" character varying(64 char) NOT NULL,
	"TIMESTAMP_" timestamp without time zone NOT NULL,
	"TYPE_" character varying(255 char) NULL,
	"USER_ID_" character varying(255 char) NULL,
	"GROUP_ID_" character varying(255 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"OPERATION_TYPE_" character varying(64 char) NULL,
	"ASSIGNER_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_IDENTITYLINK_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_IDENT_LINK_RM_TIME ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_IDENT_LINK_TASK ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (TASK_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_GROUP ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (GROUP_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_ROOT_PI ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TENANT_ID ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TIMESTAMP ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (TIMESTAMP_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER ON "kesplus_workflow".ACT_HI_IDENTITYLINK USING btree (USER_ID_);


-- "kesplus_workflow"."ACT_HI_INCIDENT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_INCIDENT";

CREATE TABLE "kesplus_workflow"."ACT_HI_INCIDENT" (
	"ID_" character varying(64 char) NOT NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"CREATE_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"INCIDENT_MSG_" character varying(4000 char) NULL,
	"INCIDENT_TYPE_" character varying(255 char) NOT NULL,
	"ACTIVITY_ID_" character varying(255 char) NULL,
	"FAILED_ACTIVITY_ID_" character varying(255 char) NULL,
	"CAUSE_INCIDENT_ID_" character varying(64 char) NULL,
	"ROOT_CAUSE_INCIDENT_ID_" character varying(64 char) NULL,
	"CONFIGURATION_" character varying(255 char) NULL,
	"HISTORY_CONFIGURATION_" character varying(255 char) NULL,
	"INCIDENT_STATE_" integer NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"JOB_DEF_ID_" character varying(64 char) NULL,
	"ANNOTATION_" character varying(4000 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_INCIDENT_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_INCIDENT_CREATE_TIME ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (CREATE_TIME_);
CREATE INDEX ACT_IDX_HI_INCIDENT_END_TIME ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (END_TIME_);
CREATE INDEX ACT_IDX_HI_INCIDENT_PROCINST ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_INCIDENT_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_INCIDENT_RM_TIME ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_INCIDENT_ROOT_PI ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_INCIDENT_TENANT_ID ON "kesplus_workflow".ACT_HI_INCIDENT USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_HI_JOB_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_JOB_LOG";

CREATE TABLE "kesplus_workflow"."ACT_HI_JOB_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"TIMESTAMP_" timestamp without time zone NOT NULL,
	"JOB_ID_" character varying(64 char) NOT NULL,
	"JOB_DUEDATE_" timestamp without time zone NULL,
	"JOB_RETRIES_" integer NULL,
	"JOB_PRIORITY_" bigint NULL DEFAULT 0,
	"JOB_EXCEPTION_MSG_" character varying(4000 char) NULL,
	"JOB_EXCEPTION_STACK_ID_" character varying(64 char) NULL,
	"JOB_STATE_" integer NULL,
	"JOB_DEF_ID_" character varying(64 char) NULL,
	"JOB_DEF_TYPE_" character varying(255 char) NULL,
	"JOB_DEF_CONFIGURATION_" character varying(255 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"FAILED_ACT_ID_" character varying(255 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROCESS_INSTANCE_ID_" character varying(64 char) NULL,
	"PROCESS_DEF_ID_" character varying(64 char) NULL,
	"PROCESS_DEF_KEY_" character varying(255 char) NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"SEQUENCE_COUNTER_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"HOSTNAME_" character varying(255 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_JOB_LOG_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_JOB_LOG_EX_STACK ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (JOB_EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_JOB_CONF ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (JOB_DEF_CONFIGURATION_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_JOB_DEF_ID ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (JOB_DEF_ID_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_PROCDEF ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (PROCESS_DEF_ID_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_PROCINST ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (PROCESS_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_RM_TIME ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_ROOT_PI ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_JOB_LOG_TENANT_ID ON "kesplus_workflow".ACT_HI_JOB_LOG USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_HI_OP_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_OP_LOG";

CREATE TABLE "kesplus_workflow"."ACT_HI_OP_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"JOB_ID_" character varying(64 char) NULL,
	"JOB_DEF_ID_" character varying(64 char) NULL,
	"BATCH_ID_" character varying(64 char) NULL,
	"USER_ID_" character varying(255 char) NULL,
	"TIMESTAMP_" timestamp without time zone NOT NULL,
	"OPERATION_TYPE_" character varying(64 char) NULL,
	"OPERATION_ID_" character varying(64 char) NULL,
	"ENTITY_TYPE_" character varying(30 char) NULL,
	"PROPERTY_" character varying(64 char) NULL,
	"ORG_VALUE_" character varying(4000 char) NULL,
	"NEW_VALUE_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	"CATEGORY_" character varying(64 char) NULL,
	"EXTERNAL_TASK_ID_" character varying(64 char) NULL,
	"ANNOTATION_" character varying(4000 char) NULL,
	CONSTRAINT "ACT_HI_OP_LOG_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_OP_LOG_ENTITY_TYPE ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (ENTITY_TYPE_);
CREATE INDEX ACT_IDX_HI_OP_LOG_OP_TYPE ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (OPERATION_TYPE_);
CREATE INDEX ACT_IDX_HI_OP_LOG_PROCDEF ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_HI_OP_LOG_PROCINST ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_OP_LOG_RM_TIME ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_OP_LOG_ROOT_PI ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_OP_LOG_TASK ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (TASK_ID_);
CREATE INDEX ACT_IDX_HI_OP_LOG_TIMESTAMP ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (TIMESTAMP_);
CREATE INDEX ACT_IDX_HI_OP_LOG_USER_ID ON "kesplus_workflow".ACT_HI_OP_LOG USING btree (USER_ID_);


-- "kesplus_workflow"."ACT_HI_PROCINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_PROCINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_PROCINST" (
	"ID_" character varying(64 char) NOT NULL,
	"PROC_INST_ID_" character varying(64 char) NOT NULL,
	"BUSINESS_KEY_" character varying(255 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NOT NULL,
	"START_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	"DURATION_" bigint NULL,
	"START_USER_ID_" character varying(255 char) NULL,
	"START_ACT_ID_" character varying(255 char) NULL,
	"END_ACT_ID_" character varying(255 char) NULL,
	"SUPER_PROCESS_INSTANCE_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"SUPER_CASE_INSTANCE_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"DELETE_REASON_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"STATE_" character varying(255 char) NULL,
	CONSTRAINT "ACT_HI_PROCINST_PROC_INST_ID__key" UNIQUE (PROC_INST_ID_),
	CONSTRAINT "ACT_HI_PROCINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_PI_PDEFID_END_TIME ON "kesplus_workflow".ACT_HI_PROCINST USING btree (PROC_DEF_ID_, END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_INST_END ON "kesplus_workflow".ACT_HI_PROCINST USING btree (END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_INST_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_PROCINST USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_PRO_INST_PROC_TIME ON "kesplus_workflow".ACT_HI_PROCINST USING btree (START_TIME_, END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_INST_RM_TIME ON "kesplus_workflow".ACT_HI_PROCINST USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_INST_ROOT_PI ON "kesplus_workflow".ACT_HI_PROCINST USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_PRO_INST_TENANT_ID ON "kesplus_workflow".ACT_HI_PROCINST USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_PRO_I_BUSKEY ON "kesplus_workflow".ACT_HI_PROCINST USING btree (BUSINESS_KEY_);


-- "kesplus_workflow"."ACT_HI_TASKINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_TASKINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_TASKINST" (
	"ID_" character varying(64 char) NOT NULL,
	"TASK_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"CASE_DEF_KEY_" character varying(255 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"PARENT_TASK_ID_" character varying(64 char) NULL,
	"DESCRIPTION_" character varying(4000 char) NULL,
	"OWNER_" character varying(255 char) NULL,
	"ASSIGNEE_" character varying(4000 char) NULL,
	"START_TIME_" timestamp without time zone NOT NULL,
	"END_TIME_" timestamp without time zone NULL,
	"DURATION_" bigint NULL,
	"DELETE_REASON_" character varying(4000 char) NULL,
	"PRIORITY_" integer NULL,
	"DUE_DATE_" timestamp without time zone NULL,
	"FOLLOW_UP_DATE_" timestamp without time zone NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_TASKINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_TASKINSTID_PROCINST ON "kesplus_workflow".ACT_HI_TASKINST USING btree (ID_, PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_TASKINST_PROCINST ON "kesplus_workflow".ACT_HI_TASKINST USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_TASKINST_ROOT_PI ON "kesplus_workflow".ACT_HI_TASKINST USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_TASK_INST_END ON "kesplus_workflow".ACT_HI_TASKINST USING btree (END_TIME_);
CREATE INDEX ACT_IDX_HI_TASK_INST_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_TASKINST USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_TASK_INST_RM_TIME ON "kesplus_workflow".ACT_HI_TASKINST USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_TASK_INST_START ON "kesplus_workflow".ACT_HI_TASKINST USING btree (START_TIME_);
CREATE INDEX ACT_IDX_HI_TASK_INST_TENANT_ID ON "kesplus_workflow".ACT_HI_TASKINST USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_HI_VARINST" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_HI_VARINST";

CREATE TABLE "kesplus_workflow"."ACT_HI_VARINST" (
	"ID_" character varying(64 char) NOT NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"CASE_DEF_KEY_" character varying(255 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"NAME_" character varying(255 char) NOT NULL,
	"VAR_TYPE_" character varying(100 char) NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"REV_" integer NULL,
	"BYTEARRAY_ID_" character varying(64 char) NULL,
	"DOUBLE_" double precision NULL,
	"LONG_" bigint NULL,
	"TEXT_" character varying(4000 char) NULL,
	"TEXT2_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"STATE_" character varying(20 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_HI_VARINST_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_CASEVAR_CASE_INST ON "kesplus_workflow".ACT_HI_VARINST USING btree (CASE_INST_ID_);
CREATE INDEX ACT_IDX_HI_PROCVAR_NAME_TYPE ON "kesplus_workflow".ACT_HI_VARINST USING btree (NAME_, VAR_TYPE_);
CREATE INDEX ACT_IDX_HI_PROCVAR_PROC_INST ON "kesplus_workflow".ACT_HI_VARINST USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_VARINST_ACT_INST_ID ON "kesplus_workflow".ACT_HI_VARINST USING btree (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_VARINST_BYTEAR ON "kesplus_workflow".ACT_HI_VARINST USING btree (BYTEARRAY_ID_);
CREATE INDEX ACT_IDX_HI_VARINST_NAME ON "kesplus_workflow".ACT_HI_VARINST USING btree (NAME_);
CREATE INDEX ACT_IDX_HI_VARINST_RM_TIME ON "kesplus_workflow".ACT_HI_VARINST USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_HI_VARINST_ROOT_PI ON "kesplus_workflow".ACT_HI_VARINST USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_VAR_INST_PROC_DEF_KEY ON "kesplus_workflow".ACT_HI_VARINST USING btree (PROC_DEF_KEY_);
CREATE INDEX ACT_IDX_HI_VAR_INST_TENANT_ID ON "kesplus_workflow".ACT_HI_VARINST USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_HI_VAR_PI_NAME_TYPE ON "kesplus_workflow".ACT_HI_VARINST USING btree (PROC_INST_ID_, NAME_, VAR_TYPE_);
CREATE INDEX ACT_IDX_HI_VAR_INST_EXECUTION_ID ON "kesplus_workflow".ACT_HI_VARINST USING btree (EXECUTION_ID_);

-- "kesplus_workflow"."ACT_ID_GROUP" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_GROUP";

CREATE TABLE "kesplus_workflow"."ACT_ID_GROUP" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"NAME_" character varying(255 char) NULL,
	"TYPE_" character varying(255 char) NULL,
	CONSTRAINT "ACT_ID_GROUP_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_ID_INFO" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_INFO";

CREATE TABLE "kesplus_workflow"."ACT_ID_INFO" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"USER_ID_" character varying(64 char) NULL,
	"TYPE_" character varying(64 char) NULL,
	"KEY_" character varying(255 char) NULL,
	"VALUE_" character varying(255 char) NULL,
	"PASSWORD_" bytea NULL,
	"PARENT_ID_" character varying(255 char) NULL,
	CONSTRAINT "ACT_ID_INFO_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_ID_TENANT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_TENANT";

CREATE TABLE "kesplus_workflow"."ACT_ID_TENANT" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"NAME_" character varying(255 char) NULL,
	CONSTRAINT "ACT_ID_TENANT_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_ID_USER" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_USER";

CREATE TABLE "kesplus_workflow"."ACT_ID_USER" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"FIRST_" character varying(255 char) NULL,
	"LAST_" character varying(255 char) NULL,
	"EMAIL_" character varying(255 char) NULL,
	"PWD_" character varying(255 char) NULL,
	"SALT_" character varying(255 char) NULL,
	"LOCK_EXP_TIME_" timestamp without time zone NULL,
	"ATTEMPTS_" integer NULL,
	"PICTURE_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_ID_USER_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_RE_CAMFORMDEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_CAMFORMDEF";

CREATE TABLE "kesplus_workflow"."ACT_RE_CAMFORMDEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"KEY_" character varying(255 char) NOT NULL,
	"VERSION_" integer NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"RESOURCE_NAME_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RE_CAMFORMDEF_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_RE_CASE_DEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_CASE_DEF";

CREATE TABLE "kesplus_workflow"."ACT_RE_CASE_DEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CATEGORY_" character varying(255 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"KEY_" character varying(255 char) NOT NULL,
	"VERSION_" integer NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"RESOURCE_NAME_" character varying(4000 char) NULL,
	"DGRM_RESOURCE_NAME_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"HISTORY_TTL_" integer NULL,
	CONSTRAINT "ACT_RE_CASE_DEF_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_CASE_DEF_TENANT_ID ON "kesplus_workflow".ACT_RE_CASE_DEF USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RE_DECISION_REQ_DEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_DECISION_REQ_DEF";

CREATE TABLE "kesplus_workflow"."ACT_RE_DECISION_REQ_DEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CATEGORY_" character varying(255 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"KEY_" character varying(255 char) NOT NULL,
	"VERSION_" integer NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"RESOURCE_NAME_" character varying(4000 char) NULL,
	"DGRM_RESOURCE_NAME_" character varying(4000 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RE_DECISION_REQ_DEF_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_DEC_REQ_DEF_TENANT_ID ON "kesplus_workflow".ACT_RE_DECISION_REQ_DEF USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RE_DEPLOYMENT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_DEPLOYMENT";

CREATE TABLE "kesplus_workflow"."ACT_RE_DEPLOYMENT" (
	"ID_" character varying(64 char) NOT NULL,
	"NAME_" character varying(255 char) NULL,
	"DEPLOY_TIME_" timestamp without time zone NULL,
	"SOURCE_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RE_DEPLOYMENT_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_DEPLOYMENT_NAME ON "kesplus_workflow".ACT_RE_DEPLOYMENT USING btree (NAME_);
CREATE INDEX ACT_IDX_DEPLOYMENT_TENANT_ID ON "kesplus_workflow".ACT_RE_DEPLOYMENT USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RE_PROCDEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_PROCDEF";

CREATE TABLE "kesplus_workflow"."ACT_RE_PROCDEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CATEGORY_" character varying(255 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"KEY_" character varying(255 char) NOT NULL,
	"VERSION_" integer NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"RESOURCE_NAME_" character varying(4000 char) NULL,
	"DGRM_RESOURCE_NAME_" character varying(4000 char) NULL,
	"HAS_START_FORM_KEY_" boolean NULL,
	"SUSPENSION_STATE_" integer NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"VERSION_TAG_" character varying(64 char) NULL,
	"HISTORY_TTL_" integer NULL,
	"STARTABLE_" boolean NOT NULL DEFAULT true,
	CONSTRAINT "ACT_RE_PROCDEF_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_PROCDEF_DEPLOYMENT_ID ON "kesplus_workflow".ACT_RE_PROCDEF USING btree (DEPLOYMENT_ID_);
CREATE INDEX ACT_IDX_PROCDEF_TENANT_ID ON "kesplus_workflow".ACT_RE_PROCDEF USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_PROCDEF_VER_TAG ON "kesplus_workflow".ACT_RE_PROCDEF USING btree (VERSION_TAG_);


-- "kesplus_workflow"."ACT_RU_AUTHORIZATION" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_AUTHORIZATION";

CREATE TABLE "kesplus_workflow"."ACT_RU_AUTHORIZATION" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NOT NULL,
	"TYPE_" integer NOT NULL,
	"GROUP_ID_" character varying(255 char) NULL,
	"USER_ID_" character varying(255 char) NULL,
	"RESOURCE_TYPE_" integer NOT NULL,
	"RESOURCE_ID_" character varying(255 char) NULL,
	"PERMS_" integer NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_AUTHORIZATION_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_UNIQ_AUTH_GROUP" UNIQUE (TYPE_, GROUP_ID_, RESOURCE_TYPE_, RESOURCE_ID_),
	CONSTRAINT "ACT_UNIQ_AUTH_USER" UNIQUE (TYPE_, USER_ID_, RESOURCE_TYPE_, RESOURCE_ID_)
);
CREATE INDEX ACT_IDX_AUTH_GROUP_ID ON "kesplus_workflow".ACT_RU_AUTHORIZATION USING btree (GROUP_ID_);
CREATE INDEX ACT_IDX_AUTH_RESOURCE_ID ON "kesplus_workflow".ACT_RU_AUTHORIZATION USING btree (RESOURCE_ID_);
CREATE INDEX ACT_IDX_AUTH_RM_TIME ON "kesplus_workflow".ACT_RU_AUTHORIZATION USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_AUTH_ROOT_PI ON "kesplus_workflow".ACT_RU_AUTHORIZATION USING btree (ROOT_PROC_INST_ID_);


-- "kesplus_workflow"."ACT_RU_FILTER" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_FILTER";

CREATE TABLE "kesplus_workflow"."ACT_RU_FILTER" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NOT NULL,
	"RESOURCE_TYPE_" character varying(255 char) NOT NULL,
	"NAME_" character varying(255 char) NOT NULL,
	"OWNER_" character varying(255 char) NULL,
	"QUERY_" text NOT NULL,
	"PROPERTIES_" text NULL,
	CONSTRAINT "ACT_RU_FILTER_pkey" PRIMARY KEY (ID_)
);


-- "kesplus_workflow"."ACT_RU_JOBDEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_JOBDEF";

CREATE TABLE "kesplus_workflow"."ACT_RU_JOBDEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"JOB_TYPE_" character varying(255 char) NOT NULL,
	"JOB_CONFIGURATION_" character varying(255 char) NULL,
	"SUSPENSION_STATE_" integer NULL,
	"JOB_PRIORITY_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_JOBDEF_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_JOBDEF_PROC_DEF_ID ON "kesplus_workflow".ACT_RU_JOBDEF USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_JOBDEF_TENANT_ID ON "kesplus_workflow".ACT_RU_JOBDEF USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_METER_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_METER_LOG";

CREATE TABLE "kesplus_workflow"."ACT_RU_METER_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"NAME_" character varying(64 char) NOT NULL,
	"REPORTER_" character varying(255 char) NULL,
	"VALUE_" bigint NULL,
	"TIMESTAMP_" timestamp without time zone NULL,
	"MILLISECONDS_" bigint NULL DEFAULT 0,
	CONSTRAINT "ACT_RU_METER_LOG_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_METER_LOG ON "kesplus_workflow".ACT_RU_METER_LOG USING btree (NAME_, TIMESTAMP_);
CREATE INDEX ACT_IDX_METER_LOG_MS ON "kesplus_workflow".ACT_RU_METER_LOG USING btree (MILLISECONDS_);
CREATE INDEX ACT_IDX_METER_LOG_NAME_MS ON "kesplus_workflow".ACT_RU_METER_LOG USING btree (NAME_, MILLISECONDS_);
CREATE INDEX ACT_IDX_METER_LOG_REPORT ON "kesplus_workflow".ACT_RU_METER_LOG USING btree (NAME_, REPORTER_, MILLISECONDS_);
CREATE INDEX ACT_IDX_METER_LOG_TIME ON "kesplus_workflow".ACT_RU_METER_LOG USING btree (TIMESTAMP_);


-- "kesplus_workflow"."ACT_RU_TASK_METER_LOG" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_TASK_METER_LOG";

CREATE TABLE "kesplus_workflow"."ACT_RU_TASK_METER_LOG" (
	"ID_" character varying(64 char) NOT NULL,
	"ASSIGNEE_HASH_" bigint NULL,
	"TIMESTAMP_" timestamp without time zone NULL,
	CONSTRAINT "ACT_RU_TASK_METER_LOG_pkey" PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_TASK_METER_LOG_TIME ON "kesplus_workflow".ACT_RU_TASK_METER_LOG USING btree (TIMESTAMP_);


-- "kesplus_workflow"."ACT_GE_BYTEARRAY" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_GE_BYTEARRAY";

CREATE TABLE "kesplus_workflow"."ACT_GE_BYTEARRAY" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"NAME_" character varying(255 char) NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"BYTES_" bytea NULL,
	"GENERATED_" boolean NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"TYPE_" integer NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"REMOVAL_TIME_" timestamp without time zone NULL,
	CONSTRAINT "ACT_GE_BYTEARRAY_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_BYTEARR_DEPL" FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES "kesplus_workflow".ACT_RE_DEPLOYMENT(ID_)
);
CREATE INDEX ACT_IDX_BYTEARRAY_NAME ON "kesplus_workflow".ACT_GE_BYTEARRAY USING btree (NAME_);
CREATE INDEX ACT_IDX_BYTEARRAY_RM_TIME ON "kesplus_workflow".ACT_GE_BYTEARRAY USING btree (REMOVAL_TIME_);
CREATE INDEX ACT_IDX_BYTEARRAY_ROOT_PI ON "kesplus_workflow".ACT_GE_BYTEARRAY USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_BYTEAR_DEPL ON "kesplus_workflow".ACT_GE_BYTEARRAY USING btree (DEPLOYMENT_ID_);


-- "kesplus_workflow"."ACT_ID_MEMBERSHIP" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_MEMBERSHIP";

CREATE TABLE "kesplus_workflow"."ACT_ID_MEMBERSHIP" (
	"USER_ID_" character varying(64 char) NOT NULL,
	"GROUP_ID_" character varying(64 char) NOT NULL,
	CONSTRAINT "ACT_ID_MEMBERSHIP_pkey" PRIMARY KEY (USER_ID_, GROUP_ID_),
	CONSTRAINT "ACT_FK_MEMB_GROUP" FOREIGN KEY (GROUP_ID_) REFERENCES "kesplus_workflow".ACT_ID_GROUP(ID_),
	CONSTRAINT "ACT_FK_MEMB_USER" FOREIGN KEY (USER_ID_) REFERENCES "kesplus_workflow".ACT_ID_USER(ID_)
);
CREATE INDEX ACT_IDX_MEMB_GROUP ON "kesplus_workflow".ACT_ID_MEMBERSHIP USING btree (GROUP_ID_);
CREATE INDEX ACT_IDX_MEMB_USER ON "kesplus_workflow".ACT_ID_MEMBERSHIP USING btree (USER_ID_);


-- "kesplus_workflow"."ACT_ID_TENANT_MEMBER" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_ID_TENANT_MEMBER";

CREATE TABLE "kesplus_workflow"."ACT_ID_TENANT_MEMBER" (
	"ID_" character varying(64 char) NOT NULL,
	"TENANT_ID_" character varying(64 char) NOT NULL,
	"USER_ID_" character varying(64 char) NULL,
	"GROUP_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_ID_TENANT_MEMBER_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_UNIQ_TENANT_MEMB_GROUP" UNIQUE (TENANT_ID_, GROUP_ID_),
	CONSTRAINT "ACT_UNIQ_TENANT_MEMB_USER" UNIQUE (TENANT_ID_, USER_ID_),
	CONSTRAINT "ACT_FK_TENANT_MEMB" FOREIGN KEY (TENANT_ID_) REFERENCES "kesplus_workflow".ACT_ID_TENANT(ID_),
	CONSTRAINT "ACT_FK_TENANT_MEMB_GROUP" FOREIGN KEY (GROUP_ID_) REFERENCES "kesplus_workflow".ACT_ID_GROUP(ID_),
	CONSTRAINT "ACT_FK_TENANT_MEMB_USER" FOREIGN KEY (USER_ID_) REFERENCES "kesplus_workflow".ACT_ID_USER(ID_)
);
CREATE INDEX ACT_IDX_TENANT_MEMB ON "kesplus_workflow".ACT_ID_TENANT_MEMBER USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_TENANT_MEMB_GROUP ON "kesplus_workflow".ACT_ID_TENANT_MEMBER USING btree (GROUP_ID_);
CREATE INDEX ACT_IDX_TENANT_MEMB_USER ON "kesplus_workflow".ACT_ID_TENANT_MEMBER USING btree (USER_ID_);


-- "kesplus_workflow"."ACT_RE_DECISION_DEF" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RE_DECISION_DEF";

CREATE TABLE "kesplus_workflow"."ACT_RE_DECISION_DEF" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CATEGORY_" character varying(255 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"KEY_" character varying(255 char) NOT NULL,
	"VERSION_" integer NOT NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"RESOURCE_NAME_" character varying(4000 char) NULL,
	"DGRM_RESOURCE_NAME_" character varying(4000 char) NULL,
	"DEC_REQ_ID_" character varying(64 char) NULL,
	"DEC_REQ_KEY_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"HISTORY_TTL_" integer NULL,
	"VERSION_TAG_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RE_DECISION_DEF_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_DEC_REQ" FOREIGN KEY (DEC_REQ_ID_) REFERENCES "kesplus_workflow".ACT_RE_DECISION_REQ_DEF(ID_)
);
CREATE INDEX ACT_IDX_DEC_DEF_REQ_ID ON "kesplus_workflow".ACT_RE_DECISION_DEF USING btree (DEC_REQ_ID_);
CREATE INDEX ACT_IDX_DEC_DEF_TENANT_ID ON "kesplus_workflow".ACT_RE_DECISION_DEF USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_BATCH" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_BATCH";

CREATE TABLE "kesplus_workflow"."ACT_RU_BATCH" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NOT NULL,
	"TYPE_" character varying(255 char) NULL,
	"TOTAL_JOBS_" integer NULL,
	"JOBS_CREATED_" integer NULL,
	"JOBS_PER_SEED_" integer NULL,
	"INVOCATIONS_PER_JOB_" integer NULL,
	"SEED_JOB_DEF_ID_" character varying(64 char) NULL,
	"BATCH_JOB_DEF_ID_" character varying(64 char) NULL,
	"MONITOR_JOB_DEF_ID_" character varying(64 char) NULL,
	"SUSPENSION_STATE_" integer NULL,
	"CONFIGURATION_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_USER_ID_" character varying(255 char) NULL,
	CONSTRAINT "ACT_RU_BATCH_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_BATCH_JOB_DEF" FOREIGN KEY (BATCH_JOB_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RU_JOBDEF(ID_),
	CONSTRAINT "ACT_FK_BATCH_MONITOR_JOB_DEF" FOREIGN KEY (MONITOR_JOB_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RU_JOBDEF(ID_),
	CONSTRAINT "ACT_FK_BATCH_SEED_JOB_DEF" FOREIGN KEY (SEED_JOB_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RU_JOBDEF(ID_)
);
CREATE INDEX ACT_IDX_BATCH_JOB_DEF ON "kesplus_workflow".ACT_RU_BATCH USING btree (BATCH_JOB_DEF_ID_);
CREATE INDEX ACT_IDX_BATCH_MONITOR_JOB_DEF ON "kesplus_workflow".ACT_RU_BATCH USING btree (MONITOR_JOB_DEF_ID_);
CREATE INDEX ACT_IDX_BATCH_SEED_JOB_DEF ON "kesplus_workflow".ACT_RU_BATCH USING btree (SEED_JOB_DEF_ID_);


-- "kesplus_workflow"."ACT_RU_CASE_EXECUTION" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_CASE_EXECUTION";

CREATE TABLE "kesplus_workflow"."ACT_RU_CASE_EXECUTION" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"SUPER_CASE_EXEC_" character varying(64 char) NULL,
	"SUPER_EXEC_" character varying(64 char) NULL,
	"BUSINESS_KEY_" character varying(255 char) NULL,
	"PARENT_ID_" character varying(64 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"PREV_STATE_" integer NULL,
	"CURRENT_STATE_" integer NULL,
	"REQUIRED_" boolean NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_CASE_EXECUTION_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_CASE_EXE_CASE_DEF" FOREIGN KEY (CASE_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_CASE_DEF(ID_),
	CONSTRAINT "ACT_FK_CASE_EXE_CASE_INST" FOREIGN KEY (CASE_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_CASE_EXE_PARENT" FOREIGN KEY (PARENT_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_CASE_EXEC_BUSKEY ON "kesplus_workflow".ACT_RU_CASE_EXECUTION USING btree (BUSINESS_KEY_);
CREATE INDEX ACT_IDX_CASE_EXEC_TENANT_ID ON "kesplus_workflow".ACT_RU_CASE_EXECUTION USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_CASE_EXE_CASE_DEF ON "kesplus_workflow".ACT_RU_CASE_EXECUTION USING btree (CASE_DEF_ID_);
CREATE INDEX ACT_IDX_CASE_EXE_CASE_INST ON "kesplus_workflow".ACT_RU_CASE_EXECUTION USING btree (CASE_INST_ID_);
CREATE INDEX ACT_IDX_CASE_EXE_PARENT ON "kesplus_workflow".ACT_RU_CASE_EXECUTION USING btree (PARENT_ID_);


-- "kesplus_workflow"."ACT_RU_CASE_SENTRY_PART" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_CASE_SENTRY_PART";

CREATE TABLE "kesplus_workflow"."ACT_RU_CASE_SENTRY_PART" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_EXEC_ID_" character varying(64 char) NULL,
	"SENTRY_ID_" character varying(255 char) NULL,
	"TYPE_" character varying(255 char) NULL,
	"SOURCE_CASE_EXEC_ID_" character varying(64 char) NULL,
	"STANDARD_EVENT_" character varying(255 char) NULL,
	"SOURCE_" character varying(255 char) NULL,
	"VARIABLE_EVENT_" character varying(255 char) NULL,
	"VARIABLE_NAME_" character varying(255 char) NULL,
	"SATISFIED_" boolean NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_CASE_SENTRY_PART_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_CASE_SENTRY_CASE_EXEC" FOREIGN KEY (CASE_EXEC_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_CASE_SENTRY_CASE_INST" FOREIGN KEY (CASE_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_CASE_SENTRY_CASE_EXEC ON "kesplus_workflow".ACT_RU_CASE_SENTRY_PART USING btree (CASE_EXEC_ID_);
CREATE INDEX ACT_IDX_CASE_SENTRY_CASE_INST ON "kesplus_workflow".ACT_RU_CASE_SENTRY_PART USING btree (CASE_INST_ID_);


-- "kesplus_workflow"."ACT_RU_EXECUTION" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_EXECUTION";

CREATE TABLE "kesplus_workflow"."ACT_RU_EXECUTION" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"ROOT_PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"BUSINESS_KEY_" character varying(255 char) NULL,
	"PARENT_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"SUPER_EXEC_" character varying(64 char) NULL,
	"SUPER_CASE_EXEC_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"IS_ACTIVE_" boolean NULL,
	"IS_CONCURRENT_" boolean NULL,
	"IS_SCOPE_" boolean NULL,
	"IS_EVENT_SCOPE_" boolean NULL,
	"SUSPENSION_STATE_" integer NULL,
	"CACHED_ENT_STATE_" integer NULL,
	"SEQUENCE_COUNTER_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_EXECUTION_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_EXE_PARENT" FOREIGN KEY (PARENT_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_EXE_PROCDEF" FOREIGN KEY (PROC_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_PROCDEF(ID_),
	CONSTRAINT "ACT_FK_EXE_PROCINST" FOREIGN KEY (PROC_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_EXE_SUPER" FOREIGN KEY (SUPER_EXEC_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_EXEC_BUSKEY ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (BUSINESS_KEY_);
CREATE INDEX ACT_IDX_EXEC_TENANT_ID ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_EXE_PARENT ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (PARENT_ID_);
CREATE INDEX ACT_IDX_EXE_PROCDEF ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_EXE_PROCINST ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXE_ROOT_PI ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXE_SUPER ON "kesplus_workflow".ACT_RU_EXECUTION USING btree (SUPER_EXEC_);


-- "kesplus_workflow"."ACT_RU_EXT_TASK" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_EXT_TASK";

CREATE TABLE "kesplus_workflow"."ACT_RU_EXT_TASK" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NOT NULL,
	"WORKER_ID_" character varying(255 char) NULL,
	"TOPIC_NAME_" character varying(255 char) NULL,
	"RETRIES_" integer NULL,
	"ERROR_MSG_" character varying(4000 char) NULL,
	"ERROR_DETAILS_ID_" character varying(64 char) NULL,
	"LOCK_EXP_TIME_" timestamp without time zone NULL,
	"SUSPENSION_STATE_" integer NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"PROC_DEF_KEY_" character varying(255 char) NULL,
	"ACT_ID_" character varying(255 char) NULL,
	"ACT_INST_ID_" character varying(64 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"PRIORITY_" bigint NULL DEFAULT 0,
	"LAST_FAILURE_LOG_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_EXT_TASK_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_EXT_TASK_ERROR_DETAILS" FOREIGN KEY (ERROR_DETAILS_ID_) REFERENCES "kesplus_workflow".ACT_GE_BYTEARRAY(ID_),
	CONSTRAINT "ACT_FK_EXT_TASK_EXE" FOREIGN KEY (EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_EXT_TASK_ERR_DETAILS ON "kesplus_workflow".ACT_RU_EXT_TASK USING btree (ERROR_DETAILS_ID_);
CREATE INDEX ACT_IDX_EXT_TASK_EXEC ON "kesplus_workflow".ACT_RU_EXT_TASK USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_EXT_TASK_PRIORITY ON "kesplus_workflow".ACT_RU_EXT_TASK USING btree (PRIORITY_);
CREATE INDEX ACT_IDX_EXT_TASK_TENANT_ID ON "kesplus_workflow".ACT_RU_EXT_TASK USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_EXT_TASK_TOPIC ON "kesplus_workflow".ACT_RU_EXT_TASK USING btree (TOPIC_NAME_);


-- "kesplus_workflow"."ACT_RU_INCIDENT" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_INCIDENT";

CREATE TABLE "kesplus_workflow"."ACT_RU_INCIDENT" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NOT NULL,
	"INCIDENT_TIMESTAMP_" timestamp without time zone NOT NULL,
	"INCIDENT_MSG_" character varying(4000 char) NULL,
	"INCIDENT_TYPE_" character varying(255 char) NOT NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"ACTIVITY_ID_" character varying(255 char) NULL,
	"FAILED_ACTIVITY_ID_" character varying(255 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"CAUSE_INCIDENT_ID_" character varying(64 char) NULL,
	"ROOT_CAUSE_INCIDENT_ID_" character varying(64 char) NULL,
	"CONFIGURATION_" character varying(255 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"JOB_DEF_ID_" character varying(64 char) NULL,
	"ANNOTATION_" character varying(4000 char) NULL,
	CONSTRAINT "ACT_RU_INCIDENT_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_INC_CAUSE" FOREIGN KEY (CAUSE_INCIDENT_ID_) REFERENCES "kesplus_workflow".ACT_RU_INCIDENT(ID_),
	CONSTRAINT "ACT_FK_INC_EXE" FOREIGN KEY (EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_INC_JOB_DEF" FOREIGN KEY (JOB_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RU_JOBDEF(ID_),
	CONSTRAINT "ACT_FK_INC_PROCDEF" FOREIGN KEY (PROC_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_PROCDEF(ID_),
	CONSTRAINT "ACT_FK_INC_PROCINST" FOREIGN KEY (PROC_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_INC_RCAUSE" FOREIGN KEY (ROOT_CAUSE_INCIDENT_ID_) REFERENCES "kesplus_workflow".ACT_RU_INCIDENT(ID_)
);
CREATE INDEX ACT_IDX_INC_CAUSEINCID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (CAUSE_INCIDENT_ID_);
CREATE INDEX ACT_IDX_INC_CONFIGURATION ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (CONFIGURATION_);
CREATE INDEX ACT_IDX_INC_EXID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_INC_JOB_DEF ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (JOB_DEF_ID_);
CREATE INDEX ACT_IDX_INC_PROCDEFID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_INC_PROCINSTID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_INC_ROOTCAUSEINCID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (ROOT_CAUSE_INCIDENT_ID_);
CREATE INDEX ACT_IDX_INC_TENANT_ID ON "kesplus_workflow".ACT_RU_INCIDENT USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_JOB" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_JOB";

CREATE TABLE "kesplus_workflow"."ACT_RU_JOB" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"TYPE_" character varying(255 char) NOT NULL,
	"LOCK_EXP_TIME_" timestamp without time zone NULL,
	"LOCK_OWNER_" character varying(255 char) NULL,
	"EXCLUSIVE_" boolean NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROCESS_INSTANCE_ID_" character varying(64 char) NULL,
	"PROCESS_DEF_ID_" character varying(64 char) NULL,
	"PROCESS_DEF_KEY_" character varying(255 char) NULL,
	"RETRIES_" integer NULL,
	"EXCEPTION_STACK_ID_" character varying(64 char) NULL,
	"EXCEPTION_MSG_" character varying(4000 char) NULL,
	"FAILED_ACT_ID_" character varying(255 char) NULL,
	"DUEDATE_" timestamp without time zone NULL,
	"REPEAT_" character varying(255 char) NULL,
	"REPEAT_OFFSET_" bigint NULL DEFAULT 0,
	"HANDLER_TYPE_" character varying(255 char) NULL,
	"HANDLER_CFG_" character varying(4000 char) NULL,
	"DEPLOYMENT_ID_" character varying(64 char) NULL,
	"SUSPENSION_STATE_" integer NOT NULL DEFAULT 1,
	"JOB_DEF_ID_" character varying(64 char) NULL,
	"PRIORITY_" bigint NULL DEFAULT 0,
	"SEQUENCE_COUNTER_" bigint NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"LAST_FAILURE_LOG_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_JOB_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_JOB_EXCEPTION" FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES "kesplus_workflow".ACT_GE_BYTEARRAY(ID_)
);
CREATE INDEX ACT_IDX_JOB_EXCEPTION ON "kesplus_workflow".ACT_RU_JOB USING btree (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_JOB_EXECUTION_ID ON "kesplus_workflow".ACT_RU_JOB USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_JOB_HANDLER ON "kesplus_workflow".ACT_RU_JOB USING btree (HANDLER_TYPE_, HANDLER_CFG_);
CREATE INDEX ACT_IDX_JOB_HANDLER_TYPE ON "kesplus_workflow".ACT_RU_JOB USING btree (HANDLER_TYPE_);
CREATE INDEX ACT_IDX_JOB_JOB_DEF_ID ON "kesplus_workflow".ACT_RU_JOB USING btree (JOB_DEF_ID_);
CREATE INDEX ACT_IDX_JOB_PROCINST ON "kesplus_workflow".ACT_RU_JOB USING btree (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_IDX_JOB_TENANT_ID ON "kesplus_workflow".ACT_RU_JOB USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_TASK" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_TASK";

CREATE TABLE "kesplus_workflow"."ACT_RU_TASK" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"CASE_DEF_ID_" character varying(64 char) NULL,
	"NAME_" character varying(255 char) NULL,
	"PARENT_TASK_ID_" character varying(64 char) NULL,
	"DESCRIPTION_" character varying(4000 char) NULL,
	"TASK_DEF_KEY_" character varying(255 char) NULL,
	"OWNER_" character varying(255 char) NULL,
	"ASSIGNEE_" character varying(4000 char) NULL,
	"DELEGATION_" character varying(64 char) NULL,
	"PRIORITY_" integer NULL,
	"CREATE_TIME_" timestamp without time zone NULL,
	"DUE_DATE_" timestamp without time zone NULL,
	"FOLLOW_UP_DATE_" timestamp without time zone NULL,
	"SUSPENSION_STATE_" integer NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_TASK_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_TASK_CASE_DEF" FOREIGN KEY (CASE_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_CASE_DEF(ID_),
	CONSTRAINT "ACT_FK_TASK_CASE_EXE" FOREIGN KEY (CASE_EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_TASK_EXE" FOREIGN KEY (EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_TASK_PROCDEF" FOREIGN KEY (PROC_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_PROCDEF(ID_),
	CONSTRAINT "ACT_FK_TASK_PROCINST" FOREIGN KEY (PROC_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_TASK_ASSIGNEE ON "kesplus_workflow".ACT_RU_TASK USING btree (ASSIGNEE_);
CREATE INDEX ACT_IDX_TASK_CASE_DEF_ID ON "kesplus_workflow".ACT_RU_TASK USING btree (CASE_DEF_ID_);
CREATE INDEX ACT_IDX_TASK_CASE_EXEC ON "kesplus_workflow".ACT_RU_TASK USING btree (CASE_EXECUTION_ID_);
CREATE INDEX ACT_IDX_TASK_CREATE ON "kesplus_workflow".ACT_RU_TASK USING btree (CREATE_TIME_);
CREATE INDEX ACT_IDX_TASK_EXEC ON "kesplus_workflow".ACT_RU_TASK USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_TASK_OWNER ON "kesplus_workflow".ACT_RU_TASK USING btree (OWNER_);
CREATE INDEX ACT_IDX_TASK_PROCDEF ON "kesplus_workflow".ACT_RU_TASK USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_TASK_PROCINST ON "kesplus_workflow".ACT_RU_TASK USING btree (PROC_INST_ID_);
CREATE INDEX ACT_IDX_TASK_TENANT_ID ON "kesplus_workflow".ACT_RU_TASK USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_VARIABLE" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_VARIABLE";

CREATE TABLE "kesplus_workflow"."ACT_RU_VARIABLE" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"TYPE_" character varying(255 char) NOT NULL,
	"NAME_" character varying(255 char) NOT NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"CASE_EXECUTION_ID_" character varying(64 char) NULL,
	"CASE_INST_ID_" character varying(64 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"BATCH_ID_" character varying(64 char) NULL,
	"BYTEARRAY_ID_" character varying(64 char) NULL,
	"DOUBLE_" double precision NULL,
	"LONG_" bigint NULL,
	"TEXT_" character varying(4000 char) NULL,
	"TEXT2_" character varying(4000 char) NULL,
	"VAR_SCOPE_" character varying(64 char) NULL,
	"SEQUENCE_COUNTER_" bigint NULL,
	"IS_CONCURRENT_LOCAL_" boolean NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_VARIABLE_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_UNIQ_VARIABLE" UNIQUE (VAR_SCOPE_, NAME_),
	CONSTRAINT "ACT_FK_VAR_BATCH" FOREIGN KEY (BATCH_ID_) REFERENCES "kesplus_workflow".ACT_RU_BATCH(ID_),
	CONSTRAINT "ACT_FK_VAR_BYTEARRAY" FOREIGN KEY (BYTEARRAY_ID_) REFERENCES "kesplus_workflow".ACT_GE_BYTEARRAY(ID_),
	CONSTRAINT "ACT_FK_VAR_CASE_EXE" FOREIGN KEY (CASE_EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_VAR_CASE_INST" FOREIGN KEY (CASE_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_CASE_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_VAR_EXE" FOREIGN KEY (EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_),
	CONSTRAINT "ACT_FK_VAR_PROCINST" FOREIGN KEY (PROC_INST_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_BATCH_ID ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (BATCH_ID_);
CREATE INDEX ACT_IDX_VARIABLE_TASK_ID ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (TASK_ID_);
CREATE INDEX ACT_IDX_VARIABLE_TASK_NAME_TYPE ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (TASK_ID_, NAME_, TYPE_);
CREATE INDEX ACT_IDX_VARIABLE_TENANT_ID ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (TENANT_ID_);
CREATE INDEX ACT_IDX_VAR_BYTEARRAY ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (BYTEARRAY_ID_);
CREATE INDEX ACT_IDX_VAR_CASE_EXE ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (CASE_EXECUTION_ID_);
CREATE INDEX ACT_IDX_VAR_CASE_INST_ID ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (CASE_INST_ID_);
CREATE INDEX ACT_IDX_VAR_EXE ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_VAR_PROCINST ON "kesplus_workflow".ACT_RU_VARIABLE USING btree (PROC_INST_ID_);


-- "kesplus_workflow"."ACT_RU_EVENT_SUBSCR" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_EVENT_SUBSCR";

CREATE TABLE "kesplus_workflow"."ACT_RU_EVENT_SUBSCR" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"EVENT_TYPE_" character varying(255 char) NOT NULL,
	"EVENT_NAME_" character varying(255 char) NULL,
	"EXECUTION_ID_" character varying(64 char) NULL,
	"PROC_INST_ID_" character varying(64 char) NULL,
	"ACTIVITY_ID_" character varying(255 char) NULL,
	"CONFIGURATION_" character varying(255 char) NULL,
	"CREATED_" timestamp without time zone NOT NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_EVENT_SUBSCR_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_EVENT_EXEC" FOREIGN KEY (EXECUTION_ID_) REFERENCES "kesplus_workflow".ACT_RU_EXECUTION(ID_)
);
CREATE INDEX ACT_IDX_EVENT_SUBSCR ON "kesplus_workflow".ACT_RU_EVENT_SUBSCR USING btree (EXECUTION_ID_);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_CONFIG_ ON "kesplus_workflow".ACT_RU_EVENT_SUBSCR USING btree (CONFIGURATION_);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_EVT_NAME ON "kesplus_workflow".ACT_RU_EVENT_SUBSCR USING btree (EVENT_NAME_);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_TENANT_ID ON "kesplus_workflow".ACT_RU_EVENT_SUBSCR USING btree (TENANT_ID_);


-- "kesplus_workflow"."ACT_RU_IDENTITYLINK" definition

-- Drop table

-- DROP TABLE "kesplus_workflow"."ACT_RU_IDENTITYLINK";

CREATE TABLE "kesplus_workflow"."ACT_RU_IDENTITYLINK" (
	"ID_" character varying(64 char) NOT NULL,
	"REV_" integer NULL,
	"GROUP_ID_" character varying(255 char) NULL,
	"TYPE_" character varying(255 char) NULL,
	"USER_ID_" character varying(255 char) NULL,
	"TASK_ID_" character varying(64 char) NULL,
	"PROC_DEF_ID_" character varying(64 char) NULL,
	"TENANT_ID_" character varying(64 char) NULL,
	CONSTRAINT "ACT_RU_IDENTITYLINK_pkey" PRIMARY KEY (ID_),
	CONSTRAINT "ACT_FK_ATHRZ_PROCEDEF" FOREIGN KEY (PROC_DEF_ID_) REFERENCES "kesplus_workflow".ACT_RE_PROCDEF(ID_),
	CONSTRAINT "ACT_FK_TSKASS_TASK" FOREIGN KEY (TASK_ID_) REFERENCES "kesplus_workflow".ACT_RU_TASK(ID_)
);
CREATE INDEX ACT_IDX_ATHRZ_PROCEDEF ON "kesplus_workflow".ACT_RU_IDENTITYLINK USING btree (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_GROUP ON "kesplus_workflow".ACT_RU_IDENTITYLINK USING btree (GROUP_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_USER ON "kesplus_workflow".ACT_RU_IDENTITYLINK USING btree (USER_ID_);
CREATE INDEX ACT_IDX_TSKASS_TASK ON "kesplus_workflow".ACT_RU_IDENTITYLINK USING btree (TASK_ID_);