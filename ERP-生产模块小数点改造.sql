/**
 * ERP-生产模块小数点改造
 */
 
#################################################################采购

# 产品领取记录 
-- 新增字段
ALTER TABLE `btsaas`.`company_sku_get_record`  
	ADD num_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER num;
	
-- 赋值新字段
update company_sku_get_record csgr set csgr.num_temp0 = csgr.num;

-- 修改老字段名称   
ALTER TABLE company_sku_get_record CHANGE num num1 int(9) NOT NULL;

-- 修改新字段名称
ALTER TABLE company_sku_get_record CHANGE num_temp0 num decimal(28, 8) NOT NULL DEFAULT 0.00000000;
	
	
	
	
	
# 生产订单表 
-- 新增字段
ALTER TABLE `btsaas`.`iot_production_order`   
	ADD number_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '需要生产数量' AFTER number,
	ADD arranged_number_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '安排计划排产得数量' AFTER arranged_number;
	
-- 赋值新字段
update iot_production_order ipo set 
	ipo.number_temp0 = ipo.number,
	ipo.arranged_number_temp0 = ipo.arranged_number;

-- 修改老字段名称   
ALTER TABLE iot_production_order 
	CHANGE number number1 int(9) NOT NULL COMMENT '需要生产数量',
	CHANGE arranged_number arranged_number1  int(9) DEFAULT '0' COMMENT '安排计划排产得数量';

-- 修改新字段名称
ALTER TABLE iot_production_order 
	CHANGE number_temp0 number decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '需要生产数量',
	CHANGE arranged_number_temp0 arranged_number decimal(28, 8) DEFAULT 0.00000000 COMMENT '安排计划排产得数量';
	

	


# 工单表 
-- 新增字段
ALTER TABLE `btsaas`.`iot_work_list_copy` 
	ADD wait_check_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '待质检数量' AFTER wait_check_num,
	ADD original_check_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '原始待验收数据量' AFTER original_check_num,
	ADD product_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '生产数量' AFTER product_num,
	ADD actual_output_number_temp0 decimal(28, 8) DEFAULT NULL COMMENT '实际产出数量' AFTER actual_output_number;
	
-- 赋值新字段
update iot_work_list_copy iwlc set 
	iwlc.wait_check_num_temp0 = iwlc.wait_check_num,
	iwlc.original_check_num_temp0 = iwlc.original_check_num,
	iwlc.product_num_temp0 = iwlc.product_num,
	iwlc.actual_output_number_temp0 = iwlc.actual_output_number;

-- 修改老字段名称   
ALTER TABLE iot_work_list_copy 
	CHANGE wait_check_num wait_check_num1 int(5) DEFAULT NULL COMMENT '待质检数量',
	CHANGE original_check_num original_check_num1 int(5) DEFAULT NULL COMMENT '原始待验收数据量',
	CHANGE product_num product_num1 int(9) DEFAULT NULL COMMENT '生产数量',
	CHANGE actual_output_number actual_output_number1 int(9) DEFAULT NULL COMMENT '实际产出数量';

-- 修改新字段名称
ALTER TABLE iot_work_list_copy 
	CHANGE wait_check_num_temp0 wait_check_num decimal(28, 8) DEFAULT NULL COMMENT '待质检数量',
	CHANGE original_check_num_temp0 original_check_num decimal(28, 8) DEFAULT NULL COMMENT '原始待验收数据量',
	CHANGE product_num_temp0 product_num decimal(28, 8) DEFAULT NULL COMMENT '生产数量',
	CHANGE actual_output_number_temp0 actual_output_number decimal(28, 8) DEFAULT NULL COMMENT '实际产出数量';

	
	
	
	
# 生产订单计划
-- 新增字段
ALTER TABLE  `btsaas`.`iot_production_orderplan`  
	ADD produce_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '安排排产数量' AFTER produce_num;
	
-- 赋值新字段
update iot_production_orderplan ipop set ipop.produce_num_temp0 = ipop.produce_num;

-- 修改老字段名称   
ALTER TABLE iot_production_orderplan CHANGE produce_num produce_num1 int(9) DEFAULT NULL COMMENT '安排排产数量';

-- 修改新字段名称
ALTER TABLE iot_production_orderplan CHANGE produce_num_temp0 produce_num decimal(28, 8) DEFAULT NULL COMMENT '安排排产数量';


	
	
	
	
# iot_work_list_item
-- 新增字段
ALTER TABLE  `btsaas`.`iot_work_list_item`  
	ADD product_total_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER product_total;
	
-- 赋值新字段
update iot_work_list_item iwli set iwli.product_total_temp0 = iwli.product_total;

-- 修改老字段名称   
ALTER TABLE iot_work_list_item CHANGE product_total product_total1 int(9) NOT NULL;

-- 修改新字段名称
ALTER TABLE iot_work_list_item CHANGE product_total_temp0 product_total decimal(28, 8) NOT NULL DEFAULT 0.00000000;






# 生产计划表
-- 新增字段
ALTER TABLE  `btsaas`.`iot_production_plan_copy`   
	ADD expect_product_num_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '生产计划预计生产数量'AFTER expect_product_num;
	
-- 赋值新字段
update iot_production_plan_copy ippc set ippc.expect_product_num_temp0 = ippc.expect_product_num;

-- 修改老字段名称   
ALTER TABLE iot_production_plan_copy CHANGE expect_product_num expect_product_num1 int(9) NOT NULL DEFAULT '0' COMMENT '生产计划预计生产数量';

-- 修改新字段名称
ALTER TABLE iot_production_plan_copy CHANGE expect_product_num_temp0 expect_product_num decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '生产计划预计生产数量';






# iot_plan_transfer_config
-- 新增字段
ALTER TABLE `btsaas`.`iot_plan_transfer_config`   
	ADD batch_temp0 decimal(28, 8) unsigned NOT NULL DEFAULT 1 COMMENT '批次第几批  全部和单次默认都是1 因为单次每次都是一样的' AFTER batch,
	ADD batch_num_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER batch_num;
	
-- 赋值新字段
update iot_plan_transfer_config iptc set 
	iptc.batch_temp0 = iptc.batch, 
  iptc.batch_num_temp0 = iptc.batch_num;
	
-- 修改老字段名称   
ALTER TABLE iot_plan_transfer_config 
	CHANGE batch batch1 int(9) unsigned NOT NULL DEFAULT '1' COMMENT '批次第几批  全部和单次默认都是1 因为单次每次都是一样的',
	CHANGE batch_num batch_num1 int(9) NOT NULL DEFAULT '0';

-- 修改新字段名称
ALTER TABLE iot_plan_transfer_config 
	CHANGE batch_temp0 batch decimal(28, 8) unsigned NOT NULL DEFAULT 1 COMMENT '批次第几批  全部和单次默认都是1 因为单次每次都是一样的',
	CHANGE batch_num_temp0 batch_num decimal(28, 8) NOT NULL DEFAULT 0.00000000;





# iot_work_list_copy_customdata
-- 新增字段
ALTER TABLE `btsaas`.`iot_work_list_copy_customdata` 
	ADD wait_check_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '待验收数量' AFTER wait_check_num,
	ADD original_check_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '原始待验收数量' AFTER original_check_num;

-- 赋值新字段
update iot_work_list_copy_customdata iwlcc set 
	iwlcc.wait_check_num_temp0 = iwlcc.wait_check_num, 
  iwlcc.original_check_num_temp0 = iwlcc.original_check_num;
	
-- 修改老字段名称   
ALTER TABLE iot_work_list_copy_customdata 
	CHANGE wait_check_num wait_check_num1 int(9) DEFAULT NULL COMMENT '待验收数量',
	CHANGE original_check_num original_check_num1 int(9) DEFAULT NULL COMMENT '原始待验收数量';

-- 修改新字段名称
ALTER TABLE iot_work_list_copy_customdata 
	CHANGE wait_check_num_temp0 wait_check_num decimal(28, 8) DEFAULT NULL COMMENT '待验收数量',
	CHANGE original_check_num_temp0 original_check_num decimal(28, 8) DEFAULT NULL COMMENT '原始待验收数量';





# iot_production_plan_item
-- 新增字段
ALTER TABLE `btsaas`.`iot_production_plan_item`  
	ADD product_total_temp0 decimal(28, 8) DEFAULT NULL AFTER product_total;
	
-- 赋值新字段
update iot_production_plan_item ippi set ippi.product_total_temp0 = ippi.product_total;

-- 修改老字段名称   
ALTER TABLE iot_production_plan_item CHANGE product_total product_total1 int(9) DEFAULT NULL;

-- 修改新字段名称
ALTER TABLE iot_production_plan_item CHANGE product_total_temp0 product_total decimal(28, 8) DEFAULT NULL;






# iot_work_material
-- 新增字段
ALTER TABLE `btsaas`.`iot_work_material`  
	ADD need_num_temp0 decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '需要数量' AFTER need_num,
	ADD usage_ratio_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '用量比' AFTER usage_ratio,
	ADD wastage_rate_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '损耗率' AFTER wastage_rate;

-- 赋值新字段
update iot_work_material iwm set 
	iwm.need_num_temp0 = iwm.need_num, 
  iwm.usage_ratio_temp0 = iwm.usage_ratio,
	iwm.wastage_rate_temp0 = iwm.wastage_rate;
	
-- 修改老字段名称   
ALTER TABLE iot_work_material 
	CHANGE need_num need_num1 int(9) NOT NULL COMMENT '需要数量',
	CHANGE usage_ratio usage_ratio1 int(9) DEFAULT '0' COMMENT '用量比',
	CHANGE wastage_rate wastage_rate1 int(11) DEFAULT '0' COMMENT '损耗率';

-- 修改新字段名称
ALTER TABLE iot_work_material 
	CHANGE need_num_temp0 need_num decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '需要数量',
	CHANGE usage_ratio_temp0 usage_ratio decimal(28, 8) DEFAULT 0.00000000 COMMENT '用量比',
	CHANGE wastage_rate_temp0 wastage_rate decimal(28, 8) DEFAULT 0.00000000 COMMENT '损耗率';
	
	

	

# iot_work_list_copy_transfer
-- 新增字段
ALTER TABLE `btsaas`.`iot_work_list_copy_transfer`  
	ADD number_temp0 decimal(28, 8) DEFAULT NULL COMMENT '流转得商品数量' AFTER number,
	ADD batch_num_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '当前批次' AFTER batch_num;

-- 赋值新字段
update iot_work_list_copy_transfer iwlct set 
	iwlct.number_temp0 = iwlct.number, 
  iwlct.batch_num_temp0 = iwlct.batch_num;
	
-- 修改老字段名称   
ALTER TABLE iot_work_list_copy_transfer 
	CHANGE number number1 int(9) DEFAULT NULL COMMENT '流转得商品数量',
	CHANGE batch_num batch_num1 int(9) DEFAULT '0' COMMENT '当前批次';

-- 修改新字段名称
ALTER TABLE iot_work_list_copy_transfer 
	CHANGE number_temp0 number decimal(28, 8) DEFAULT NULL COMMENT '流转得商品数量',
	CHANGE batch_num_temp0 batch_num decimal(28, 8) DEFAULT 0.00000000 COMMENT '当前批次';
	
	



# 工单评分表
-- 新增字段
ALTER TABLE `btsaas`.`iot_work_list_evaluation`   
	ADD checked_num_temp0 decimal(28, 8) DEFAULT NULL COMMENT '已验收数量' AFTER checked_num,
	ADD pass_rate_temp0 decimal(28, 8) DEFAULT NULL COMMENT '通过率' AFTER pass_rate,
	ADD batch_num_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '批次' AFTER batch_num;

-- 赋值新字段
update iot_work_list_evaluation iwle set 
	iwle.checked_num_temp0 = iwle.checked_num, 
  iwle.pass_rate_temp0 = iwle.pass_rate,
	iwle.batch_num_temp0 = iwle.batch_num;
	
-- 修改老字段名称   
ALTER TABLE iot_work_list_evaluation 
	CHANGE checked_num checked_num1 int(5) DEFAULT NULL COMMENT '已验收数量',
	CHANGE pass_rate pass_rate1 int(11) DEFAULT NULL COMMENT '通过率',
	CHANGE batch_num batch_num1 int(9) DEFAULT '0' COMMENT '批次';

-- 修改新字段名称
ALTER TABLE iot_work_list_evaluation 
	CHANGE checked_num_temp0 checked_num decimal(28, 8) DEFAULT NULL COMMENT '已验收数量',
	CHANGE pass_rate_temp0 pass_rate decimal(28, 8) DEFAULT NULL COMMENT '通过率',
	CHANGE batch_num_temp0 batch_num decimal(28, 8) DEFAULT 0.00000000 COMMENT '批次';
	

	
	
	
	
	
# iot_work_check_record
-- 新增字段
ALTER TABLE  `btsaas`.`iot_work_check_record`    
	ADD batch_num_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '批次' AFTER batch_num;
	
-- 赋值新字段
update iot_work_check_record iwcr set iwcr.batch_num_temp0 = iwcr.batch_num;

-- 修改老字段名称   
ALTER TABLE iot_work_check_record CHANGE batch_num batch_num1 int(9) DEFAULT '0' COMMENT '批次';

-- 修改新字段名称
ALTER TABLE iot_work_check_record CHANGE batch_num_temp0 batch_num decimal(28, 8) DEFAULT 0.00000000 COMMENT '批次';






# iot_production_process_material
-- 新增字段
ALTER TABLE  `btsaas`.`iot_production_process_material`  
	ADD usage_ratio_temp0 decimal(28, 8) DEFAULT NULL COMMENT '用量比' AFTER usage_ratio,
	ADD wastage_rate_temp0 decimal(28, 8) DEFAULT NULL COMMENT '损耗率' AFTER wastage_rate;

-- 赋值新字段
update iot_production_process_material ippm set 
	ippm.usage_ratio_temp0 = ippm.usage_ratio, 
  ippm.wastage_rate_temp0 = ippm.wastage_rate;
	
-- 修改老字段名称   
ALTER TABLE iot_production_process_material 
	CHANGE usage_ratio usage_ratio1 int(9) DEFAULT NULL COMMENT '用量比',
	CHANGE wastage_rate wastage_rate1 int(9) DEFAULT NULL COMMENT '损耗率';
	
-- 修改新字段名称
ALTER TABLE iot_production_process_material 
	CHANGE usage_ratio_temp0 usage_ratio decimal(28, 8) DEFAULT NULL COMMENT '用量比',
	CHANGE wastage_rate_temp0 wastage_rate decimal(28, 8) DEFAULT NULL COMMENT '损耗率';
	
	
	
	
	
	
# 备料操作记录表
-- 新增字段
ALTER TABLE  `btsaas`.`iot_material_preparation_operation_record`   
	ADD production_num_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '生产数量' AFTER production_num;

-- 赋值新字段
update iot_material_preparation_operation_record impor set 
	impor.production_num_temp0 = impor.production_num;
	
-- 修改老字段名称   
ALTER TABLE iot_material_preparation_operation_record 
	CHANGE production_num production_num1 int(9) DEFAULT '0' COMMENT '生产数量';
	
-- 修改新字段名称
ALTER TABLE iot_material_preparation_operation_record 
	CHANGE production_num_temp0 production_num decimal(28, 8) DEFAULT 0.00000000 COMMENT '生产数量';
	
	
	
	
	
# iot_commit_feedback_record
-- 新增字段
ALTER TABLE   `btsaas`.`iot_commit_feedback_record`   
	ADD batch_num_temp0 decimal(28, 8) DEFAULT 0.00000000 COMMENT '当前批次号默认0' AFTER batch_num;

-- 赋值新字段
update iot_commit_feedback_record idfr set 
	idfr.batch_num_temp0 = idfr.batch_num;
	
-- 修改老字段名称   
ALTER TABLE iot_commit_feedback_record 
	CHANGE batch_num batch_num1 int(11) DEFAULT '0' COMMENT '当前批次号默认0';
	
-- 修改新字段名称
ALTER TABLE iot_commit_feedback_record 
	CHANGE batch_num_temp0 batch_num decimal(28, 8) DEFAULT 0.00000000 COMMENT '当前批次号默认0';
	
	
	
	
	
	

	
	



	
	
	
	