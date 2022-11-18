SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.newview...';END$$;
CREATE OR REPLACE VIEW public.anothernewview (inventoryid, inventoryitemname) AS SELECT i.inventoryid,
    ii.inventoryitemname
   FROM (public.inventory i
     JOIN public.inventoryitem ii ON ((i.inventoryitemid = ii.inventoryitemid)));;
SET check_function_bodies = true;