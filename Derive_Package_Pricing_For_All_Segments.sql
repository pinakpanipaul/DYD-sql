/* DERIVE PACKAGE PRICING FOR ALL THE SEGMENTS(For Example : Denting & Painting) * /

select * from package_service where package_id in ('179', '180', '1338', '1339')

select package_master_id, package_name from package_master where package_name in('Full Body Painting', 'Panel Painting', 'Roof Painting', 'Bonnet Painting')

select predefined_id, code, entity_type from predefined_master where entity_type in ('BRANDSEGMENT', 'MANUFACTURER', 'FUEL') and is_deactive = 'N' and is_delete = 'N'

select * from brand_master where is_delete = 'N' and is_deactive ='N'

select * from brand_fuel_master where is_delete = 'N' and is_deactive ='N'