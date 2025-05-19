select  order_no as order_ID,
modified_date,
(select Date_Format(created_date,"%d-%M-%Y") from user where id = user_id) as Create_Date,
(select first_name from user where id = user_id) as Customer_name,
(select concat(house_no,' ',address_line1,' ',address_line2,' ',pincode,' ' ,city,' ' ,state,' ' ,country)  from user_address where user_address_id = address_id) as address,
order_package_names as Service_Package,
(select GROUP_CONCAT(PM.package_name) from order_package_master OPM,package_master PM where order_master_id = OM.order_master_id and OPM.package_id= PM.package_master_id) as Service_Package,
(select Date_Format(order_date,"%d-%M-%Y") from user where id = user_id) as order_date,
sv_id,
 (select service_vehicle_name from service_vehicle_master where service_vehicle_master_id = 1) as SV_NAME,
(select name from predefined_master where predefined_id= payment_mode_id) as Pay_Mode,
(select ratting from order_ratting_master O  where O.order_master_id = OM.order_master_id and is_deactive = 'N' and is_delete='N') as Rating,
IF((select order_complaint_master_id  from order_complaint_master O  where O.order_master_id = OM.order_master_id and is_deactive = 'N' and is_delete='N')  IS  NULL,'No Complaint','Complaint') as  Complaint_Status,
total_amount as Amount,
service_alert,
 (select file_path from document_master where document_id = (select document_master_id from order_image_master OIM where OIM.entity_type ='TAX_INVOICE' and OIM.order_master_id =OM.order_master_id and OIM.is_delete ='N' )) as tax_invoice,
 (select file_path from document_master where document_id = (select max(document_master_id) from user_car_document where user_car_id = OM.selected_car_id   and entity_type ='USER-INSURANCE' and is_delete ='N' )) as INSURANCE,
 (select file_path from document_master where document_id = (select max(document_master_id) from user_car_document where user_car_id = OM.selected_car_id   and entity_type ='USER-RC' and is_delete ='N' )) as RC,

(select name from predefined_master PM where PM.predefined_id = OM.status_id) as Status,
start_time,
end_time
from order_master OM where status_id = 34
order by created_date asc;