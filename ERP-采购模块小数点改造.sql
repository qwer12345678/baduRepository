/**
 * ERP-采购模块小数点改造
 */
 
#################################################################采购

# 发起采购时发票快照表 
-- 新增字段
ALTER TABLE `btsaas`.`pe_purchase_bill_template`  
	ADD bill_money_temp0 decimal(28, 8) DEFAULT NULL AFTER bill_money;
	
-- 赋值新字段
update pe_purchase_bill_template ppbt set ppbt.bill_money_temp0 = ppbt.bill_money/100;

-- 修改老字段名称   
ALTER TABLE pe_purchase_bill_template CHANGE bill_money bill_money1 bigint(15) DEFAULT NULL;

-- 修改新字段名称
ALTER TABLE pe_purchase_bill_template CHANGE bill_money_temp0 bill_money decimal(28, 8) DEFAULT NULL;




# 购物车供应商商品
-- 新增字段
ALTER TABLE `btsaas`.`pe_shopping_cart_supplier_good` 
	ADD `original_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价' AFTER `original_price`,
	ADD `cost_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价' AFTER `cost_price`,
	ADD `sold_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`,
	ADD `purchase_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量' AFTER `purchase_amount`;
	
-- 赋值新字段
update pe_shopping_cart_supplier_good pscsg set 
	pscsg.original_price_temp0 = pscsg.original_price/100,
	pscsg.cost_price_temp0 = pscsg.cost_price/100,
	pscsg.sold_price_temp0 = pscsg.sold_price/100,
	pscsg.purchase_amount_temp0 = pscsg.purchase_amount;
	
-- 修改老字段名称   
ALTER TABLE pe_shopping_cart_supplier_good 
	CHANGE original_price original_price1 bigint(15) NOT NULL COMMENT '原价',
	CHANGE cost_price cost_price1 bigint(15) NOT NULL COMMENT '成本价/代理价',
	CHANGE sold_price sold_price1 bigint(15) NOT NULL COMMENT '销售价',
	CHANGE purchase_amount purchase_amount1 bigint(15) DEFAULT 0 COMMENT '申请采购数量';

-- 修改新字段名称
ALTER TABLE pe_shopping_cart_supplier_good 
	CHANGE original_price_temp0 original_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原价',
	CHANGE cost_price_temp0 cost_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价',
	CHANGE sold_price_temp0 sold_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价',
	CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量';




	
# 采购购物车收货地址表
ALTER TABLE `btsaas`.`pe_shopping_cart_address`
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量';
	
	
	

# 采购申请关联商品 
ALTER TABLE `btsaas`.`pe_purchasing_application_company_sku` 
	ADD `purchase_itemprice_temp0` decimal(28, 8) DEFAULT NULL COMMENT '采购价格' AFTER `purchase_itemprice`,
	ADD `purchase_amount_temp0` decimal(28, 8) DEFAULT 0 COMMENT '申请采购数量' AFTER `purchase_amount`,
	ADD `wait_purchase_amount_temp0` decimal(28, 8) DEFAULT 0 COMMENT '待采购数量' AFTER `wait_purchase_amount`,
	ADD `purchase_limit_amount_temp0` decimal(28, 8) DEFAULT 0 COMMENT '放量数' AFTER `purchase_limit_amount`,
	MODIFY `finish_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已完成采购数量';
	
-- 赋值
update pe_purchasing_application_company_sku ppacs set 
	ppacs.purchase_itemprice_temp0 = ppacs.purchase_itemprice/100,
	ppacs.purchase_amount_temp0 = ppacs.purchase_amount,
	ppacs.wait_purchase_amount_temp0 = ppacs.wait_purchase_amount,
	ppacs.purchase_limit_amount_temp0 = ppacs.purchase_limit_amount;

-- 修改老字段名称   
ALTER TABLE pe_purchasing_application_company_sku 
	CHANGE purchase_itemprice purchase_itemprice1 bigint(15) DEFAULT NULL COMMENT '采购价格 purchaseItemprice',
  CHANGE purchase_amount purchase_amount1 bigint(20) DEFAULT '0' COMMENT '申请采购数量',
  CHANGE wait_purchase_amount wait_purchase_amount1 bigint(20) DEFAULT '0' COMMENT '待采购数量',
  CHANGE purchase_limit_amount purchase_limit_amount1 bigint(9) DEFAULT '0' COMMENT '放量数';
 
-- 修改新字段名称
ALTER TABLE pe_purchasing_application_company_sku 
	CHANGE purchase_itemprice_temp0 purchase_itemprice decimal(28, 8) DEFAULT NULL COMMENT '采购价格',
	CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) DEFAULT 0 COMMENT '申请采购数量',
	CHANGE wait_purchase_amount_temp0 wait_purchase_amount decimal(28, 8) DEFAULT 0 COMMENT '待采购数量',
	CHANGE purchase_limit_amount_temp0 purchase_limit_amount decimal(28, 8) DEFAULT 0 COMMENT '放量数';





# 采购申请关联商品记录表   item_unit_price
ALTER TABLE `btsaas`.`pe_purchasing_application_company_sku_record` 
	ADD `item_unit_price_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价' AFTER `item_unit_price`,
	ADD `inventory_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存' AFTER `inventory`,
	ADD `purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请采购数量' AFTER `purchase_amount`,
	ADD `this_time_purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '本次采购数量' AFTER `this_time_purchase_amount`,
	ADD `wait_purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '待采购数量' AFTER `wait_purchase_amount`,
	ADD `purchase_limit_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '放量数' AFTER `purchase_limit_amount`;
	
	
-- 赋值
update pe_purchasing_application_company_sku_record ppacsr set 
	ppacsr.item_unit_price_temp0 = (CASE 
															WHEN ppacsr.item_unit_price = '' THEN 0.00000000 
															WHEN ppacsr.item_unit_price = 'NaN' THEN 0.00000000 
															ELSE ppacsr.item_unit_price/100 END),
	ppacsr.inventory_temp0 = ppacsr.inventory,
	ppacsr.purchase_amount_temp0 = ppacsr.purchase_amount,
	ppacsr.this_time_purchase_amount_temp0 = ppacsr.this_time_purchase_amount,
	ppacsr.wait_purchase_amount_temp0 = ppacsr.wait_purchase_amount,
	ppacsr.purchase_limit_amount_temp0 = ppacsr.purchase_limit_amount;

-- 修改老字段名称   
ALTER TABLE pe_purchasing_application_company_sku_record 
	CHANGE item_unit_price item_unit_price1 varchar(500) DEFAULT '' COMMENT '产品单价',
	CHANGE inventory inventory1 bigint(20) DEFAULT '0' COMMENT '库存',
	CHANGE purchase_amount purchase_amount1 bigint(20) DEFAULT '0' COMMENT '申请采购数量',
	CHANGE this_time_purchase_amount this_time_purchase_amount1 bigint(20) DEFAULT '0' COMMENT '本次采购数量',
	CHANGE wait_purchase_amount wait_purchase_amount1 bigint(20) DEFAULT '0' COMMENT '待采购数量',
	CHANGE purchase_limit_amount purchase_limit_amount1 bigint(9) DEFAULT '0' COMMENT '放量数';
	
-- 修改新字段名称
ALTER TABLE pe_purchasing_application_company_sku_record 
	CHANGE item_unit_price_temp0 item_unit_price decimal(28, 8) DEFAULT 0.00000000 COMMENT '产品单价',
	CHANGE inventory_temp0 inventory decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存',
	CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请采购数量',
	CHANGE this_time_purchase_amount_temp0 this_time_purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '本次采购数量',
	CHANGE wait_purchase_amount_temp0 wait_purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '待采购数量',
	CHANGE purchase_limit_amount_temp0 purchase_limit_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '放量数';




# 采购申请收货地址表
ALTER TABLE `btsaas`.`pe_purchasing_application_address` 
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量',
	MODIFY `wait_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '待采购数量',
	MODIFY `finish_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已完成采购数量',
	MODIFY `purchase_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数';
	
	
	
# 采购申请收货地址记录表
ALTER TABLE `btsaas`.`pe_purchasing_application_address_record` 
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量',
	MODIFY `wait_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '待采购数量',
	MODIFY `purchase_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数',
	MODIFY `this_time_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '本次采购数量';




# 采购申请关联产品待发货物料Sku(待采购清单表)
ALTER TABLE `btsaas`.`oe_material_company_sku`
	ADD `purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请采购数量' AFTER `purchase_amount`,
	ADD `purchase_itemprice_temp0` decimal(28, 8) DEFAULT NULL COMMENT '采购价格' AFTER `purchase_itemprice`,
	ADD `wait_send_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '待发货数量（发给线下供应商的商品）' AFTER `wait_send_amount`,
	ADD `purchase_limit_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数' AFTER `purchase_limit_amount`;
	
-- 赋值
update oe_material_company_sku omcs set 
	omcs.purchase_amount_temp0 = omcs.purchase_amount,
	omcs.purchase_itemprice_temp0 = omcs.purchase_itemprice/100,
	omcs.wait_send_amount_temp0 = omcs.wait_send_amount,
	omcs.purchase_limit_amount_temp0 = omcs.purchase_limit_amount;
	
-- 修改老字段名称   
ALTER TABLE oe_material_company_sku 
	CHANGE purchase_amount purchase_amount1 bigint(20) DEFAULT '0' COMMENT '申请采购数量',
	CHANGE purchase_itemprice purchase_itemprice1 bigint(15) DEFAULT NULL COMMENT '采购价格 purchaseItemprice',
	CHANGE wait_send_amount wait_send_amount1 bigint(20) DEFAULT '0' COMMENT '待发货数量（发给线下供应商的商品）',
	CHANGE purchase_limit_amount purchase_limit_amount1 bigint(9) NOT NULL DEFAULT '0' COMMENT '放量数';
	
-- 修改新字段名称
ALTER TABLE oe_material_company_sku 
	CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '申请采购数量',	
	CHANGE purchase_itemprice_temp0 purchase_itemprice decimal(28, 8) DEFAULT NULL COMMENT '采购价格',
	CHANGE wait_send_amount_temp0 wait_send_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '待发货数量（发给线下供应商的商品）' ,
	CHANGE purchase_limit_amount_temp0 purchase_limit_amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数';
	
	



# 采购订单商品表
ALTER TABLE `btsaas`.`pe_purchase_order_good`
	ADD `purchase_limit_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数' AFTER `purchase_limit_amount`,
	ADD `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `amount`,
	ADD `price_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `price_total`,
	ADD `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价' AFTER `unit_price`,
	ADD `wati_out_store_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待出库数量' AFTER `wati_out_store`,
	ADD `wati_in_store_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待入库数量' AFTER `wati_in_store`,
	ADD `wati_to_send_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待发货数量' AFTER `wati_to_send`,
	ADD `discount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣' AFTER `discount`,
	MODIFY `decimal_wait_out_store` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待出库数量',
	MODIFY `decimal_wait_in_store` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待入库数量',
	MODIFY `decimal_wati_to_send` decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待发货数量';
	
-- 赋值
update pe_purchase_order_good ppog set 
	ppog.purchase_limit_amount_temp0 = ppog.purchase_limit_amount,
  ppog.amount_temp0 = ppog.amount,
	ppog.price_total_temp0 = ppog.price_total/100,
	ppog.unit_price_temp0 = ppog.unit_price/100,
	ppog.wati_out_store_temp0 = ppog.wati_out_store,
	ppog.wati_in_store_temp0 = ppog.wati_in_store,
	ppog.wati_to_send_temp0 = ppog.wati_to_send,
	ppog.discount_temp0 = ppog.discount/100;
	
-- 修改老字段名称   
ALTER TABLE pe_purchase_order_good 
	CHANGE purchase_limit_amount purchase_limit_amount1 bigint(20) NOT NULL DEFAULT '0' COMMENT '放量数',
	CHANGE amount amount1 bigint(20) NOT NULL DEFAULT '0' COMMENT '订购产品数量',
	CHANGE price_total price_total1 bigint(20) NOT NULL DEFAULT '0' COMMENT '商品总价',
	CHANGE unit_price unit_price1  bigint(20) NOT NULL COMMENT '产品单价',
	CHANGE wati_out_store wati_out_store1  int(9) DEFAULT '0' COMMENT '等待出库数量',
	CHANGE wati_in_store wati_in_store1  bigint(9) DEFAULT '0' COMMENT '等待入库数量',
	CHANGE wati_to_send wati_to_send1  int(9) DEFAULT '0' COMMENT '等待发货数量',
	CHANGE discount discount1 int(9) DEFAULT '0';
	
-- 修改新字段名称
ALTER TABLE pe_purchase_order_good 
	CHANGE purchase_limit_amount_temp0 purchase_limit_amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数',
	CHANGE amount_temp0 amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	CHANGE price_total_temp0 price_total decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价',
	CHANGE unit_price_temp0 unit_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价',
	CHANGE wati_out_store_temp0 wati_out_store decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待出库数量',
	CHANGE wati_in_store_temp0 wati_in_store decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待入库数量',
	CHANGE wati_to_send_temp0 wati_to_send decimal(28, 8) DEFAULT 0.00000000 COMMENT '等待发货数量',
	CHANGE discount_temp0 discount decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣';
	
	
	
	
	
# 公司采购发票表模板
ALTER TABLE `btsaas`.`company_bill_template` 
	ADD `bill_money_temp0` decimal(28, 8) DEFAULT NULL COMMENT '发票金额' AFTER `bill_money`;
	
-- 赋值
update company_bill_template cbt set cbt.bill_money_temp0 = cbt.bill_money/100;	

-- 修改老字段名称   
ALTER TABLE company_bill_template CHANGE bill_money bill_money1 bigint(15) DEFAULT NULL;

-- 修改新字段名称
ALTER TABLE company_bill_template CHANGE bill_money_temp0 bill_money decimal(28, 8) DEFAULT NULL COMMENT '发票金额';




# 公司放量数设置表
ALTER TABLE `btsaas`.`pe_limit_setting` 
	MODIFY `purchase_limit` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数';
	
	
	
	

# 采购计划表，采购订单关联采购关联商品Sku表
ALTER TABLE `btsaas`.`pe_purchase_plan_application_company_sku` 
	ADD `purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '计划采购数量' AFTER `purchase_amount`;
	
-- 赋值
update pe_purchase_plan_application_company_sku pppacs set pppacs.purchase_amount_temp0 = pppacs.purchase_amount;	

-- 修改老字段名称   
ALTER TABLE pe_purchase_plan_application_company_sku CHANGE purchase_amount purchase_amount1 bigint(20) DEFAULT '0' COMMENT '计划采购数量';

-- 修改新字段名称
ALTER TABLE pe_purchase_plan_application_company_sku CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '计划采购数量';





# 线下供应商关联商品表
ALTER TABLE `btsaas`.`pe_purchase_plan_company_sku_supplier` 
	ADD `inventory_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存' AFTER `inventory`,
	ADD `unit_price_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '单价' AFTER `unit_price`,
	MODIFY `origin_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '初始价格',
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '采购数量';
	
-- 赋值
update pe_purchase_plan_company_sku_supplier pppcss set 
	pppcss.inventory_temp0 = pppcss.inventory,
	pppcss.unit_price_temp0 = (CASE 
															WHEN pppcss.unit_price = '' THEN 0.00000000 
															WHEN pppcss.unit_price = 'NaN' THEN 0.00000000 
															ELSE pppcss.unit_price/100 END);
																														
-- 修改老字段名称   
ALTER TABLE pe_purchase_plan_company_sku_supplier 
	CHANGE inventory inventory1 bigint(20) DEFAULT '0' COMMENT '库存',
	CHANGE unit_price unit_price1 varchar(500) DEFAULT '' COMMENT '单价';
	
-- 修改新字段名称
ALTER TABLE pe_purchase_plan_company_sku_supplier 
	CHANGE inventory_temp0 inventory decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存',
	CHANGE unit_price_temp0 unit_price decimal(28, 8) DEFAULT 0.00000000 COMMENT '单价';
	
	



# 线下供应商关联商品收货地址表
ALTER TABLE `btsaas`.`pe_purchase_plan_company_sku_supplier_address` 
	MODIFY `origin_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '原始采购数量',
	MODIFY `wait_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '待采购数量',
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '采购数量',
	MODIFY `purchase_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数',
	MODIFY `this_time_purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '本次采购数量';
	
	
	
	
# 线下供应商关联商品表
ALTER TABLE `btsaas`.`pe_company_sku_offline_supplier` 
	ADD `inventory_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存' AFTER `inventory`,
	ADD `unit_price_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '单价' AFTER `unit_price`;
	
-- 赋值
update pe_company_sku_offline_supplier pcsos set 
	pcsos.inventory_temp0 = pcsos.inventory,
	pcsos.unit_price_temp0 = (CASE 
															WHEN pcsos.unit_price = '' THEN 0.00000000 
															WHEN pcsos.unit_price = 'NaN' THEN 0.00000000 
															ELSE pcsos.unit_price/100 END);
															
-- 修改老字段名称   
ALTER TABLE pe_company_sku_offline_supplier 
	CHANGE inventory inventory1 bigint(20) DEFAULT '0' COMMENT '库存',
	CHANGE unit_price unit_price1 varchar(500) DEFAULT '' COMMENT '单价';
	
-- 修改新字段名称
ALTER TABLE pe_company_sku_offline_supplier 
	CHANGE inventory_temp0 inventory decimal(28, 8) DEFAULT 0.00000000 COMMENT '库存',
	CHANGE unit_price_temp0 unit_price decimal(28, 8) DEFAULT 0.00000000 COMMENT '单价';
	
	

															
															
# 线下供应商关联商品表历史记录
ALTER TABLE `btsaas`.`pe_company_sku_offline_supplier_history` 
	ADD `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价' AFTER `unit_price`,
	ADD `unit_price_history_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价（修改之前的）' AFTER `unit_price_history`;
	
-- 赋值
update pe_company_sku_offline_supplier_history pcsosh set 
	pcsosh.unit_price_temp0 = (CASE 
															WHEN pcsosh.unit_price = '' THEN 0.00000000 
															WHEN pcsosh.unit_price = 'NaN' THEN 0.00000000 
															ELSE pcsosh.unit_price/100 END),
	pcsosh.unit_price_history_temp0 = (CASE 
															WHEN pcsosh.unit_price_history = '' THEN 0.00000000 
															WHEN pcsosh.unit_price_history = 'NaN' THEN 0.00000000 
															ELSE pcsosh.unit_price_history/100 END);
	
-- 修改老字段名称   
ALTER TABLE pe_company_sku_offline_supplier_history 
	CHANGE unit_price unit_price1 varchar(500) NOT NULL DEFAULT '' COMMENT '单价',
	CHANGE unit_price_history unit_price_history1 varchar(500) NOT NULL DEFAULT '' COMMENT '单价（修改之前的）';
	
-- 修改新字段名称
ALTER TABLE pe_company_sku_offline_supplier_history 
	CHANGE unit_price_temp0 unit_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价',
	CHANGE unit_price_history_temp0 unit_price_history decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价（修改之前的）';
	
	
	
	
	
# 采购订单产品收货地址表
ALTER TABLE `btsaas`.`pe_purchase_order_good_address`
	MODIFY `price_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	MODIFY `purchase_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数',
	MODIFY `wati_out_store` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待出库数量',
	MODIFY `wati_in_store` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待入库数量',
	MODIFY `wati_to_send` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待发货数量',
	ADD `discount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣'  AFTER `discount`;
	
-- 赋值 未执行
update pe_purchase_order_good_address ppoga set 
	ppoga.price_total = ppoga.price_total/100,
	ppoga.unit_price = ppoga.unit_price/100,
	ppoga.discount_temp0 = ppoga.discount/100;		
	
-- 修改老字段名称   
ALTER TABLE pe_purchase_order_good_address 
	CHANGE discount discount1 int(9) DEFAULT '0';
	
-- 修改新字段名称
ALTER TABLE pe_purchase_order_good_address 
	CHANGE discount_temp0 discount decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣';
	
	
	
	
# 采购订单产品收货地址表发货历史记录
ALTER TABLE `btsaas`.`pe_purchase_order_good_address_history`
	MODIFY `price_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价',
	MODIFY `unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价',
	MODIFY `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	MODIFY `purchase_limit_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数',
	MODIFY `wati_out_store` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待出库数量',
	MODIFY `wati_in_store` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待入库数量',
	MODIFY `wati_to_send` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '等待发货数量',
	ADD `discount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣'  AFTER `discount`;
	
-- 赋值 未执行
update pe_purchase_order_good_address_history ppogah set 
	ppogah.price_total = ppogah.price_total/100,
	ppogah.unit_price = ppogah.unit_price/100,
	ppogah.discount_temp0 = ppogah.discount/100;	
	
-- 修改老字段名称   
ALTER TABLE pe_purchase_order_good_address_history 
	CHANGE discount discount1 int(9) DEFAULT '0';
	
-- 修改新字段名称
ALTER TABLE pe_purchase_order_good_address_history 
	CHANGE discount_temp0 discount decimal(28, 8) DEFAULT 0.00000000 COMMENT '折扣';


	



# 采购订单商品关联采购申请
ALTER TABLE `btsaas`.`pe_purchase_order_good_application`
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量',
	ADD `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量'  AFTER `amount`,
	ADD `purchase_limit_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数'  AFTER `purchase_limit_amount`;
	
-- 赋值
update pe_purchase_order_good_application ppogapp set 
	ppogapp.amount_temp0 = ppogapp.amount,
	ppogapp.purchase_limit_amount_temp0 = ppogapp.purchase_limit_amount;

-- 修改老字段名称   
ALTER TABLE pe_purchase_order_good_application 
	CHANGE amount amount1 bigint(20) NOT NULL COMMENT '订购产品数量',
	CHANGE purchase_limit_amount purchase_limit_amount1 bigint(20) NOT NULL COMMENT '放量数';
	
-- 修改新字段名称
ALTER TABLE pe_purchase_order_good_application 
	CHANGE amount_temp0 amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	CHANGE purchase_limit_amount_temp0 purchase_limit_amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '放量数';
	
	



# 采购销售订单
ALTER TABLE `btsaas`.`pe_order_main` 
	ADD `product_count_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `product_count`,
	ADD `product_amount_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `product_amount_total`,
	ADD `order_amount_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订单金额' AFTER `order_amount_total`,
	ADD `logistics_fee_temp0` decimal(28, 8) DEFAULT NULL COMMENT '运费金额' AFTER `logistics_fee`,
	ADD `scored_money_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价' AFTER `scored_money`,
	ADD `coupon_money_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价' AFTER `coupon_money`;
	
-- 赋值
update pe_order_main pom set 
	pom.product_count_temp0 = pom.product_count,
	pom.product_amount_total_temp0 = pom.product_amount_total/100,
	pom.order_amount_total_temp0 = pom.order_amount_total/100,
	pom.logistics_fee_temp0 = pom.logistics_fee/100,
	pom.scored_money_temp0 = pom.scored_money/100,
	pom.coupon_money_temp0 = pom.coupon_money/100;	

-- 修改老字段名称   
ALTER TABLE pe_order_main 
	CHANGE product_count product_count1 int(9) NOT NULL COMMENT '订购产品数量',
	CHANGE product_amount_total product_amount_total1 bigint(20) NOT NULL COMMENT '商品总价',
	CHANGE order_amount_total order_amount_total1 bigint(20) NOT NULL COMMENT '订单金额',
	CHANGE logistics_fee logistics_fee1 int(9) DEFAULT NULL COMMENT '运费金额',
	CHANGE scored_money scored_money1 bigint(20) DEFAULT '0' COMMENT '积分抵扣钱数',
	CHANGE coupon_money coupon_money1 bigint(20) DEFAULT '0' COMMENT '积分抵扣钱数';
	
-- 修改新字段名称
ALTER TABLE pe_order_main 
	CHANGE product_count_temp0 product_count decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	CHANGE product_amount_total_temp0 product_amount_total decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价',
	CHANGE order_amount_total_temp0 order_amount_total decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订单金额',
	CHANGE logistics_fee_temp0 logistics_fee decimal(28, 8) DEFAULT NULL COMMENT '运费金额',
	CHANGE scored_money_temp0 scored_money decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价',
	CHANGE coupon_money_temp0 coupon_money decimal(28, 8) DEFAULT 0.00000000 COMMENT '商品总价';






# 确认物流信息时发票快照
ALTER TABLE `btsaas`.`pe_purchase_order_bill_template` 
	ADD `bill_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发票金额' AFTER `bill_money`;
	
-- 赋值
update pe_purchase_order_bill_template ppobt set ppobt.bill_money_temp0 = ppobt.bill_money/100;

-- 修改老字段名称   
ALTER TABLE pe_purchase_order_bill_template 
	CHANGE bill_money bill_money1 bigint(15) DEFAULT NULL;
	
-- 修改新字段名称
ALTER TABLE pe_purchase_order_bill_template 
	CHANGE bill_money_temp0 bill_money decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发票金额';
	
	
	
	
	
	
# 委外订单相关联的物料
ALTER TABLE `btsaas`.`oe_order_material` 
	ADD `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `amount`,
	ADD `price_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `price_total`,
	ADD `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价' AFTER `unit_price`,
	ADD `wait_out_store_temp0` decimal(28, 8) DEFAULT NULL COMMENT '等待出库数量' AFTER `wait_out_store`,
	ADD `wait_to_send_temp0` decimal(28, 8) DEFAULT NULL COMMENT '等待发货数量' AFTER `wait_to_send`;
	
-- 赋值
update oe_order_material oom set 
	oom.amount_temp0 = oom.amount,
	oom.price_total_temp0 = oom.price_total/100,
	oom.unit_price_temp0 = oom.unit_price/100,
	oom.wait_out_store_temp0 = oom.wait_out_store,
	oom.wait_to_send_temp0 = oom.wait_to_send;

-- 修改老字段名称   
ALTER TABLE oe_order_material 
	CHANGE amount amount1  bigint(20) NOT NULL DEFAULT '0' COMMENT '订购产品数量',
	CHANGE price_total price_total1 bigint(20) NOT NULL DEFAULT '0' COMMENT '商品总价',
	CHANGE unit_price unit_price1 bigint(20) NOT NULL DEFAULT '0' COMMENT '产品单价',
	CHANGE wait_out_store wait_out_store1 bigint(20) DEFAULT NULL COMMENT '等待出库数量',
	CHANGE wait_to_send wait_to_send1 bigint(20) DEFAULT NULL COMMENT '等待发货数量';
	
-- 修改新字段名称
ALTER TABLE oe_order_material 
	CHANGE amount_temp0 amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量',
	CHANGE price_total_temp0 price_total decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价',
	CHANGE unit_price_temp0 unit_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品单价',
	CHANGE wait_out_store_temp0 wait_out_store decimal(28, 8) DEFAULT NULL COMMENT '等待出库数量',
	CHANGE wait_to_send_temp0 wait_to_send decimal(28, 8) DEFAULT NULL COMMENT '等待发货数量';




# 采购计划表，采购订单关联采购关联物料Sku表
ALTER TABLE `btsaas`.`oe_plan_material_company_sku` 
	ADD `purchase_amount_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '计划发货物料数量' AFTER `purchase_amount`;
	
-- 赋值
update oe_plan_material_company_sku opmcs set opmcs.purchase_amount_temp0 = opmcs.purchase_amount;

-- 修改老字段名称   
ALTER TABLE oe_plan_material_company_sku 
	CHANGE purchase_amount purchase_amount1 bigint(20) DEFAULT '0' COMMENT '计划发货物料数量';
	
-- 修改新字段名称
ALTER TABLE oe_plan_material_company_sku 
	CHANGE purchase_amount_temp0 purchase_amount decimal(28, 8) DEFAULT 0.00000000 COMMENT '计划发货物料数量';





# 采购订单购物车供应商产品
ALTER TABLE `btsaas`.`pe_order_shopping_car_supplier_good` 
	MODIFY `unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购单价',
	MODIFY `total_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购总价',
	MODIFY `cost_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价',
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量';
	
-- 赋值
update pe_order_shopping_car_supplier_good poscsg set poscsg.cost_price = poscsg.cost_price/100;






# 采购订单购物车收货地址信息
ALTER TABLE `btsaas`.`pe_order_shopping_car_address` 
	MODIFY `purchase_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请采购数量';






# 采购订单产品表
ALTER TABLE `btsaas`.`pe_order_product` 
	ADD `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量' AFTER `amount`,
	ADD `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价' AFTER `unit_price`,
	ADD `discount_temp0` decimal(28, 8) DEFAULT NULL COMMENT '折扣' AFTER `discount`,
	ADD `delivery_total_temp0` decimal(28, 8) DEFAULT NULL COMMENT '出库数量' AFTER `delivery_total`,
	MODIFY `decimal_delivery_total` decimal(28, 8) DEFAULT NULL COMMENT '出库数量',
	MODIFY `actual_quantity_delivered` decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量（决定待入库数量~decimal_stock_pending_total）',
	MODIFY `decimal_stock_pending_total` decimal(28, 8) DEFAULT 0.00000000 COMMENT '待入库数量',
	MODIFY `inout_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已入库数量';

-- 赋值
update pe_order_product pop set 
	pop.amount_temp0 = pop.amount,
	pop.unit_price_temp0 = pop.unit_price/100,
	pop.discount_temp0 = pop.discount/100,
	pop.delivery_total_temp0 = pop.delivery_total;

-- 修改老字段名称   
ALTER TABLE pe_order_product 
	CHANGE amount amount1 int(9) NOT NULL COMMENT '订购数量',
	CHANGE unit_price unit_price1  bigint(20) NOT NULL COMMENT '单价',
	CHANGE discount discount1 int(9) DEFAULT NULL COMMENT '折扣',
	CHANGE delivery_total delivery_total1 int(9) DEFAULT NULL COMMENT '出库数量';
	
-- 修改新字段名称
ALTER TABLE pe_order_product 
	CHANGE amount_temp0 amount decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量',
	CHANGE unit_price_temp0 unit_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价',
	CHANGE discount_temp0 discount decimal(28, 8) DEFAULT NULL COMMENT '折扣',
	CHANGE delivery_total_temp0 delivery_total decimal(28, 8) DEFAULT NULL COMMENT '出库数量';
	
	
	
	
	
	
# 采购产品验收结果
ALTER TABLE `btsaas`.`pe_order_product_check_result` 
	ADD `actual_delivered_quantity_temp0` decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量' AFTER `actual_delivered_quantity`,
	ADD `actual_delivered_quantity_editable_temp0` decimal(28, 8) DEFAULT NULL COMMENT '可编辑实际到货数量' AFTER `actual_delivered_quantity_editable`,
	ADD `qualified_quantity_temp0` decimal(28, 8) DEFAULT NULL COMMENT '合格数量' AFTER `qualified_quantity`,
	ADD `qualified_quantity_editable_temp0` decimal(28, 8) DEFAULT NULL COMMENT '可编辑合格数量' AFTER `qualified_quantity_editable`,
	ADD `unqualified_quantity_temp0` decimal(28, 8) DEFAULT NULL COMMENT '不合格数量' AFTER `unqualified_quantity`,
	ADD `unqualified_quantity_editable_temp0` decimal(28, 8) DEFAULT NULL COMMENT '可编辑不合格数量' AFTER `unqualified_quantity_editable`,
	ADD `acceptable_quantity_temp0` decimal(28, 8) DEFAULT 0.00000000 COMMENT '可让价数量（可让价数量≤不合格数量）' AFTER `acceptable_quantity`;
	
-- 赋值
update pe_order_product_check_result popcr set 
	popcr.actual_delivered_quantity_temp0 = popcr.actual_delivered_quantity,
	popcr.actual_delivered_quantity_editable_temp0 = popcr.actual_delivered_quantity_editable,
	popcr.qualified_quantity_temp0 = popcr.qualified_quantity,
	popcr.qualified_quantity_editable_temp0 = popcr.qualified_quantity_editable,
	popcr.unqualified_quantity_temp0 = popcr.unqualified_quantity,
	popcr.unqualified_quantity_editable_temp0 = popcr.unqualified_quantity_editable,
	popcr.acceptable_quantity_temp0 = popcr.acceptable_quantity;

-- 修改老字段名称   
ALTER TABLE pe_order_product_check_result 
	CHANGE actual_delivered_quantity actual_delivered_quantity1 bigint(20) DEFAULT NULL COMMENT '实际到货数量',
	CHANGE actual_delivered_quantity_editable actual_delivered_quantity_editable1 bigint(20) DEFAULT NULL COMMENT '可编辑实际到货数量',
	CHANGE qualified_quantity qualified_quantity1 bigint(20) DEFAULT NULL COMMENT '合格数量',
	CHANGE qualified_quantity_editable qualified_quantity_editable1 bigint(20) DEFAULT NULL COMMENT '可编辑合格数量',
	CHANGE unqualified_quantity unqualified_quantity1 bigint(20) DEFAULT NULL COMMENT '不合格数量',
	CHANGE unqualified_quantity_editable unqualified_quantity_editable1 bigint(20) DEFAULT NULL COMMENT '可编辑不合格数量',
	CHANGE acceptable_quantity acceptable_quantity1 bigint(20) DEFAULT '0' COMMENT '可让价数量（可让价数量≤不合格数量）';
	
-- 修改新字段名称
ALTER TABLE pe_order_product_check_result 
	CHANGE actual_delivered_quantity_temp0 actual_delivered_quantity decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量',
	CHANGE actual_delivered_quantity_editable_temp0 actual_delivered_quantity_editable decimal(28, 8) DEFAULT NULL COMMENT '可编辑实际到货数量',
	CHANGE qualified_quantity_temp0 qualified_quantity decimal(28, 8) DEFAULT NULL COMMENT '合格数量',
	CHANGE qualified_quantity_editable_temp0 qualified_quantity_editable decimal(28, 8) DEFAULT NULL COMMENT '可编辑合格数量',
	CHANGE unqualified_quantity_temp0 unqualified_quantity decimal(28, 8) DEFAULT NULL COMMENT '不合格数量',
	CHANGE unqualified_quantity_editable_temp0 unqualified_quantity_editable decimal(28, 8) DEFAULT NULL COMMENT '可编辑不合格数量',
	CHANGE acceptable_quantity_temp0 acceptable_quantity decimal(28, 8) DEFAULT 0.00000000 COMMENT '可让价数量（可让价数量≤不合格数量）';





# 3005_公司出入库管理表
ALTER TABLE `btsaas`.`company_storehouse_inout` 
	MODIFY `processing_charges` decimal(28, 8) DEFAULT NULL COMMENT '加工费';
	



# 采购订单产品表
ALTER TABLE `btsaas`.`pe_actual_quantity_delivered_record` 
	ADD `to_send_goods_temp0` decimal(28, 8) DEFAULT NULL COMMENT '待发货变动记录' AFTER `to_send_goods`,
	ADD `to_send_goods_change_temp0` decimal(28, 8) DEFAULT NULL COMMENT '待发货变动记录' AFTER `to_send_goods_change`,
	ADD `decimal_delivery_total_temp0` decimal(28, 8) DEFAULT NULL COMMENT '计划到货数量' AFTER `decimal_delivery_total`,
	ADD `actual_quantity_delivered_temp0` decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量（决定待入库数量~decimal_stock_pending_total）' AFTER `actual_quantity_delivered`,
	ADD `actual_plan_change_temp0` decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量比较与计划的数量' AFTER `actual_plan_change`;
	
-- 赋值
update pe_actual_quantity_delivered_record paqdr set 
	paqdr.to_send_goods_temp0 = paqdr.to_send_goods,
	paqdr.to_send_goods_change_temp0 = paqdr.to_send_goods_change,
	paqdr.decimal_delivery_total_temp0 = paqdr.decimal_delivery_total,
	paqdr.actual_quantity_delivered_temp0 = paqdr.actual_quantity_delivered,
	paqdr.actual_plan_change_temp0 = paqdr.actual_plan_change;

-- 修改老字段名称   
ALTER TABLE pe_actual_quantity_delivered_record 
	CHANGE to_send_goods to_send_goods1 bigint(20) DEFAULT NULL COMMENT '待发货变动记录',
	CHANGE to_send_goods_change to_send_goods_change1 bigint(20) DEFAULT NULL COMMENT '待发货变动记录',
	CHANGE decimal_delivery_total decimal_delivery_total1 bigint(20) DEFAULT NULL COMMENT '计划到货数量',
	CHANGE actual_quantity_delivered actual_quantity_delivered1 bigint(20) DEFAULT NULL COMMENT '实际到货数量（决定待入库数量~decimal_stock_pending_total）',
	CHANGE actual_plan_change actual_plan_change1 bigint(20) DEFAULT NULL COMMENT '实际到货数量比较与计划的数量';
	
-- 修改新字段名称
ALTER TABLE pe_actual_quantity_delivered_record 
	CHANGE to_send_goods_temp0 to_send_goods decimal(28, 8) DEFAULT NULL COMMENT '待发货变动记录',
	CHANGE to_send_goods_change_temp0 to_send_goods_change decimal(28, 8) DEFAULT NULL COMMENT '待发货变动记录',
	CHANGE decimal_delivery_total_temp0 decimal_delivery_total decimal(28, 8) DEFAULT NULL COMMENT '计划到货数量',
	CHANGE actual_quantity_delivered_temp0 actual_quantity_delivered decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量（决定待入库数量~decimal_stock_pending_total）',
	CHANGE actual_plan_change_temp0 actual_plan_change decimal(28, 8) DEFAULT NULL COMMENT '实际到货数量比较与计划的数量';





# 3009_公司采购等待入库表
ALTER TABLE `btsaas`.`company_purchase_wait_storehouse` 
	ADD `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品单价' AFTER `unit_price`,
	ADD `wait_storehouse_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '待入库数量' AFTER `wait_storehouse_num`,
	ADD `in_storehouse_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已入库数量' AFTER `in_storehouse_num`;
	
-- 赋值
update company_purchase_wait_storehouse cpws set 
	cpws.unit_price_temp0 = cpws.unit_price/100,
	cpws.wait_storehouse_num_temp0 = cpws.wait_storehouse_num,
	cpws.in_storehouse_num_temp0 = cpws.in_storehouse_num;
	
-- 修改老字段名称   
ALTER TABLE company_purchase_wait_storehouse 
	CHANGE unit_price unit_price1 bigint(15) NOT NULL DEFAULT '0' COMMENT '商品单价',
	CHANGE wait_storehouse_num wait_storehouse_num1 int(9) NOT NULL DEFAULT '0' COMMENT '待入库数量',
	CHANGE in_storehouse_num in_storehouse_num1 int(9) NOT NULL DEFAULT '0' COMMENT '已入库数量';
	
-- 修改新字段名称
ALTER TABLE company_purchase_wait_storehouse 
	CHANGE unit_price_temp0 unit_price decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品单价',
	CHANGE wait_storehouse_num_temp0 wait_storehouse_num decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '待入库数量',
	CHANGE in_storehouse_num_temp0 in_storehouse_num decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已入库数量';






# 线下供应商已完成订单商品价格变动关联商品
ALTER TABLE `btsaas`.`pe_pop_price_change` 
	ADD `total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '总价' AFTER `total`,
	ADD `discounts_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '折扣' AFTER `discounts`;
	
-- 赋值
update pe_pop_price_change pppc set 
	pppc.total_temp0 = (CASE 
													WHEN pppc.total = '' THEN 0.00000000 
													WHEN pppc.total = 'NaN' THEN 0.00000000 
													ELSE pppc.total END),
	pppc.discounts_temp0 = (CASE 
													WHEN pppc.discounts = '' THEN 0.00000000 
													WHEN pppc.discounts = 'NaN' THEN 0.00000000 
													ELSE pppc.discounts END);

-- 修改老字段名称   
ALTER TABLE pe_pop_price_change 
	CHANGE total total1 varchar(1000) NOT NULL DEFAULT '0' COMMENT '总价',
	CHANGE discounts discounts1 varchar(1000) NOT NULL DEFAULT '0' COMMENT '折扣';
	
	
-- 修改新字段名称
ALTER TABLE pe_pop_price_change 
	CHANGE total_temp0 total decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '总价',
	CHANGE discounts_temp0 discounts decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '折扣';







# 采购 发票付款记录 与 企业支付company_pay_record关联表
ALTER TABLE `btsaas`.`pe_payment_record` 
	ADD `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '付款金额' AFTER `money`;
	
-- 赋值
update pe_payment_record ppr set ppr.money_temp0 = ppr.money/100;

-- 修改老字段名称   
ALTER TABLE pe_payment_record 
	CHANGE money money1 bigint(20) NOT NULL DEFAULT 0.00000000 COMMENT '付款金额';
	
-- 修改新字段名称
ALTER TABLE pe_payment_record 
	CHANGE money_temp0 money decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '付款金额';
	
	









