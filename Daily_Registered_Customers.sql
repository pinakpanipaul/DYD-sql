
SELECT
(select Date_Format(created_date,"%d-%M-%Y") from user where id = user_id) as Customer_Registeration,
(select first_name from user where id = user_id) as Customer_name,
(select username from user where id = user_id) as Customer_Number,
(select email from user where id = user_id) as Customer_Email,
(select lead_source from user where id = user_id) as Lead_Source,
(select name from predefined_master where predefined_id = manufacturer_id) as manufacturer,
(select brand_name from brand_master BM where brand_master_id = brand_id) as brand,
(select name from predefined_master where predefined_id = fuel_id) as Fuel,
registration_no
 FROM DYD_PROD.user_car_master 
 where is_delete ='N';
