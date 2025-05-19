
select * from (
select A.brand_id,A.fuel_id,Z.part_id,


(select brand_name from brand_master BM where BM.brand_master_id = A.brand_id ) as BRANDNAME,
(select name from predefined_master PM where PM.predefined_id = A.fuel_id) as Fuel,
(select name from predefined_master PM where PM.predefined_id = Z.part_id) as PART ,
Z.rate_master_id from
(SELECT * FROM DYD_PROD.brand_fuel_master where is_delete ='N' and is_deactive ='N'
and brand_id in (select brand_master_id from brand_master  where is_delete ='N' and is_deactive ='N')) A   join
(select predefined_id,rate_master_id,fuel_id,part_id,brand_id from 
(select predefined_id,name from predefined_master PM where entity_type ='PART' and is_delete ='N') X
left outer join rate_master RM on (X.predefined_id = RM.part_id and RM.is_delete ='N' and RM.is_deactive ='N') ) Z
 on (A.fuel_id =Z.fuel_id and A.brand_id = Z.brand_id )) A 
where A.PART = 'EXIDE 32AH EKO EKO32'