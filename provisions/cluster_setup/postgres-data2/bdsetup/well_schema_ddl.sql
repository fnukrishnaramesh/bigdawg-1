CREATE SCHEMA IF NOT EXISTS welldata;
CREATE TABLE IF NOT EXISTS welldata.productiondata (
    dateprd character varying(8),
    well_bore_code character varying(14),
    npd_well_bore_code integer,
    npd_well_bore_name character varying(11),
    npd_field_code integer,
    npd_field_name character varying(5),
    npd_facility_code integer,
    on_stream_hrs double precision,
    avg_downhole_pressure double precision,
    avg_downhole_temperature double precision,
    avg_dp_tubing double precision,
    avg_annulus_press double precision,
    avg_choke_size_p double precision,
    avg_whp_p double precision,
    avg_wht_p double precision,
    dp_choke_size double precision,
    bore_oil_vol double precision,
    bore_gas_vol integer,
    bore_wat_vol integer,
    bore_wi_vol integer,
    flow_kind character varying(10),
    well_type character varying(2)
);
CREATE TABLE IF NOT EXISTS welldata.welllogsdata (
    depth double precision,
    hook_load_avg double precision,
    wob_avg double precision,
    rpm_surface_avg integer,
    torqueabs_avg integer,
    spp_avg double precision,
    rop_inst double precision,
    well_bore_code character varying(14)
);






