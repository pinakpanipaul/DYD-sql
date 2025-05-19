SELECT

(select first_name from user where id = o.user_id) as Customer_name,

(select username from user where id = o.user_id) as Customer_Number,


 o.order_date, o.order_no, o.total_amount, o.order_package_names, o.sv_id, o.sg_id,ua.address_line1,ua.address_line2,
 ua.map_address,ua.address_type,ua.house_no,ua.lat,ua.lng

  FROM order_master o left join user_address ua on o.address_id =ua.user_address_id 

 where o.is_delete ='N' and o.status_id = '34' and o.sv_id IN(1, 3, 4, 7) and o.order_date BETWEEN '2022-12-01' and '2025-05-31'