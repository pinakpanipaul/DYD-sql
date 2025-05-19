
SELECT
 SUM(total_amount), order_package_names
 FROM order_master 
 where is_delete ='N' and status_id = '34' and sv_id IN(1, 3, 4, 7) and order_date BETWEEN '2022-01-01' and '2025-05-31' group by order_package_names
 