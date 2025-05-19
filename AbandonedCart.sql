SELECT 
(select first_name from DYD_PROD.user where CM.user_id = id )  as name,
(select username from DYD_PROD.user where CM.user_id = id ) as mobile,
(select Date_Format(created_date,"%d-%M-%Y") from DYD_PROD.user where CM.user_id = id ) as RegistrationDate,
(select email from DYD_PROD.user where CM.user_id = id ) as email,
(select lead_source from DYD_PROD.user where CM.user_id = id ) as Lead_source,
(select package_name from DYD_PROD.package_master PM where CM.package_id = PM.package_master_id ) as Package,
(select GROUP_CONCAT(order_no) from DYD_PROD.order_master OM  where OM.user_id = CM.user_id)  as Order_ID,

(select Date_Format(created_date,"%d-%M-%Y")) as CartCreationDate

FROM DYD_PROD.cart_master CM
where is_delete ='N';