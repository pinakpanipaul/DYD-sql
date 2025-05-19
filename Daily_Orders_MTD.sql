
SELECT
  (SELECT first_name FROM user WHERE id = o.user_id) AS Customer_name,
  (SELECT username FROM user WHERE id = o.user_id) AS Customer_Number,
  (SELECT name FROM predefined_master PM WHERE PM.predefined_id = o.status_id) AS Status,
  COALESCE(
    (SELECT service_vehicle_name FROM service_vehicle_master SVM WHERE SVM.service_vehicle_master_id = o.sv_id),
    'Service Garage'
  ) AS SV_NAME,
  
  o.order_date,
  o.order_no,
  o.total_amount,
  o.order_package_names,
  o.sg_id,
  o.selected_time_slot_name,
  ua.address_line1,
  ua.address_line2,
  ua.map_address,
  ua.address_type,
  ua.house_no

FROM order_master o
LEFT JOIN user_address ua ON o.address_id = ua.user_address_id 
WHERE o.is_delete = 'N' 
  AND o.order_date BETWEEN '2025-05-01' AND '2025-05-18'
