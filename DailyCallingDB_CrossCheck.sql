SELECT
(select first_name from user where id = o.user_id) as Customer_name,
(select username from user where id = o.user_id) as Customer_Number,
(select name from predefined_master PM where PM.predefined_id = o.status_id) as Status,
(select service_vehicle_name from service_vehicle_master SVM where SVM.service_vehicle_master_id = o.sv_id) as SV_NAME,

 o.order_date, o.order_no, o.total_amount, o.order_package_names, o.sg_id,o.selected_time_slot_name, ua.address_line1,ua.address_line2,
 ua.map_address,ua.address_type,ua.house_no
  FROM order_master o left join user_address ua on o.address_id =ua.user_address_id 
 where o.is_delete ='N' and o.sv_id IN(1, 3, 4, 7) and o.order_date BETWEEN '2025-05-18' and '2025-05-28'