select package_name, package_description ,package_time_takes_hrs as  HRS,package_time_takes_minutes as MINS,
(SELECT GROUP_CONCAT(package_check_name) FROM DYD_PROD.package_sop_check_master where PM.package_master_id = package_id and  is_delete ='N' and is_deactive ='N') as SOPs
 from package_master  PM
 where is_deactive ='N'  and  is_delete ='N' order by 1 desc ;