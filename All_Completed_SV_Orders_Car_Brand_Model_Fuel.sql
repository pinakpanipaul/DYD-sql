SELECT

(select first_name from user where id = OM.user_id) as Customer_name,

(select username from user where id = OM.user_id) as Customer_Number,

 
selected_car_id,
manufacturer_id,
(select name  from predefined_master  where entity_type = 'MANUFACTURER' and predefined_id = manufacturer_id) as Manufacturer,
brand_id,
(SELECT brand_name FROM DYD_PROD.brand_master where brand_master_id = brand_id) as brand,
fuel_id,
(select name  from predefined_master  where entity_type = 'FUEL' and predefined_id = fuel_id) as fuel,


 order_date, order_no, total_amount, order_package_names, sv_id, sg_id
 

  FROM order_master OM left outer join user_car_master UCM on (OM.selected_car_id = UCM.user_car_master_id )

 where OM.is_delete ='N' and status_id = '34' and sv_id IN(1, 3, 4, 7) and order_date BETWEEN '2022-01-01' and '2025-05-31';