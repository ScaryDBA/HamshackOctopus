SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventorylist...';END$$;
CREATE OR REPLACE VIEW public.inventorylist (inventoryid, inventoryitemname) AS SELECT i.inventoryid,
    ii.inventoryitemname
   FROM (public.inventory i
     JOIN public.inventoryitem ii ON ((i.inventoryitemid = ii.inventoryitemid)));;
SET check_function_bodies = true;