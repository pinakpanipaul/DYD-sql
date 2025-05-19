
select  order_no as order_ID,
-- modified_date,
(select Date_Format(created_date,"%d-%M-%Y") from user where id = user_id) as Create_Date,
-- order_package_names as Service_Package,
(select GROUP_CONCAT(PM.package_name) from order_package_master OPM,package_master PM where order_master_id = OM.order_master_id and OPM.package_id= PM.package_master_id) as Service_Package,
(select Date_Format(order_date,"%d-%M-%Y") from user where id = user_id) as order_date,
-- sv_id,
(select ratting from order_ratting_master O  where O.order_master_id = OM.order_master_id and is_deactive = 'N' and is_delete='N') as Rating,
(select message from order_ratting_master O  where O.order_master_id = OM.order_master_id and is_deactive = 'N' and is_delete='N') as Message,
IF((select order_complaint_master_id  from order_complaint_master O  where O.order_master_id = OM.order_master_id and is_deactive = 'N' and is_delete='N')  IS  NULL,'No Complaint','Complaint') as  Complaint_Status,
total_amount as Amount
from order_master OM where is_deactive = 'N' and is_delete ='N'
order by created_date asc;