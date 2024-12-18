CREATE OR REPLACE PACKAGE "kesplus_platform"."kes_plus_pkg_upgrade" AUTHID CURRENT_USER AS
	PROCEDURE platform_backup(versionCode varchar);
	PROCEDURE platform_recover(versionCode varchar);
    function app_schema() RETURN varchar;
	_TEMPLATE_BACKUP varchar := 'CREATE TABLE "kesplus_platform"."%s" AS SELECT * FROM "kesplus_platform"."%s" t';
	_TEMPLATE_DROP varchar := 'DROP TABLE IF EXISTS "kesplus_platform"."%s"';
	_TEMPLATE_DROP_TYPE varchar := 'DROP TYPE "public"."%s" CASCADE';
	_TEMPLATE_TABLE_NAME varchar := '%s_backup_%s';
	_PLATEFORM_BACKUP_TABLES varchar[] := array['kes_application', 'kes_appuser', 'kes_git', 'kes_git_user', 'kesplus_sys_config', 'kes_sys_user'];
	_TYPES varchar[] := array['kes_current_user', 'kes_token_payload', 'kes_token', 'KES_REQUEST_HEADER', 'kes_api', 'kes_filter', 'kes_aspect', 'kes_request', 'KES_STACK_ELEMENT', 'KES_STACK', 'EX', 'ex_stack', 'KES_RESPONSE', 'user_attr', 'bean', 'fn', 'query'];
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."kes_plus_pkg_upgrade" AS WRAPPED
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
Ew0/0vZXUzGustM8TgQkvtTX++Ko+A==
END;

