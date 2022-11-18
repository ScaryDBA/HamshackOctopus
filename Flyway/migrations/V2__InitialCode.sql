SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.sales...';END$$;
CREATE TABLE public.sales (
    salesid int4,
    salesdate timestamp
);
ALTER TABLE public.sales ADD CONSTRAINT sales_pkey PRIMARY KEY (salesid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.radios...';END$$;
CREATE TABLE public.radios (
    radioid int4,
    radioname varchar
);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.mynewtable...';END$$;
CREATE TABLE public.mynewtable (
    id int4
);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventoryitem...';END$$;
CREATE TABLE public.inventoryitem (
    inventoryitemid int4,
    inventoryitemname varchar
);
ALTER TABLE public.inventoryitem ADD CONSTRAINT inventoryitempk PRIMARY KEY (inventoryitemid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventoryitem_inventoryitemid_seq...';END$$;
CREATE SEQUENCE public.inventoryitem_inventoryitemid_seq
AS int4
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.inventoryitem.inventoryitemid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventory...';END$$;
CREATE TABLE public.inventory (
    inventoryid int4,
    inventoryitemid int4
);
ALTER TABLE public.inventory ADD CONSTRAINT inventorypk PRIMARY KEY (inventoryid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventory_inventoryid_seq...';END$$;
CREATE SEQUENCE public.inventory_inventoryid_seq
AS int4
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE
OWNED BY public.inventory.inventoryid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.inventory.inventoryiteminventory...';END$$;
ALTER TABLE public.inventory ADD CONSTRAINT inventoryiteminventory FOREIGN KEY (inventoryitemid) REFERENCES public.inventoryitem (inventoryitemid);
SET check_function_bodies = true;