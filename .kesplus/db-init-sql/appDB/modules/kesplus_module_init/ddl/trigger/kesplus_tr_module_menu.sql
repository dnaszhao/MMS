-- "${moduleSchema}"."kesplus_tr_module_menu" definition

CREATE OR REPLACE TRIGGER "${moduleSchema}".kesplus_tr_module_menu AFTER INSERT OR DELETE OR UPDATE ON "${moduleSchema}".kesplus_module_menu FOR EACH ROW
DECLARE
    moduleCode varchar;
    menuType varchar :='dir';
    parentId$ varchar;
    topDirId$ varchar;
    treeType$ varchar :='menus';

    parentIdPermission$ varchar;
    topDirIdPermission$ varchar;
    treeTypePermission$ varchar :='permissions';
BEGIN
    select id into topDirId$ from kesplus_app."kes_app_directory" where "directory_code" =treeType$;
    IF NEW."parent_id"=topDirId$ THEN
            parentId$ := NEW."module_id";
            select id into topDirIdPermission$ from kesplus_app."kes_app_directory" where "directory_code" =treeTypePermission$;
            parentIdPermission$ := topDirIdPermission$;
    ELSE
            parentId$ := NEW."parent_id";
            parentIdPermission$:= NEW."parent_id";
    END IF;
    IF TG_OP = 'insert' THEN
        INSERT INTO "kesplus_base"."kesplus_base_menu"(
            "id", "code", "title", "icon", "classify", "url", "outer_link", "component", "hidden_flag", "enabled", "params", "properties", "create_by", "create_time", "update_by", "update_time", "tenant_id", "module_id", "dept_id", "parent_id", "sort_num", "obj_type"
        ) VALUES (
             new."id", new."code", new."title", new."icon", new."classify", new."url", new."outer_link", new."component", new."hidden_flag", new."enabled", new."params", new."properties", new."create_by", new."create_time", new."update_by", new."update_time", new."tenant_id", new."module_id", new."dept_id",parentId$, new."sort_num", new."obj_type"
         );
        --同步将menu信息写入到权限点表中
--         SELECT module_code INTO moduleCode FROM "kesplus_app"."kesplus_module"  WHERE id=new."module_id";
--         BEGIN
--         EXCEPTION when NO_DATA_FOUND THEN
--              moduleCode:=NULL;
--         END;

--         IF new."obj_type" ='obj' THEN
--              menuType:='menus';
--         END  IF;

        INSERT INTO "${moduleSchema}"."kesplus_module_permission"
        ("id", "module_id", "module_code", "dept_id", "name", "code", "obj_type", "parent_id", "status","create_by", "create_time", "update_by", "update_time")
        VALUES(new."id",new."module_id", moduleCode,new."dept_id", new."title", new."code", menuType, parentIdPermission$,new."enabled",new."create_by", new."create_time", new."update_by", new."update_time");

    ELSEIF TG_OP = 'update' THEN
        UPDATE "kesplus_base"."kesplus_base_menu"
        SET "code"=new."code", "title"=new."title", "icon"=new."icon", "classify"=new."classify", "url"=new."url", "outer_link"=new."outer_link", "component"=new."component", "hidden_flag"=new."hidden_flag", "enabled"=new."enabled", "params"=new."params", "properties"=new."properties", "update_by"=new."update_by", "update_time"=new."update_time", "tenant_id"=new."tenant_id", "module_id"=new."module_id", "dept_id"=new."dept_id", "parent_id"=parentId$, "sort_num"=new."sort_num", "obj_type"=new."obj_type"
        WHERE "id"=old."id";

        UPDATE  "${moduleSchema}"."kesplus_module_permission"
        SET "code"=new."code", "name"=new."title", "status"=new."enabled", "parent_id"=parentIdPermission$,  "update_by"=new."update_by", "update_time"=new."update_time"
        WHERE "id"=old."id";

    ELSE   --delete

    DELETE FROM "kesplus_base"."kesplus_base_menu" WHERE "id"=OLD.id;
    DELETE FROM "${moduleSchema}"."kesplus_module_permission" WHERE "id"=OLD.id;
    END IF;

END;