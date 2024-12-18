-- "kesplus_tr_module_permission" definition

CREATE OR REPLACE TRIGGER "${moduleSchema}".kesplus_tr_module_permission AFTER INSERT OR DELETE OR UPDATE ON "${moduleSchema}".kesplus_module_permission FOR EACH ROW
DECLARE
    parentId$ varchar;
    topDirId$ varchar;
    treeType$ varchar :='permissions';
BEGIN
    select id into topDirId$ from kesplus_app."kes_app_directory" where "directory_code" =treeType$;
    IF NEW."parent_id"=topDirId$ THEN
          parentId$ := NEW."module_id";
    ELSE
          parentId$ := NEW."parent_id";
    END IF;
    IF TG_OP = 'insert' THEN
        INSERT INTO "kesplus_base"."kesplus_base_permission"
        ("id", "module_id", "module_code", "dept_id", "name", "code", "obj_type", "parent_id", "status","create_by", "create_time", "update_by", "update_time", "remark", "sort_num")
        VALUES(new."id",new."module_id", new."module_code",new."dept_id", new."name", new."code", new."obj_type", parentId$,new."status",new."create_by", new."create_time", new."update_by", new."update_time", new."remark", new."sort_num");

    ELSEIF TG_OP = 'update' THEN
        UPDATE "kesplus_base"."kesplus_base_permission"
        SET "code"=new."code", "name"=new."name", "status"=new."status", "parent_id"=parentId$,  "update_by"=new."update_by", "update_time"=new."update_time", "remark"=new."remark" , "sort_num"=new."sort_num"
        WHERE "id"=old."id";
    ELSE   --delete
        DELETE FROM "kesplus_base"."kesplus_base_permission" WHERE "id"=OLD.id;
        DELETE FROM "kesplus_base"."kesplus_base_role_permission" WHERE "permission_id"=OLD.id;
    END IF;

END;