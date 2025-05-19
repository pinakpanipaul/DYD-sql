select  order_no as order_ID,
(select first_name from user where id = user_id) as Customer_name,
(select phone from user where id = user_id) as Phone,
-- order_package_names as Service_Package,
(select GROUP_CONCAT(PM.package_name) from order_package_master OPM,package_master PM where order_master_id = OM.order_master_id and OPM.package_id= PM.package_master_id) as Service_Package,
(select Date_Format(order_date,"%d-%M-%Y") from user where id = user_id) as order_date,
-- sv_id,
total_amount as Amount,
service_alert,
 (select name from predefined_master PM where PM.predefined_id = OM.status_id) as Status
from order_master OM where order_date BETWEEN '2025-04-01' AND '2025-05-31'
and status_id = 34
order by created_date asc;