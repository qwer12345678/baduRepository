/**
 * ERP-委外模块小数点改造
 */
 
#################################################################委外半成品

# 委外申请商品信息表
ALTER TABLE `btsaas`.`oe_application_product` 
	MODIFY `original_oe_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '原始申请委外数量',
	MODIFY `oe_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '当前申请委外数量',
	MODIFY `order_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '订单数量',
	MODIFY `wait_oe_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '待委外数量',
  MODIFY `oe_limit_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '放量数';





# 委外申请关联物料信息表
ALTER TABLE `btsaas`.`oe_application_material` 
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '标准用量比',
	MODIFY `attrition_rate` decimal(28, 8) DEFAULT 0.00000000 COMMENT '损耗率',
	MODIFY `oe_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请委外数量',
	MODIFY `wait_send_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '待发货数量',
  MODIFY `oe_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数';




# 发起委外订单时发票快照 
-- 新增字段
ALTER TABLE `btsaas`.`oe_bill_template`  
	ADD bill_money_temp0 decimal(28, 8) DEFAULT NULL AFTER bill_money;
	
-- 赋值新字段
update oe_bill_template obt set obt.bill_money_temp0 = obt.bill_money/100;

-- 修改老字段名称   
ALTER TABLE oe_bill_template CHANGE bill_money bill_money1 bigint(15) DEFAULT NULL;

-- 修改新字段名称
ALTER TABLE oe_bill_template CHANGE bill_money_temp0 bill_money decimal(28, 8) DEFAULT NULL;




# 委外申请商品信息表
ALTER TABLE `btsaas`.`oe_order` 
	MODIFY `amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '委外总量';




# 订单产品表
ALTER TABLE `btsaas`.`oe_order_product` 
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量',
	MODIFY `decimal_wait_process_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等加工的数量',
  MODIFY `decimal_wait_in_storage_audit` decimal(28, 8) DEFAULT 0.00000000 COMMENT '入库审核中',
	MODIFY `decimal_already_in_storage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经入库',
	MODIFY `decimal_already_delivered` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经发货',
	MODIFY `decimal_already_receive` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经收货';


# 订单产品加工商关联表
ALTER TABLE `btsaas`.`oe_order_product_processor` 
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量',
	MODIFY `decimal_wait_process_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等加工的数量',
  MODIFY `decimal_wait_in_storage_audit` decimal(28, 8) DEFAULT 0.00000000 COMMENT '入库审核中',
	MODIFY `decimal_already_in_storage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经入库',
	MODIFY `decimal_already_delivered` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经发货',
	MODIFY `decimal_already_receive` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经收货';



# 委外订单加工商产品修改历史表
ALTER TABLE `btsaas`.`oe_order_product_processor_history` 
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量';
	
	
	
# 委外订单产品加工商操作产品状态变化记录表
ALTER TABLE `btsaas`.`oe_order_product_processor_record` 
	MODIFY `operate_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '操作数量';
	
	


# 委外订单相关联的物料
ALTER TABLE `btsaas`.`oe_order_material_new` 
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '标准用量比',
	MODIFY `attrition_rate` decimal(28, 8) DEFAULT 0.00000000 COMMENT '损耗率',
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量',
	MODIFY `decimal_wait_procurement_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待采购加工的数量',
	MODIFY `decimal_procurement_amount_be_doing` decimal(28, 8) DEFAULT 0.00000000 COMMENT '采购中',
	MODIFY `decimal_wait_process_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等加工的数量',
	MODIFY `decimal_wait_in_storage_audit` decimal(28, 8) DEFAULT 0.00000000 COMMENT '入库审核中',
	MODIFY `decimal_already_in_storage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经入库',
  MODIFY `decimal_already_delivered` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经发货',
	MODIFY `decimal_already_receive` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经收货';
	



# 订单物料加工商关联表
ALTER TABLE `btsaas`.`oe_order_material_new_processor` 
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '标准用量比',
	MODIFY `attrition_rate` decimal(28, 8) DEFAULT 0.00000000 COMMENT '损耗率',
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) DEFAULT NULL COMMENT '产品单价',
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量',
	MODIFY `decimal_wait_receive` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待收货',
	MODIFY `decimal_wait_process_amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等加工的数量',
	MODIFY `decimal_wait_in_storage_audit` decimal(28, 8) DEFAULT 0.00000000 COMMENT '入库审核中',
	MODIFY `decimal_already_in_storage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经入库',
  MODIFY `decimal_already_delivered` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经发货',
	MODIFY `decimal_already_receive` decimal(28, 8) DEFAULT 0.00000000 COMMENT '已经收货';





# 订单物料加工商操作记录表
ALTER TABLE `btsaas`.`oe_order_material_new_processor_record` 
	MODIFY `operate_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '操作数量',
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量';
	



# 委外计划表
ALTER TABLE `btsaas`.`oe_plan` 
	MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '委外总量';
	


# 委外计划产品表
ALTER TABLE `btsaas`.`oe_plan_product` 
	MODIFY `unit_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '计划发货产品数量';
	


# 加工商计划关联商品表
ALTER TABLE `btsaas`.`oe_plan_product_processor` 
  MODIFY `inventory` decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存',
	MODIFY `unit_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `price_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '不同加工商的委外数量',
	MODIFY `total_price` decimal(28, 8) DEFAULT NULL COMMENT '当前供应商单价数量总价';




# 委外计划物料表
ALTER TABLE `btsaas`.`oe_plan_material` 
  MODIFY `decimal_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '计划发货物料数量',
	MODIFY `amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '预计物料总数量',
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT NULL COMMENT '标准用量比',
	MODIFY `attrition_rate` decimal(28, 8) DEFAULT NULL COMMENT '损耗率';
	
	
	
	
	
# 加工商计划关联物料表
ALTER TABLE `btsaas`.`oe_plan_material_processor` 
  MODIFY `amount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '预计物料发货数量',
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT NULL COMMENT '标准用量比',
	MODIFY `attrition_rate` decimal(28, 8) DEFAULT NULL COMMENT '损耗率';




# 购物车产品
ALTER TABLE `btsaas`.`oe_shopping_car_product` 
	ADD `original_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价' AFTER `original_price`,
	ADD `cost_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价' AFTER `cost_price`,
	ADD `sold_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`,
	ADD `outsource_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '委外数量' AFTER `outsource_amount`;
	
-- 赋值
update oe_shopping_car_product oscp set 
	oscp.original_price_temp0 = oscp.original_price/100,
	oscp.cost_price_temp0 = oscp.cost_price/100,
	oscp.sold_price_temp0 = oscp.sold_price/100,
	oscp.outsource_amount_temp0 = oscp.outsource_amount;

-- 修改老字段名称   
ALTER TABLE oe_shopping_car_product 
	CHANGE original_price original_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '原价',
	CHANGE cost_price cost_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '成本价/代理价',
	CHANGE sold_price sold_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '销售价',
	CHANGE outsource_amount outsource_amount1 bigint(20) DEFAULT '0' COMMENT '委外数量';
	
-- 修改新字段名称
ALTER TABLE oe_shopping_car_product 
	CHANGE original_price_temp0 original_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价',
	CHANGE cost_price_temp0 cost_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价',
	CHANGE sold_price_temp0 sold_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价',
	CHANGE outsource_amount_temp0 outsource_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '委外数量';







# 购物车产品的组成物料
ALTER TABLE `btsaas`.`oe_shopping_car_material` 
	ADD `original_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价' AFTER `original_price`,
	ADD `cost_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价' AFTER `cost_price`,
	ADD `sold_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`,
	ADD `shipments_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请发货数量' AFTER `shipments_amount`,
	MODIFY `standard_dosage` decimal(28, 8) DEFAULT 0.00000000 COMMENT '标准用量比';
	
-- 赋值
update oe_shopping_car_material oscm set 
	oscm.original_price_temp0 = oscm.original_price/100,
	oscm.cost_price_temp0 = oscm.cost_price/100,
	oscm.sold_price_temp0 = oscm.sold_price/100,
	oscm.shipments_amount_temp0 = oscm.shipments_amount;

-- 修改老字段名称   
ALTER TABLE oe_shopping_car_material 
	CHANGE original_price original_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '原价',
	CHANGE cost_price cost_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '成本价/代理价',
	CHANGE sold_price sold_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '销售价',
	CHANGE shipments_amount shipments_amount1 bigint(20) DEFAULT '0' COMMENT '申请发货数量';
	
-- 修改新字段名称
ALTER TABLE oe_shopping_car_material 
	CHANGE original_price_temp0 original_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价',
	CHANGE cost_price_temp0 cost_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价',
	CHANGE sold_price_temp0 sold_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价',
	CHANGE shipments_amount_temp0 shipments_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请发货数量';
	



	
# 采购 pe_purchase_order_good 与 company_storehouse_inout 关联表
ALTER TABLE `btsaas`.`oe_to_audit_in_storage` 
  MODIFY `decimal_stock_pending_total` decimal(28, 8) DEFAULT NULL COMMENT '待入库数量';




# 委外订单 物料 与 company_storehouse_inout_item 关联表
ALTER TABLE `btsaas`.`oe_to_audit_out_storage` 
  MODIFY `decimal_for_outbound_total` decimal(28, 8) DEFAULT NULL COMMENT '待出库数量';







































