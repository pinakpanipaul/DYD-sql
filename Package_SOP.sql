select package_master_id, package_name, package_time_takes_hrs, package_time_takes_minutes, 
(
select GROUP_CONCAT(package_include_name) from package_includes where is_delete ='N' and package_id = package_master_id) as SOPs

from package_master PM where is_deactive = 'N' and is_delete = 'N'
;