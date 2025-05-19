select 
(select order_no from order_master OM where OM.order_master_id = OSM.order_master_id) as Order_Id,
(select first_name from user U where id = ( select user_id from order_master OM where OM.order_master_id = OSM.order_master_id) )as customer_name,
(select username from user U where id = ( select user_id from order_master OM where OM.order_master_id = OSM.order_master_id) )as mobile,
order_master_id,
(select package_name from package_master PSM where PSM.package_master_id =OSM.package_id)
package_id,
(select package_check_name from package_sop_check_master PSM where PSM.package_sop_check_id =OSM.package_sop_id) as SOP,
package_sop_id,
completed_date_start,
completed_date,
is_complete
from order_package_sop_check_master OSM;  
