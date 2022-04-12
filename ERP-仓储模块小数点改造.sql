/**
 * ERP-仓储模块小数点改造
 */
 
#################################################################仓储

# company_storehouse_inout_item
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_inout_item` 
	ADD COLUMN `inout_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出入库价格' AFTER `inout_price`,
	ADD COLUMN `sum_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出入库总价,可以为空' AFTER `sum_price`,
	ADD COLUMN `sold_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`,
	ADD COLUMN `num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	MODIFY COLUMN `processing_unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `num`;
	MODIFY COLUMN `decimal_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `processing_unit_price`,
	MODIFY COLUMN `storehouse_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '仓库库存' AFTER `item_type`,
	MODIFY COLUMN `marketability_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '可销售库存' AFTER `storehouse_num`;
	

-- 赋值新字段
update company_storehouse_inout_item csii set csii.num_temp0 = 
	(CASE
		WHEN csii.num IS NULL THEN
			0.00000000
		ELSE
			csii.num
	END);

	update company_storehouse_inout_item csii set csii.processing_unit_price = 
	(CASE
		WHEN csii.processing_unit_price IS NULL THEN
			0.00000000
		ELSE
			csii.processing_unit_price
	END);

	update company_storehouse_inout_item csii set csii.inout_price_temp0 = 
	(CASE
		WHEN csii.inout_price IS NULL THEN
			0.00000000
		ELSE
			(csii.inout_price / 100)
	END);

	update company_storehouse_inout_item csii set csii.sum_price_temp0 = 
	(CASE
		WHEN csii.sum_price IS NULL THEN
			0.00000000
		ELSE
			(csii.sum_price / 100)
	END);

	update company_storehouse_inout_item csii set csii.sold_price_temp0 = 
	(CASE
		WHEN csii.sold_price IS NULL THEN
			0.00000000
		ELSE
			(csii.sold_price / 100)
	END);

	update company_storehouse_inout_item csii set csii.storehouse_num = 
	(CASE
		WHEN csii.storehouse_num IS NULL THEN
			0.00000000
		ELSE
			csii.storehouse_num
	END);

	update company_storehouse_inout_item csii set csii.marketability_num = 
	(CASE
		WHEN csii.marketability_num IS NULL THEN
			0.00000000
		ELSE
			csii.marketability_num
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_storehouse_inout_item` 
	CHANGE COLUMN `inout_price` `inout_price1` bigint(15) NULL AFTER `decimal_num`,
	CHANGE COLUMN `sum_price` `sum_price1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出入库总价,可以为空' AFTER `inout_price`,
	CHANGE COLUMN `sold_price` `sold_price1` bigint(15) NULL DEFAULT NULL AFTER `min_unit_name`,
	CHANGE COLUMN `num` `num1` int(9) NULL AFTER `sku_id`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_storehouse_inout_item` 
	CHANGE COLUMN `inout_price_temp0` `inout_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出入库价格' AFTER `inout_price1`,
	CHANGE COLUMN `sum_price_temp0` `sum_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出入库总价,可以为空' AFTER `sum_price1`,
	CHANGE COLUMN `sold_price_temp0` `sold_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price1`;
	CHANGE COLUMN `num_temp0` `num` int(9) NULL AFTER `sku_id`,





# company_storehouse_item
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_item` 
	MODIFY COLUMN `decimal_inventory` decimal(28, 8) UNSIGNED NULL DEFAULT 0.00000000 AFTER `inventory`,
	ADD COLUMN `inventory_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存上限' AFTER `inventory_upper_limit`,
	ADD COLUMN `inventory_upper_limit_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存上限' AFTER `inventory_upper_limit`,
	ADD COLUMN `inventory_lower_limit_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存下限' AFTER `inventory_lower_limit`;

-- 赋值新字段
update company_storehouse_item csi set csi.inventory_temp0 = 
	(CASE
		WHEN csi.inventory IS NULL THEN
			0.00000000
		ELSE
			csi.inventory
	END);

	update company_storehouse_item csi set csi.inventory_upper_limit_temp0 = 
	(CASE
		WHEN csi.inventory_upper_limit IS NULL THEN
			0.00000000
		ELSE
			csi.inventory_upper_limit
	END);

	update company_storehouse_item csi set csi.inventory_lower_limit_temp0 = 
	(CASE
		WHEN csi.inventory_lower_limit IS NULL THEN
			0.00000000
		ELSE
			csi.inventory_lower_limit
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_storehouse_item` 
CHANGE COLUMN `inventory` `inventory1` int(9) NULL DEFAULT 0 COMMENT '库存',
CHANGE COLUMN `inventory_upper_limit` `inventory_upper_limit1` int(9) NULL DEFAULT 0 COMMENT '库存上限',
CHANGE COLUMN `inventory_lower_limit` `inventory_upper_limit1` int(9) NULL DEFAULT 0 COMMENT '库存上限' ;

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_storehouse_item` 
CHANGE COLUMN `inventory_temp0` `inventory_temp` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存',
CHANGE COLUMN `inventory_upper_limit_temp0` `inventory_upper_limit` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存上限',
CHANGE COLUMN `inventory_lower_limit_temp0` `inventory_lower_limit` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存下限';



<!---缺失----->
# order_product
-- 新增字段
ALTER TABLE `btsaas`.`order_product` 
MODIFY COLUMN `decimal_delivery_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出库数量' AFTER `delivery_total`,
ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量' AFTER `amount`;

-- 赋值新字段
update order_product op set op.amount_temp0 = 
(CASE
	WHEN op.amount IS NULL THEN
		0.00000000
	ELSE
		op.amount
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_product` 
CHANGE COLUMN `amount` `amount1` int(9) NULL COMMENT '订购数量';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_product` 
CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量';




# logistics_scheduling
-- 新增字段
ALTER TABLE `btsaas`.`logistics_scheduling` 
	MODIFY COLUMN `freight_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '运费价格' AFTER `order_id`;


-- 赋值新字段
update logistics_scheduling ls set ls.freight_price = 
	(CASE
		WHEN ls.freight_price IS NULL THEN
			0.00000000
		ELSE
			ls.freight_price
	END);




# oe_wait_send_inout_material
-- 新增字段
ALTER TABLE `btsaas`.`oe_wait_send_inout_material` 
	ADD COLUMN `unit_pricee_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发货数量' AFTER `unit_pricee`,
	ADD COLUMN `wait_to_sende_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发货数量' AFTER `wait_to_sende`,
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发货数量' AFTER `amount`,
	ADD COLUMN `all_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '当前出库单下这种物料的总价（包含所有批次号）' AFTER `all_price`;

-- 赋值新字段
update oe_wait_send_inout_material owsim set owsim.amount_temp0 = 
(CASE
	WHEN owsim.amount IS NULL THEN
		0.00000000
	ELSE
		owsim.amount
END);

update oe_wait_send_inout_material owsim set owsim.all_price_temp0 = 
(CASE
	WHEN owsim.all_price IS NULL THEN
		0.00000000
	ELSE
		(owsim.all_price / 100)
END);

update oe_wait_send_inout_material owsim set owsim.unit_pricee_temp0 = 
(CASE
	WHEN owsim.unit_price IS NULL THEN
		0.00000000
	ELSE
		(owsim.unit_price / 100)
END);

update oe_wait_send_inout_material owsim set owsim.wait_to_sende_temp0 = 
(CASE
	WHEN owsim.wait_to_send IS NULL THEN
		0.00000000
	ELSE
		owsim.wait_to_send
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`oe_wait_send_inout_material` 
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20) NULL DEFAULT 0,
	CHANGE COLUMN `wait_to_send` `wait_to_send1` bigint(20) NULL DEFAULT 0,
	CHANGE COLUMN `amount` `amount1` bigint(20) NULL DEFAULT 0 COMMENT '发货数量',
	CHANGE COLUMN `all_price` `all_price1` bigint(20) NULL DEFAULT 0 COMMENT '当前出库单下这种物料的总价（包含所有批次号）' ;

-- 修改新字段名称
ALTER TABLE `btsaas`.`oe_wait_send_inout_material` 
	CHANGE COLUMN `unit_price_temp0` `unit_price` bigint(20) NULL DEFAULT 0,
	CHANGE COLUMN `wait_to_send_temp0` `wait_to_send` bigint(20) NULL DEFAULT 0,
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '发货数量',
	CHANGE COLUMN `all_price_temp0` `all_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '当前出库单下这种物料的总价（包含所有批次号）';




# company_storehouse_check_temp
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_check_temp` 
	ADD COLUMN `total_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '盘点总量' AFTER `total_num`,
	ADD COLUMN `practical_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已盘点数量' AFTER `practical_num`,
	ADD COLUMN `remain_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未盘点数量' AFTER `remain_num`;

-- 赋值新字段
update company_storehouse_check_temp csct set csct.total_num_temp0 = 
	(CASE
		WHEN csct.total_num IS NULL THEN
			0.00000000
		ELSE
			csct.total_num
	END);

	update company_storehouse_check_temp csct set csct.practical_num_temp0 = 
	(CASE
		WHEN csct.practical_num IS NULL THEN
			0.00000000
		ELSE
			csct.practical_num
	END);

	update company_storehouse_check_temp csct set csct.remain_num_temp0 = 
	(CASE
		WHEN csct.remain_num IS NULL THEN
			0.00000000
		ELSE
			csct.remain_num
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_storehouse_check_temp` 
	CHANGE COLUMN `total_num` `total_num1` int(11) NULL DEFAULT NULL COMMENT '盘点总量',
	CHANGE COLUMN `practical_num` `practical_num1` int(11) NULL DEFAULT NULL COMMENT '已盘点数量',
	CHANGE COLUMN `remain_num` `remain_num1` int(11) NULL DEFAULT NULL COMMENT '未盘点数量';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_storehouse_check_temp` 
	CHANGE COLUMN `total_num_temp0` `total_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '盘点总量',
	CHANGE COLUMN `practical_num_temp0` `practical_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '已盘点数量',
	CHANGE COLUMN `remain_num_temp0` `remain_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未盘点数量';




# company_storehouse_check_item
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_check_item` 
	MODIFY COLUMN `product_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '盘亏/盘盈价格' AFTER `min_unit_name`,
	MODIFY COLUMN `product_sum_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '仓库商品总价' AFTER `product_price`,
	MODIFY COLUMN `decimal_inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '统计时库存' AFTER `product_sum_price`,
	MODIFY COLUMN `history_decimal_inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '历史库存' AFTER `decimal_inventory`,
	MODIFY COLUMN `practical_decimal_inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '实际统计库存' AFTER `history_decimal_inventory`,
	MODIFY COLUMN `surplus_decimal_inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '相差库存' AFTER `practical_decimal_inventory`;

-- 赋值新字段
update company_storehouse_check_item csci set csci.product_price = 
	(CASE
		WHEN csci.product_price IS NULL THEN
			0.00000000
		ELSE
			csci.product_price
	END);

	update company_storehouse_check_item csci set csci.product_sum_price = 
	(CASE
		WHEN csci.product_sum_price IS NULL THEN
			0.00000000
		ELSE
			csci.product_sum_price
	END);

	update company_storehouse_check_item csci set csci.decimal_inventory = 
	(CASE
		WHEN csci.decimal_inventory IS NULL THEN
			0.00000000
		ELSE
			csci.decimal_inventory
	END);

	update company_storehouse_check_item csci set csci.history_decimal_inventory = 
	(CASE
		WHEN csci.history_decimal_inventory IS NULL THEN
			0.00000000
		ELSE
			csci.history_decimal_inventory
	END);

	update company_storehouse_check_item csci set csci.practical_decimal_inventory = 
	(CASE
		WHEN csci.practical_decimal_inventory IS NULL THEN
			0.00000000
		ELSE
			csci.practical_decimal_inventory
	END);

	update company_storehouse_check_item csci set csci.surplus_decimal_inventory = 
	(CASE
		WHEN csci.surplus_decimal_inventory IS NULL THEN
			0.00000000
		ELSE
			csci.surplus_decimal_inventory
	END);




# company_storehouse_check_item_temp
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_check_item_temp` 
	MODIFY COLUMN `history_decimal_inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存数量' AFTER `min_unit_name`,
	MODIFY COLUMN `product_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '仓库商品单价' AFTER `storehouse_name`,
	MODIFY COLUMN `product_sum_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '仓库商品总价' AFTER `product_price`,
	MODIFY COLUMN `inventory_surplus_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '盘亏/盈余数量' AFTER `product_sum_price`,
	MODIFY COLUMN `inventory_practical_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '盘点数量(实际库存数量)' AFTER `inventory_surplus_num`;

-- 赋值新字段
update company_storehouse_check_item_temp cscit set cscit.history_decimal_inventory = 
(CASE
	WHEN cscit.history_decimal_inventory IS NULL THEN
		0.00000000
	ELSE
		cscit.history_decimal_inventory
END);

update company_storehouse_check_item_temp cscit set cscit.product_price = 
(CASE
	WHEN cscit.product_price IS NULL THEN
		0.00000000
	ELSE
		cscit.product_price
END);

update company_storehouse_check_item_temp cscit set cscit.product_sum_price = 
(CASE
	WHEN cscit.product_sum_price IS NULL THEN
		0.00000000
	ELSE
		cscit.product_sum_price
END);

update company_storehouse_check_item_temp cscit set cscit.inventory_surplus_num = 
(CASE
	WHEN cscit.inventory_surplus_num IS NULL THEN
		0.00000000
	ELSE
		cscit.inventory_surplus_num
END);

update company_storehouse_check_item_temp cscit set cscit.inventory_practical_num = 
(CASE
	WHEN cscit.inventory_practical_num IS NULL THEN
		0.00000000
	ELSE
		cscit.inventory_practical_num
END);




# company_storehouse_allocation_item
-- 新增字段
ALTER TABLE `btsaas`.`company_storehouse_allocation_item` 
	ADD COLUMN `num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '调拨数量' AFTER `num`,
	ADD COLUMN `item_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价' AFTER `item_price`,
	ADD COLUMN `sold_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`;


-- 赋值新字段
update company_storehouse_allocation_item csai set csai.num_temp0 = 
	(CASE
		WHEN csai.num IS NULL THEN
			0.00000000
		ELSE
			csai.num
	END);

	update company_storehouse_allocation_item csai set csai.item_price_temp0 = 
	(CASE
		WHEN csai.item_price IS NULL THEN
			0.00000000
		ELSE
			(csai.item_price / 100)
	END);

	update company_storehouse_allocation_item csai set csai.sold_price_temp0 = 
	(CASE
		WHEN csai.sold_price_temp0 IS NULL THEN
			0.00000000
		ELSE
			(csai.sold_price / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_storehouse_allocation_item` 
	CHANGE COLUMN `num` `num1` int(9) NULL COMMENT '数量',
	CHANGE COLUMN `item_price` `item_price1` bigint(15) NULL COMMENT '价格',
	CHANGE COLUMN `sold_price` `sold_price1` bigint(15) NULL DEFAULT NULL COMMENT '销售价';


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_storehouse_allocation_item` 
	CHANGE COLUMN `num_temp0` `num` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '数量',
	CHANGE COLUMN `item_price_temp0` `item_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '价格',
	CHANGE COLUMN `sold_price_temp0` `sold_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价';

