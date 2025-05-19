/* RC & Insurnace for all orders */

select  order_no as order_ID,
(select Date_Format(created_date,"%d-%M-%Y") from user where id = user_id) as Create_Date,
(select GROUP_CONCAT(PM.package_name) from order_package_master OPM,package_master PM where order_master_id = OM.order_master_id and OPM.package_id= PM.package_master_id) as Service_Package,
(select Date_Format(order_date,"%d-%M-%Y") from user where id = user_id) as order_date,
 
 (select file_path from document_master where document_id = (select max(document_master_id) from user_car_document where user_car_id = OM.selected_car_id   and entity_type ='USER-INSURANCE' and is_delete ='N' )) as INSURANCE,
 (select file_path from document_master where document_id = (select max(document_master_id) from user_car_document where user_car_id = OM.selected_car_id   and entity_type ='USER-RC' and is_delete ='N' )) as RC,

(select name from predefined_master PM where PM.predefined_id = OM.status_id) as Status
from order_master OM where is_deactive = 'N' and is_delete ='N' order by created_date asc;
