PGDMP          "                z            wine    14.1    14.1 ;    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    16394    wine    DATABASE     i   CREATE DATABASE wine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE wine;
                postgres    false            ?            1259    17084    certification    TABLE     ?   CREATE TABLE public.certification (
    id integer NOT NULL,
    code character varying NOT NULL,
    name character varying
);
 !   DROP TABLE public.certification;
       public         heap    postgres    false            ?            1259    17089    colour    TABLE     _   CREATE TABLE public.colour (
    id integer NOT NULL,
    colour character varying NOT NULL
);
    DROP TABLE public.colour;
       public         heap    postgres    false            ?            1259    16826    geolocalization    TABLE     x   CREATE TABLE public.geolocalization (
    latitude numeric(8,6),
    longitude numeric(9,6),
    id integer NOT NULL
);
 #   DROP TABLE public.geolocalization;
       public         heap    postgres    false            ?            1259    16829    geolocalization_id_seq    SEQUENCE     ?   ALTER TABLE public.geolocalization ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.geolocalization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            ?            1259    17300    grape_variety    TABLE     m   CREATE TABLE public.grape_variety (
    id integer NOT NULL,
    grape_variety character varying NOT NULL
);
 !   DROP TABLE public.grape_variety;
       public         heap    postgres    false            ?            1259    16973    lau    TABLE     ?   CREATE TABLE public.lau (
    nuts3_code character varying(5) NOT NULL,
    lau_code character varying(6) NOT NULL,
    lau_name_national character varying NOT NULL,
    population integer,
    total_area integer
);
    DROP TABLE public.lau;
       public         heap    postgres    false            ?            1259    16910    nuts1    TABLE     ?   CREATE TABLE public.nuts1 (
    nuts_country_code character varying(2) NOT NULL,
    nuts1_code character varying(3) NOT NULL,
    nuts1 character varying NOT NULL
);
    DROP TABLE public.nuts1;
       public         heap    postgres    false            ?            1259    16922    nuts2    TABLE     ?   CREATE TABLE public.nuts2 (
    nuts1_code character varying(3) NOT NULL,
    nuts2_code character varying(4) NOT NULL,
    nuts2 character varying NOT NULL
);
    DROP TABLE public.nuts2;
       public         heap    postgres    false            ?            1259    16934    nuts3    TABLE     ?   CREATE TABLE public.nuts3 (
    nuts2_code character varying(4) NOT NULL,
    nuts3_code character varying(5) NOT NULL,
    nuts3 character varying NOT NULL
);
    DROP TABLE public.nuts3;
       public         heap    postgres    false            ?            1259    16903    nuts_country    TABLE     ?   CREATE TABLE public.nuts_country (
    nuts_country_code character varying(2) NOT NULL,
    country character varying NOT NULL
);
     DROP TABLE public.nuts_country;
       public         heap    postgres    false            ?            1259    17050    producer    TABLE     F  CREATE TABLE public.producer (
    id integer NOT NULL,
    producer character varying NOT NULL,
    phone_number character varying(15),
    url character varying,
    street character varying,
    number integer,
    complement character varying,
    lau_code character varying(6),
    id_geolocalization integer NOT NULL
);
    DROP TABLE public.producer;
       public         heap    postgres    false            ?            1259    17225    wine    TABLE     V  CREATE TABLE public.wine (
    id integer NOT NULL,
    wine_code character varying NOT NULL,
    name character varying,
    id_producer integer NOT NULL,
    id_colour integer NOT NULL,
    alcohol_content character varying,
    organoleptic_description character varying,
    external_source character varying,
    id_wine_type integer
);
    DROP TABLE public.wine;
       public         heap    postgres    false            ?            1259    17317    wine_certification    TABLE     g   CREATE TABLE public.wine_certification (
    id_wine integer NOT NULL,
    id_certification integer
);
 &   DROP TABLE public.wine_certification;
       public         heap    postgres    false            ?            1259    17295    wine_grape_composition    TABLE     ?   CREATE TABLE public.wine_grape_composition (
    id_wine integer,
    percentage_of_grape character varying,
    id_grape_variety integer,
    id smallint NOT NULL
);
 *   DROP TABLE public.wine_grape_composition;
       public         heap    postgres    false            ?            1259    17864    wine_grape_composition_id_seq    SEQUENCE     ?   ALTER TABLE public.wine_grape_composition ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wine_grape_composition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            ?            1259    17346 	   wine_type    TABLE     f   CREATE TABLE public.wine_type (
    wine_type character varying NOT NULL,
    id smallint NOT NULL
);
    DROP TABLE public.wine_type;
       public         heap    postgres    false            ?            1259    17351    wine_type_id_seq    SEQUENCE     ?   ALTER TABLE public.wine_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wine_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            ?            1259    16490 	   wines2016    TABLE     h  CREATE TABLE public.wines2016 (
    wine_code character varying,
    name character varying,
    colour character varying,
    wine_type character varying,
    producer character varying,
    organoleptic_description character varying,
    grape_variety character varying,
    alcohol_content character varying,
    certification character varying,
    address character varying,
    municipality character varying,
    province character varying,
    geolocalization character varying,
    url character varying,
    phone_number character varying,
    external_source character varying,
    id integer NOT NULL
);
    DROP TABLE public.wines2016;
       public         heap    postgres    false            ?            1259    16495    wines2016_2    TABLE     j  CREATE TABLE public.wines2016_2 (
    wine_code character varying,
    name character varying,
    colour character varying,
    wine_type character varying,
    producer character varying,
    organoleptic_description character varying,
    grape_variety character varying,
    alcohol_content character varying,
    certification character varying,
    address character varying,
    municipality character varying,
    province character varying,
    geolocalization character varying,
    url character varying,
    phone_number character varying,
    external_source character varying,
    id integer NOT NULL
);
    DROP TABLE public.wines2016_2;
       public         heap    postgres    false            ?            1259    16525    wines2016_2_id_seq    SEQUENCE     ?   ALTER TABLE public.wines2016_2 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wines2016_2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            ?            1259    16517    wines2016_id_seq    SEQUENCE     ?   ALTER TABLE public.wines2016 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wines2016_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            ?            1259    16539    wines_2    TABLE     f  CREATE TABLE public.wines_2 (
    wine_code character varying,
    name character varying,
    colour character varying,
    producer character varying,
    organoleptic_description character varying,
    grape_variety character varying,
    alcohol_content character varying,
    certification character varying,
    address character varying,
    municipality character varying,
    province character varying,
    geolocalization character varying,
    url character varying,
    phone_number character varying,
    external_source character varying,
    id integer NOT NULL,
    wine_type character varying
);
    DROP TABLE public.wines_2;
       public         heap    postgres    false            ?            1259    16556    wines_2_id_seq1    SEQUENCE     ?   ALTER TABLE public.wines_2 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wines_2_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            ?            1259    16469    wines_3    TABLE     f  CREATE TABLE public.wines_3 (
    wine_code character varying,
    name character varying,
    colour character varying,
    producer character varying,
    organoleptic_description character varying,
    grape_variety character varying,
    alcohol_content character varying,
    certification character varying,
    address character varying,
    municipality character varying,
    province character varying,
    geolocalization character varying,
    url character varying,
    phone_number character varying,
    external_source character varying,
    id integer NOT NULL,
    wine_type character varying
);
    DROP TABLE public.wines_3;
       public         heap    postgres    false            ?            1259    16509    wines_3_id_seq    SEQUENCE     ?   ALTER TABLE public.wines_3 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wines_3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            ?           2606    17095     certification certification_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.certification
    ADD CONSTRAINT certification_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.certification DROP CONSTRAINT certification_pkey;
       public            postgres    false    225            ?           2606    17097    colour colour_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.colour
    ADD CONSTRAINT colour_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.colour DROP CONSTRAINT colour_pkey;
       public            postgres    false    226            ?           2606    16834 $   geolocalization geolocalization_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.geolocalization
    ADD CONSTRAINT geolocalization_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.geolocalization DROP CONSTRAINT geolocalization_pkey;
       public            postgres    false    217            ?           2606    17306     grape_variety grape_variety_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.grape_variety
    ADD CONSTRAINT grape_variety_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.grape_variety DROP CONSTRAINT grape_variety_pkey;
       public            postgres    false    229            ?           2606    16986    lau lau_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.lau
    ADD CONSTRAINT lau_pkey PRIMARY KEY (lau_code);
 6   ALTER TABLE ONLY public.lau DROP CONSTRAINT lau_pkey;
       public            postgres    false    223            ?           2606    16916    nuts1 nuts1_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.nuts1
    ADD CONSTRAINT nuts1_pkey PRIMARY KEY (nuts1_code);
 :   ALTER TABLE ONLY public.nuts1 DROP CONSTRAINT nuts1_pkey;
       public            postgres    false    220            ?           2606    16928    nuts2 nuts2_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.nuts2
    ADD CONSTRAINT nuts2_pkey PRIMARY KEY (nuts2_code);
 :   ALTER TABLE ONLY public.nuts2 DROP CONSTRAINT nuts2_pkey;
       public            postgres    false    221            ?           2606    16940    nuts3 nuts3_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.nuts3
    ADD CONSTRAINT nuts3_pkey PRIMARY KEY (nuts3_code);
 :   ALTER TABLE ONLY public.nuts3 DROP CONSTRAINT nuts3_pkey;
       public            postgres    false    222            ?           2606    16909    nuts_country nuts_country_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.nuts_country
    ADD CONSTRAINT nuts_country_pkey PRIMARY KEY (nuts_country_code);
 H   ALTER TABLE ONLY public.nuts_country DROP CONSTRAINT nuts_country_pkey;
       public            postgres    false    219            ?           2606    17056    producer producer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producer
    ADD CONSTRAINT producer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producer DROP CONSTRAINT producer_pkey;
       public            postgres    false    224            ?           2606    17871 2   wine_grape_composition wine_grape_composition_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.wine_grape_composition
    ADD CONSTRAINT wine_grape_composition_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.wine_grape_composition DROP CONSTRAINT wine_grape_composition_pkey;
       public            postgres    false    228            ?           2606    17231    wine wine_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.wine
    ADD CONSTRAINT wine_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.wine DROP CONSTRAINT wine_pkey;
       public            postgres    false    227            ?           2606    17358    wine_type wine_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wine_type
    ADD CONSTRAINT wine_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wine_type DROP CONSTRAINT wine_type_pkey;
       public            postgres    false    231            ?           2606    16532    wines2016_2 wines2016_2_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.wines2016_2
    ADD CONSTRAINT wines2016_2_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.wines2016_2 DROP CONSTRAINT wines2016_2_pkey;
       public            postgres    false    211            ?           2606    16524    wines2016 wines2016_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wines2016
    ADD CONSTRAINT wines2016_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wines2016 DROP CONSTRAINT wines2016_pkey;
       public            postgres    false    210            ?           2606    16563    wines_2 wines_2_pkey1 
   CONSTRAINT     S   ALTER TABLE ONLY public.wines_2
    ADD CONSTRAINT wines_2_pkey1 PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.wines_2 DROP CONSTRAINT wines_2_pkey1;
       public            postgres    false    215            ?           2606    16516    wines_3 wines_3_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.wines_3
    ADD CONSTRAINT wines_3_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.wines_3 DROP CONSTRAINT wines_3_pkey;
       public            postgres    false    209            ?           2606    17325 &   wine_certification fk_id_certification    FK CONSTRAINT     ?   ALTER TABLE ONLY public.wine_certification
    ADD CONSTRAINT fk_id_certification FOREIGN KEY (id_certification) REFERENCES public.certification(id);
 P   ALTER TABLE ONLY public.wine_certification DROP CONSTRAINT fk_id_certification;
       public          postgres    false    225    230    3261            ?           2606    17232    wine fk_id_colour    FK CONSTRAINT     s   ALTER TABLE ONLY public.wine
    ADD CONSTRAINT fk_id_colour FOREIGN KEY (id_colour) REFERENCES public.colour(id);
 ;   ALTER TABLE ONLY public.wine DROP CONSTRAINT fk_id_colour;
       public          postgres    false    3263    226    227            ?           2606    17062    producer fk_id_geolocalization    FK CONSTRAINT     ?   ALTER TABLE ONLY public.producer
    ADD CONSTRAINT fk_id_geolocalization FOREIGN KEY (id_geolocalization) REFERENCES public.geolocalization(id);
 H   ALTER TABLE ONLY public.producer DROP CONSTRAINT fk_id_geolocalization;
       public          postgres    false    217    224    3247            ?           2606    17312 *   wine_grape_composition fk_id_grape_variety    FK CONSTRAINT     ?   ALTER TABLE ONLY public.wine_grape_composition
    ADD CONSTRAINT fk_id_grape_variety FOREIGN KEY (id_grape_variety) REFERENCES public.grape_variety(id);
 T   ALTER TABLE ONLY public.wine_grape_composition DROP CONSTRAINT fk_id_grape_variety;
       public          postgres    false    3269    229    228            ?           2606    17237    wine fk_id_producer    FK CONSTRAINT     y   ALTER TABLE ONLY public.wine
    ADD CONSTRAINT fk_id_producer FOREIGN KEY (id_producer) REFERENCES public.producer(id);
 =   ALTER TABLE ONLY public.wine DROP CONSTRAINT fk_id_producer;
       public          postgres    false    3259    227    224            ?           2606    17307 !   wine_grape_composition fk_id_wine    FK CONSTRAINT        ALTER TABLE ONLY public.wine_grape_composition
    ADD CONSTRAINT fk_id_wine FOREIGN KEY (id_wine) REFERENCES public.wine(id);
 K   ALTER TABLE ONLY public.wine_grape_composition DROP CONSTRAINT fk_id_wine;
       public          postgres    false    3265    227    228            ?           2606    17320    wine_certification fk_id_wine    FK CONSTRAINT     {   ALTER TABLE ONLY public.wine_certification
    ADD CONSTRAINT fk_id_wine FOREIGN KEY (id_wine) REFERENCES public.wine(id);
 G   ALTER TABLE ONLY public.wine_certification DROP CONSTRAINT fk_id_wine;
       public          postgres    false    230    3265    227            ?           2606    17364    wine fk_id_wine_type    FK CONSTRAINT     ?   ALTER TABLE ONLY public.wine
    ADD CONSTRAINT fk_id_wine_type FOREIGN KEY (id_wine_type) REFERENCES public.wine_type(id) NOT VALID;
 >   ALTER TABLE ONLY public.wine DROP CONSTRAINT fk_id_wine_type;
       public          postgres    false    231    227    3271            ?           2606    17057    producer fk_lau_code    FK CONSTRAINT     x   ALTER TABLE ONLY public.producer
    ADD CONSTRAINT fk_lau_code FOREIGN KEY (lau_code) REFERENCES public.lau(lau_code);
 >   ALTER TABLE ONLY public.producer DROP CONSTRAINT fk_lau_code;
       public          postgres    false    3257    224    223            ?           2606    16929    nuts2 fk_nuts1_code    FK CONSTRAINT     }   ALTER TABLE ONLY public.nuts2
    ADD CONSTRAINT fk_nuts1_code FOREIGN KEY (nuts1_code) REFERENCES public.nuts1(nuts1_code);
 =   ALTER TABLE ONLY public.nuts2 DROP CONSTRAINT fk_nuts1_code;
       public          postgres    false    3251    220    221            ?           2606    16941    nuts3 fk_nuts2_code    FK CONSTRAINT     }   ALTER TABLE ONLY public.nuts3
    ADD CONSTRAINT fk_nuts2_code FOREIGN KEY (nuts2_code) REFERENCES public.nuts2(nuts2_code);
 =   ALTER TABLE ONLY public.nuts3 DROP CONSTRAINT fk_nuts2_code;
       public          postgres    false    221    222    3253            ?           2606    16980    lau fk_nuts3_code    FK CONSTRAINT     {   ALTER TABLE ONLY public.lau
    ADD CONSTRAINT fk_nuts3_code FOREIGN KEY (nuts3_code) REFERENCES public.nuts3(nuts3_code);
 ;   ALTER TABLE ONLY public.lau DROP CONSTRAINT fk_nuts3_code;
       public          postgres    false    222    223    3255            ?           2606    16917    nuts1 fk_nuts_country    FK CONSTRAINT     ?   ALTER TABLE ONLY public.nuts1
    ADD CONSTRAINT fk_nuts_country FOREIGN KEY (nuts_country_code) REFERENCES public.nuts_country(nuts_country_code);
 ?   ALTER TABLE ONLY public.nuts1 DROP CONSTRAINT fk_nuts_country;
       public          postgres    false    220    219    3249           