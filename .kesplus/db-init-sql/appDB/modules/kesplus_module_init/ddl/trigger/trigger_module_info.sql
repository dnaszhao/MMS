CREATE OR REPLACE TRIGGER "${moduleSchema}"."trigger_module_info" AFTER INSERT OR UPDATE OR DELETE ON "${moduleSchema}"."kesplus_module" FOR EACH ROW
BEGIN
	IF TG_OP = 'insert' THEN
		INSERT INTO "kesplus_app"."kesplus_module" ("id", "module_name", "module_path", "module_code", "module_icon", "remark", "create_time", "create_by","app_id", "type", "enabled","status", "charge_by", "sort", "module_version")
		VALUES (NEW.id,NEW.module_name,NEW.module_path,NEW.module_code, NEW.module_icon,NEW.remark,NEW.create_time,NEW.create_by,NEW.app_id,NEW.type,NEW.enabled,NEW.status,NEW.charge_by,NEW.sort,NEW.module_version);
	ELSEIF TG_OP = 'update' THEN
		UPDATE "kesplus_app"."kesplus_module" SET "id"=NEW.id, "module_name"=NEW.module_name,"module_icon"=NEW.module_icon, "remark"=NEW.remark,"update_time"=NEW.update_time, "update_by"=NEW.update_by,"enabled"=NEW.enabled,"status"=NEW.status, "charge_by"=NEW.charge_by, "sort"=NEW.sort, "module_version"=NEW.module_version WHERE "id"=NEW.id;
		UPDATE "kesplus_base"."kesplus_base_role" SET "name" = NEW.module_name WHERE "name" = OLD.module_name AND id = NEW.id;
		UPDATE "kesplus_base"."kesplus_base_menu" SET "title" = NEW.module_name,"icon" =NEW.module_icon WHERE "title" = OLD.module_name AND id = NEW.id;
		UPDATE "kesplus_base"."kesplus_base_policy" SET "name" = NEW.module_name WHERE "name" = OLD.module_name AND id = NEW.id;
		UPDATE "kesplus_base"."kesplus_base_permission" SET "name" = NEW.module_name WHERE "name" = OLD.module_name AND id = NEW.id;
	ELSE   --delete
		DELETE FROM "kesplus_app"."kesplus_module" WHERE "id"=OLD.id;
	END IF;

END;