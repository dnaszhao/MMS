-- "kesplus_platform"."kesplus_v_columns" source

CREATE OR REPLACE VIEW "kesplus_platform"."kesplus_v_columns"
AS SELECT n.nspname AS schema_name,
    c.relname AS table_name,
    a.attname AS column_name,
    pt.typname AS data_type,
    a.attnum AS column_sort
   FROM pg_class c
     JOIN pg_namespace n ON n.oid = c.relnamespace
     JOIN pg_attribute a ON a.attrelid = c.oid
     JOIN pg_type pt ON a.atttypid = pt.oid
  WHERE a.attnum > 0;