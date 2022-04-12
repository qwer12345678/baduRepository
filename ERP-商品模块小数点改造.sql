/**
 * 春生-商品模块小数点改造
 */
 
#################################################################商品

# company_item
-- 新增新字段
ALTER TABLE `btsaas`.`company_item` 
	ADD COLUMN `cost_price_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '成本价/代理价' AFTER `cost_price`,
	ADD COLUMN `min_sold_price_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '最小销售价' AFTER `min_sold_price`,
	ADD COLUMN `max_sold_price_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '最大销售价' AFTER `max_sold_price`,
	ADD COLUMN `sales_volume_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '销售量' AFTER `sales_volume`;

-- 赋值新字段
UPDATE `btsaas`.`company_item` t SET 
	t.cost_price_temp0 = (CASE WHEN t.cost_price IS NULL THEN 0.00000000 ELSE t.cost_price/100 END),
	t.min_sold_price_temp0 = (CASE WHEN t.min_sold_price IS NULL THEN 0.00000000 ELSE t.min_sold_price/100 END),
	t.max_sold_price_temp0 = (CASE WHEN t.max_sold_price IS NULL THEN 0.00000000 ELSE t.max_sold_price/100 END),
	t.sales_volume_temp0 = (CASE WHEN t.sales_volume IS NULL THEN 0.00000000 ELSE t.sales_volume END);	

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_item` 
	CHANGE COLUMN `cost_price` `cost_price1` bigint(15)  COMMENT '成本价/代理价1',
	CHANGE COLUMN `min_sold_price` `cost_price1` bigint(15)  COMMENT '最小销售价1',
	CHANGE COLUMN `max_sold_price` `cost_price1` bigint(15)  COMMENT '最大销售价1',
	CHANGE COLUMN `sales_volume` `cost_price1` decimal(26,6)  COMMENT '销售量1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_item` 
	CHANGE COLUMN `cost_price_temp0` `cost_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '成本价/代理价',
	CHANGE COLUMN `min_sold_price_temp0` `min_sold_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '最小销售价',
	CHANGE COLUMN `max_sold_price_temp0` `max_sold_price` decimal(28, 8) DEFAULT 0.00000000 COMMENT '最大销售价',
	CHANGE COLUMN `sales_volume_temp0` `sales_volume` decimal(28, 8) DEFAULT 0.00000000 COMMENT '销售量';




# company_sku
-- 新增新字段
ALTER TABLE `btsaas`.`company_sku` 
	ADD COLUMN `cost_price_temp0` decimal(28,8) NOT NULL  DEFAULT 0.00000000 COMMENT '成本价/代理价' AFTER `cost_price`,
	ADD COLUMN `sold_price_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '销售价' AFTER `sold_price`,
	ADD COLUMN `original_price_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '原价' AFTER `original_price`,
	ADD COLUMN `sales_volume_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '销售量' AFTER `sales_volume`,
	ADD COLUMN `inventory_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '库存' AFTER `inventory`;

-- 赋值新字段
UPDATE `btsaas`.`company_sku` t SET 
	t.cost_price_temp0 = (CASE WHEN t.cost_price IS NULL THEN 0.00000000 ELSE t.cost_price/100 END),
	t.sold_price_temp0 = (CASE WHEN t.sold_price IS NULL THEN 0.00000000 ELSE t.sold_price/100 END),
	t.original_price_temp0 = (CASE WHEN t.original_price IS NULL THEN 0.00000000 ELSE t.original_price/100 END),
	t.sales_volume_temp0 = (CASE WHEN t.sales_volume IS NULL THEN 0.00000000 ELSE t.sales_volume END),
	t.inventory_temp0 = (CASE WHEN t.inventory IS NULL THEN 0.00000000 ELSE t.inventory END);	

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_sku` 
	CHANGE COLUMN `cost_price` `cost_price1` bigint(15)  COMMENT '成本价/代理价1',
	CHANGE COLUMN `sold_price` `sold_price1` bigint(15)  COMMENT '销售价1',
	CHANGE COLUMN `original_price` `original_price1` bigint(15)  COMMENT '原价1',
	CHANGE COLUMN `sales_volume` `sales_volume1` decimal(26,6)  COMMENT '销售量1',			
	CHANGE COLUMN `inventory` `inventory1` int(9)  COMMENT '库存1';	

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_sku` 
	CHANGE COLUMN `cost_price_temp0` `cost_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '成本价/代理价',
	CHANGE COLUMN `sold_price_temp0` `sold_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '最小销售价',
	CHANGE COLUMN `original_price_temp0` `original_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '最大销售价',
	CHANGE COLUMN `sales_volume_temp0` `sales_volume` decimal(28, 8) DEFAULT 0.00000000 COMMENT '销售量',
	CHANGE COLUMN `inventory_temp0` `inventory` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '库存';
	



# company_item_customer_related
-- 新增新字段
ALTER TABLE `btsaas`.`company_item_customer_related` 
	ADD COLUMN `cus_price_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '代理价格' AFTER `cus_price`,
	ADD COLUMN `cus_discount_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '代理折扣' AFTER `cus_discount`,
	ADD COLUMN `order_count_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '起订量' AFTER `order_count`;

-- 赋值新字段
UPDATE `btsaas`.`company_item_customer_related` t SET 
	t.cus_price_temp0 = (CASE WHEN t.cus_price IS NULL THEN 0.00000000 ELSE t.cus_price/100 END),
	t.cus_discount_temp0 = (CASE WHEN t.cus_discount IS NULL THEN 0.00000000 ELSE t.cus_discount END),
	t.order_count_temp0 = (CASE WHEN t.order_count IS NULL THEN 0.00000000 ELSE t.order_count END);	

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_item_customer_related` 
	CHANGE COLUMN `cus_price` `cus_price1` bigint(15)  COMMENT '代理价格1',
	CHANGE COLUMN `cus_discount` `cus_discount1` int(4)  COMMENT '代理折扣1',
	CHANGE COLUMN `order_count` `order_count1` int(9)  COMMENT '起订量1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_item_customer_related` 
	CHANGE COLUMN `cus_price_temp0` `cus_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '代理价格',
	CHANGE COLUMN `cus_discount_temp0` `cus_discount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '代理折扣',
	CHANGE COLUMN `order_count_temp0` `order_count` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '起订量';
		



# company_item_customer_related
-- 新增新字段
ALTER TABLE `btsaas`.`company_item_unit_related` 
	ADD COLUMN `conversion_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '单位换算关系' AFTER `conversion`;

-- 赋值新字段
UPDATE `btsaas`.`company_item_unit_related` t SET 
	t.conversion_temp0 = (CASE WHEN t.conversion IS NULL THEN 0.00000000 ELSE t.conversion END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_item_unit_related` 
	CHANGE COLUMN `conversion` `conversion1` bigint(15)  COMMENT '单位换算关系1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_item_unit_related` 
	CHANGE COLUMN `conversion_temp0` `conversion` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单位换算关系' AFTER `conversion1`;
		



# company_item_proxylevel_related
-- 新增新字段
ALTER TABLE `btsaas`.`company_item_proxylevel_related` 
	ADD COLUMN `proxy_price_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '代理级别  代理价格' AFTER `proxy_price`,
	ADD COLUMN `proxy_discount_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '代理级别的折扣' AFTER `proxy_discount`,
	ADD COLUMN `order_Count_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '代理级别 起订数量(按照最小单位来)' AFTER `order_Count`;

-- 赋值新字段
UPDATE `btsaas`.`company_item_proxylevel_related` t SET 
	t.proxy_price_temp0 = (CASE WHEN t.proxy_price IS NULL THEN 0.00000000 ELSE t.proxy_price/100 END),
	t.proxy_discount_temp0 = (CASE WHEN t.proxy_discount IS NULL THEN 0.00000000 ELSE t.proxy_discount END),
	t.order_Count_temp0 = (CASE WHEN t.order_Count IS NULL THEN 0.00000000 ELSE t.order_Count END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_item_proxylevel_related` 
	CHANGE COLUMN `proxy_price` `proxy_price1` bigint(15)  COMMENT '代理级别  代理价格1',
	CHANGE COLUMN `proxy_discount` `proxy_discount1` int(4)  COMMENT '代理级别的折扣1',
	CHANGE COLUMN `order_Count` `order_Count1` int(9)  COMMENT '代理级别 起订数量(按照最小单位来)1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_item_proxylevel_related` 
	CHANGE COLUMN `proxy_price_temp0` `proxy_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '代理级别  代理价格',
	CHANGE COLUMN `proxy_discount_temp0` `proxy_discount` decimal(28, 8) DEFAULT 0.00000000 COMMENT '代理级别的折扣',
	CHANGE COLUMN `order_Count_temp0` `order_Count` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '代理级别 起订数量(按照最小单位来)';
			



# company_item_goods_group
-- 新增新字段
ALTER TABLE `btsaas`.`company_item_goods_group` 
	ADD COLUMN `item_child_num_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '子商品配比数' AFTER `item_child_num`,
	ADD COLUMN `item_child_num_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '物料数量' AFTER `item_child_num`;

-- 赋值新字段
UPDATE `btsaas`.`company_item_goods_group` t SET 
	t.item_child_num_temp0 = (CASE WHEN t.item_child_num IS NULL THEN 0.00000000 ELSE t.item_child_num END),
	t.item_child_num_temp0 = (CASE WHEN t.item_child_num IS NULL THEN 0.00000000 ELSE t.item_child_num END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_item_goods_group` 
	CHANGE COLUMN `item_child_num` `item_child_num1` int(11)  COMMENT '子商品配比数1',
	CHANGE COLUMN `item_child_num` `item_child_num1` int(11)  COMMENT '物料数量1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_item_goods_group` 
	CHANGE COLUMN `item_child_num_temp0` `item_child_num` decimal(28,8)  DEFAULT 0.00000000  COMMENT '子商品配比数',
	CHANGE COLUMN `item_child_num_temp0` `item_child_num` decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '物料数量';
				



# logistics_valuation_rule
-- 新增新字段
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	ADD COLUMN `first_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '首费' AFTER `first_fee`,
	ADD COLUMN `add_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '续费' AFTER `add_fee`;

-- 赋值新字段
UPDATE `btsaas`.`logistics_valuation_rule` t SET 
	t.first_fee_temp0 = (CASE WHEN t.first_fee IS NULL THEN 0.00000000 ELSE t.first_fee/100 END),
	t.add_fee_temp0 = (CASE WHEN t.add_fee IS NULL THEN 0.00000000 ELSE t.add_fee/100 END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	CHANGE COLUMN `first_fee` `first_fee1` int(4)  COMMENT '首费1',
	CHANGE COLUMN `add_fee` `add_fee1` int(4)  COMMENT '续费1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	CHANGE COLUMN `first_fee_temp0` `first_fee` decimal(28,8)  DEFAULT 0.00000000  COMMENT '首费',
	CHANGE COLUMN `add_fee_temp0` `add_fee` decimal(28,8)  DEFAULT 0.00000000  COMMENT '续费';
					



# logistics_valuation_rule
-- 新增新字段
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	ADD COLUMN `first_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '首费' AFTER `first_fee`,
	ADD COLUMN `add_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '续费' AFTER `add_fee`;

-- 赋值新字段
UPDATE `btsaas`.`logistics_valuation_rule` t SET 
	t.first_fee_temp0 = (CASE WHEN t.first_fee IS NULL THEN 0.00000000 ELSE t.first_fee/100 END),
	t.add_fee_temp0 = (CASE WHEN t.add_fee IS NULL THEN 0.00000000 ELSE t.add_fee/100 END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	CHANGE COLUMN `first_fee` `first_fee1` int(4)  COMMENT '首费1',
	CHANGE COLUMN `add_fee` `add_fee1` int(4)  COMMENT '续费1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`logistics_valuation_rule` 
	CHANGE COLUMN `first_fee_temp0` `first_fee` decimal(28,8)  DEFAULT 0.00000000  COMMENT '首费',
	CHANGE COLUMN `add_fee_temp0` `add_fee` decimal(28,8)  DEFAULT 0.00000000  COMMENT '续费';
						



# company_shop_item_shoppingcartline
-- 新增新字段
ALTER TABLE `btsaas`.`company_shop_item_shoppingcartline` 
	ADD COLUMN `sold_price_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '商品销售价格' AFTER `sold_price`;

-- 赋值新字段
UPDATE `btsaas`.`company_shop_item_shoppingcartline` t SET 
	t.sold_price_temp0 = (CASE WHEN t.sold_price IS NULL THEN 0.00000000 ELSE t.sold_price/100 END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_shop_item_shoppingcartline` 
	CHANGE COLUMN `sold_price` `sold_price1` bigint(15)  COMMENT '商品销售价格1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_shop_item_shoppingcartline` 
	CHANGE COLUMN `sold_price_temp0` `sold_price` decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '商品销售价格';
							



# company_coupon
-- 新增新字段
ALTER TABLE `btsaas`.`company_coupon` 
	ADD COLUMN `coupon_condition_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '条件（满足多少金额）' AFTER `coupon_condition`,
	ADD COLUMN `coupon_setting_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '动作2 (减多少金额)' AFTER `coupon_setting`;

-- 赋值新字段
UPDATE `btsaas`.`company_coupon` t SET 
	t.coupon_condition_temp0 = (CASE WHEN t.coupon_condition IS NULL THEN 0.00000000 ELSE t.coupon_condition/100 END),
	t.coupon_setting_temp0 = (CASE WHEN t.coupon_setting IS NULL THEN 0.00000000 ELSE t.coupon_setting/100 END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_coupon` 
	CHANGE COLUMN `coupon_condition` `coupon_condition1` bigint(15)  COMMENT '条件（满足多少金额）1',
	CHANGE COLUMN `coupon_setting` `coupon_setting1` bigint(15)  COMMENT '动作2 (减多少金额)1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_coupon` 
	CHANGE COLUMN `coupon_condition_temp0` `coupon_condition` decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '条件（满足多少金额）',
	CHANGE COLUMN `coupon_setting_temp0` `coupon_setting` decimal(28,8) DEFAULT 0.00000000  COMMENT '动作2 (减多少金额)';
								



# company_discount_code
-- 新增新字段
ALTER TABLE `btsaas`.`company_discount_code` 
	ADD COLUMN `discount_code_condition_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '条件（满足多少金额）' AFTER `discount_code_condition`,
	ADD COLUMN `discount_code_setting_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '减少多少金额' AFTER `discount_code_setting`;

-- 赋值新字段
UPDATE `btsaas`.`company_discount_code` t SET 
	t.discount_code_condition_temp0 = (CASE WHEN t.discount_code_condition IS NULL THEN 0.00000000 ELSE t.discount_code_condition/100 END),
	t.discount_code_setting_temp0 = (CASE WHEN t.discount_code_setting IS NULL THEN 0.00000000 ELSE t.discount_code_setting/100 END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_discount_code` 
	CHANGE COLUMN `discount_code_condition` `discount_code_condition1` bigint(15)  COMMENT '条件（满足多少金额）1',
	CHANGE COLUMN `discount_code_setting` `discount_code_setting1` bigint(15)  COMMENT '减少多少金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_discount_code` 
	CHANGE COLUMN `discount_code_condition_temp0` `discount_code_condition` decimal(28,8) DEFAULT 0.00000000  COMMENT '条件（满足多少金额）',
	CHANGE COLUMN `discount_code_setting_temp0` `discount_code_setting` decimal(28,8) DEFAULT 0.00000000  COMMENT '减少多少金额';




# order_main
-- 新增新字段
ALTER TABLE `btsaas`.`order_main` 
	ADD COLUMN `product_count_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `product_count`,
	ADD COLUMN `product_amount_total_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `product_amount_total`,
	ADD COLUMN `order_amount_total_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '订单金额' AFTER `order_amount_total`,
	ADD COLUMN `logistics_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '运费金额' AFTER `logistics_fee`,
	ADD COLUMN `deduction_score_temp0` decimal(28,8)  DEFAULT 0 COMMENT '微商城、小程序-抵扣积分' AFTER `deduction_score`,
	ADD COLUMN `scored_money_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '积分抵扣钱数' AFTER `scored_money`,
	ADD COLUMN `coupon_money_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '优惠卷抵扣钱数' AFTER `coupon_money`,
	ADD COLUMN `dispatching_fee_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '配送金额' AFTER `dispatching_fee`,
	ADD COLUMN `sheep_order_discount_total_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '羊只订单折扣总数' AFTER `sheep_order_discount_total`;

-- 赋值新字段
UPDATE `btsaas`.`order_main` t SET 
	t.product_count_temp0 = (CASE WHEN t.product_count IS NULL THEN 0.00000000 ELSE t.product_count END);
	t.product_amount_total_temp0 = (CASE WHEN t.product_amount_total IS NULL THEN 0.00000000 ELSE t.product_amount_total/100 END),
	t.order_amount_total_temp0 = (CASE WHEN t.order_amount_total IS NULL THEN 0.00000000 ELSE t.order_amount_total/100 END),
	t.logistics_fee_temp0 = (CASE WHEN t.logistics_fee IS NULL THEN 0.00000000 ELSE t.logistics_fee/100 END),
	t.deduction_score_temp0 = (CASE WHEN t.deduction_score IS NULL THEN 0 ELSE t.logistics_fee END),
	t.scored_money_temp0 = (CASE WHEN t.scored_money IS NULL THEN 0.00000000 ELSE t.scored_money/100 END),
	t.coupon_money_temp0 = (CASE WHEN t.coupon_money IS NULL THEN 0.00000000 ELSE t.coupon_money/100 END),
	t.dispatching_fee_temp0 = (CASE WHEN t.dispatching_fee IS NULL THEN 0.00000000 ELSE t.dispatching_fee END),
	t.sheep_order_discount_total_temp0 = (CASE WHEN t.sheep_order_discount_total IS NULL THEN 0.00000000 ELSE t.sheep_order_discount_total END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_main` 
	CHANGE COLUMN `product_count` `product_count1` int(9)  COMMENT '订购产品数量1',
	CHANGE COLUMN `product_amount_total` `product_amount_total1` bigint(20)  COMMENT '商品总价1',
	CHANGE COLUMN `order_amount_total` `order_amount_total1` bigint(20)  COMMENT '订单金额1',
	CHANGE COLUMN `logistics_fee` `logistics_fee1` int(9)  COMMENT '运费金额1',
	CHANGE COLUMN `deduction_score` `deduction_score1` int(20)  COMMENT '微商城、小程序-抵扣积分1',
	CHANGE COLUMN `scored_money` `scored_money1` bigint(20)  COMMENT '积分抵扣钱数1',
	CHANGE COLUMN `coupon_money` `coupon_money1` bigint(20)  COMMENT '优惠卷抵扣钱数1',
	CHANGE COLUMN `dispatching_fee` `dispatching_fee1` decimal(28,8)  COMMENT '配送金额1',
	CHANGE COLUMN `sheep_order_discount_total` `sheep_order_discount_total1` int(9)  COMMENT '羊只订单折扣总数1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_main` 
	CHANGE COLUMN `product_count_temp0` `product_count`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '订购产品数量',
	CHANGE COLUMN `product_amount_total_temp0` `product_amount_total`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '商品总价',
	CHANGE COLUMN `order_amount_total_temp0` `order_amount_total`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '订单金额',
	CHANGE COLUMN `logistics_fee_temp0` `logistics_fee`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '运费金额',
	CHANGE COLUMN `deduction_score_temp0` `deduction_score`  decimal(28,8)  DEFAULT 0  COMMENT '微商城、小程序-抵扣积分',
	CHANGE COLUMN `scored_money_temp0` `scored_money`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '积分抵扣钱数',
	CHANGE COLUMN `coupon_money_temp0` `coupon_money`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '优惠卷抵扣钱数',
	CHANGE COLUMN `dispatching_fee_temp0` `dispatching_fee`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '配送金额',
	CHANGE COLUMN `sheep_order_discount_total_temp0` `sheep_order_discount_total`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '羊只订单折扣总数';
	



# order_goods
-- 新增新字段
ALTER TABLE `btsaas`.`order_goods` 
	ADD COLUMN `amount_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `amount`,
	ADD COLUMN `price_total_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `price_total`,
	ADD COLUMN `unit_price_temp0` decimal(28,8)  NOT NULL DEFAULT 0.00000000 COMMENT '商品单价' AFTER `unit_price`,
	ADD COLUMN `discount_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '优惠' AFTER `discount`,
	ADD COLUMN `single_weight_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '单只重量' AFTER `single_weight`,
	ADD COLUMN `sheep_total_weight_temp0` decimal(28,8)  DEFAULT 0.00000000 COMMENT '羊只总重量' AFTER `sheep_total_weight`;

-- 赋值新字段
UPDATE `btsaas`.`order_goods` t SET 
	t.amount_temp0 = (CASE WHEN t.amount IS NULL THEN 0.00000000 ELSE t.amount END),
	t.price_total_temp0 = (CASE WHEN t.price_total IS NULL THEN 0.00000000 ELSE t.price_total/100 END),
	t SET t.unit_price_temp0 = (CASE WHEN t.unit_price IS NULL THEN 0.00000000 ELSE t.unit_price/100 END),
	t SET t.discount_temp0 = (CASE WHEN t.discount IS NULL THEN 0.00000000 ELSE t.discount/100 END),
	t SET t.single_weight_temp0 = (CASE WHEN t.single_weight IS NULL THEN 0.00000000 ELSE t.single_weight END),
	t SET t.sheep_total_weight_temp0 = (CASE WHEN t.sheep_total_weight IS NULL THEN 0.00000000 ELSE t.sheep_total_weight END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_goods` 
	CHANGE COLUMN `amount` `amount1` int(9)  COMMENT '订购产品数量1',
	CHANGE COLUMN `price_total` `price_total1` bigint(20)  COMMENT '商品总价1',
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20)  COMMENT '商品单价1',
	CHANGE COLUMN `discount` `discount1` int(9)  COMMENT '优惠1';
	CHANGE COLUMN `single_weight` `single_weight1` int(9)  COMMENT '单只重量1',
	CHANGE COLUMN `sheep_total_weight` `sheep_total_weight1` decimal(16,6)  COMMENT '羊只总重量1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_goods` 
	CHANGE COLUMN `amount_temp0` `amount`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '订购产品数量',
	CHANGE COLUMN `price_total_temp0` `price_total`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '商品总价',
	CHANGE COLUMN `unit_price_temp0` `unit_price`  decimal(28,8) NOT NULL DEFAULT 0.00000000  COMMENT '商品单价',
	CHANGE COLUMN `discount_temp0` `discount`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '优惠',
	CHANGE COLUMN `single_weight_temp0` `single_weight`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '单只重量',
	CHANGE COLUMN `sheep_total_weight_temp0` `sheep_total_weight`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '羊只总重量';
						



# score_company_get_option
-- 新增新字段
ALTER TABLE `btsaas`.`score_company_get_option` 
	ADD COLUMN `value_temp0` decimal(28,8) NOT NULL  DEFAULT 0.00000000 COMMENT '商品价格换算积分 1元/' AFTER `value`;

-- 赋值新字段
UPDATE `btsaas`.`score_company_get_option` t SET 
	t.value_temp0 = (CASE WHEN t.value IS NULL THEN 0.00000000 ELSE t.value END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`score_company_get_option` 
	CHANGE COLUMN `value` `value1` double  COMMENT '商品价格换算积分 1元/   1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`score_company_get_option` 
	CHANGE COLUMN `value_temp0` `value`  decimal(28,8)  DEFAULT 0.00000000  COMMENT '商品价格换算积分 1元/';	
						



# order_coupon
-- 新增新字段
ALTER TABLE `btsaas`.`order_coupon` 
	ADD COLUMN `coupon_condition_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠券满足金额条件' AFTER `coupon_condition`,
	ADD COLUMN `coupon_setting_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠券满足金额条件动作' AFTER `coupon_setting`,
	ADD COLUMN `deduction_money_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '抵扣钱数' AFTER `deduction_money`;

-- 赋值新字段
UPDATE `btsaas`.`order_coupon` t SET 
	t.coupon_condition_temp0 = IFNULL(t.coupon_condition/100,0),
	t.coupon_setting_temp0 = IFNULL(t.coupon_setting/100,0),
	t.deduction_money_temp0 = IFNULL(t.deduction_money/100,0);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_coupon` 
	CHANGE COLUMN `coupon_condition` `coupon_condition1` bigint(15)  COMMENT '优惠券满足金额条件1',
	CHANGE COLUMN `coupon_setting` `coupon_setting1` bigint(15)  COMMENT '优惠券满足金额条件动作1',
	CHANGE COLUMN `deduction_money` `deduction_money1` bigint(20)  COMMENT '抵扣钱数1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_coupon` 
	CHANGE COLUMN `coupon_condition_temp0` `coupon_condition`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '优惠券满足金额条件',
	CHANGE COLUMN `coupon_setting_temp0` `coupon_setting`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '优惠券满足金额条件动作',
	CHANGE COLUMN `deduction_money_temp0` `deduction_money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '抵扣钱数';		
						



# order_score
-- 新增新字段
ALTER TABLE `btsaas`.`order_score` 
	ADD COLUMN `score_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '使用积分数' AFTER `score`,
	ADD COLUMN `deduction_money_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '抵扣钱数' AFTER `deduction_money`;

-- 赋值新字段
UPDATE `btsaas`.`order_score` t SET 
	t.score_temp0 = IFNULL(t.score,0),
	t.deduction_money_temp0 = IFNULL(t.deduction_money/100,0);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_score` 
	CHANGE COLUMN `score` `score1`  bigint(20)  COMMENT '使用积分数1',
	CHANGE COLUMN `deduction_money` `deduction_money1`  bigint(20)  COMMENT '抵扣钱数1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_score` 
	CHANGE COLUMN `score_temp0` `score`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '使用积分数',
	CHANGE COLUMN `deduction_money_temp0` `deduction_money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '抵扣钱数';	
						



# order_invoice
-- 新增新字段
ALTER TABLE `btsaas`.`order_invoice` 
	ADD COLUMN `summary_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '发票金额' AFTER `summary`;

-- 赋值新字段
UPDATE `btsaas`.`order_invoice` t SET 
	t.summary_temp0 = IFNULL(t.summary/100,0);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`order_invoice` 
	CHANGE COLUMN `summary` `summary1`  int(9)  COMMENT '发票金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_invoice` 
	CHANGE COLUMN `summary_temp0` `summary`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '发票金额';		
	



# score_record
-- 新增新字段
ALTER TABLE `btsaas`.`score_record` 
	ADD COLUMN `unused_score_temp0` decimal(28,8) DEFAULT 0.00000000 COMMENT '未使用积分' AFTER `unused_score`,
	ADD COLUMN `score_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '使用积分' AFTER `score`;

-- 赋值新字段
UPDATE `btsaas`.`score_record` t SET 
	t.unused_score_temp0 = IFNULL(t.unused_score,0),
	t.score_temp0 = IFNULL(t.score,0);	

-- 修改老字段名称 
ALTER TABLE `btsaas`.`score_record` 
	CHANGE COLUMN `unused_score` `unused_score1`  bigint(20)  COMMENT '未使用积分1',
	CHANGE COLUMN `score` `score1`  bigint(20)  COMMENT '使用积分1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`score_record` 
	CHANGE COLUMN `unused_score_temp0` `unused_score`  decimal(28,8) DEFAULT 0  COMMENT '未使用积分',
	CHANGE COLUMN `score_temp0` `score`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '使用积分';
	
	
	
	
# company_invoice
-- 新增新字段
ALTER TABLE `btsaas`.`company_invoice` 
	ADD COLUMN `money_temp0` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT '发票金额' AFTER `money`,
	ADD COLUMN `used_money_temp0` decimal(28,8) DEFAULT 0.00000000 COMMENT '已开金额' AFTER `used_money`,
	ADD COLUMN `remaining_money_temp0` decimal(28,8) DEFAULT 0.00000000 COMMENT '待开金额' AFTER `remaining_money`;

-- 赋值新字段
UPDATE `btsaas`.`company_invoice` t SET 
	t.money_temp0 = IFNULL(t.money/100,0),
	t.used_money_temp0 = IFNULL(t.used_money/100,0),	
	t.remaining_money_temp0 = IFNULL(t.remaining_money/100,0);	

-- 修改老字段名称 
ALTER TABLE `btsaas`.`company_invoice` 
	CHANGE COLUMN `money` `money1`  bigint(20)  COMMENT '发票金额1',
	CHANGE COLUMN `used_money` `used_money1`  bigint(20)  COMMENT '已开金额1',
	CHANGE COLUMN `remaining_money` `remaining_money1`  bigint(20)  COMMENT '待开金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_invoice` 
	CHANGE COLUMN `money_temp0` `money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '发票金额',
	CHANGE COLUMN `used_money_temp0` `used_money`  decimal(28,8)  DEFAULT 0  COMMENT '已开金额',
	CHANGE COLUMN `money_temp0` `money`  decimal(28,8)  DEFAULT 0  COMMENT '待开金额';
	
	
	
	
# gift_card
-- 新增新字段
ALTER TABLE `btsaas`.`gift_card` 
	ADD COLUMN `worth_temp0` decimal(28,8)  DEFAULT 0 COMMENT '单张卡价值(元)' AFTER `worth`,
	ADD COLUMN `worth_temp0` decimal(28,8)  DEFAULT 0 COMMENT '单张卡价值(元)' AFTER `worth`;

-- 赋值新字段
UPDATE `btsaas`.`gift_card` t SET 
	t.worth_temp0 = IFNULL(t.worth/100,0),
	t.worth_temp0 = IFNULL(t.worth/100,0);		

-- 修改老字段名称 
ALTER TABLE `btsaas`.`gift_card` 
	CHANGE COLUMN `worth` `worth1`  bigint(20)  COMMENT '单张卡价值(元)1',
	CHANGE COLUMN `worth` `worth1`  bigint(20)  COMMENT '单张卡价值(元)1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`gift_card` 
	CHANGE COLUMN `worth_temp0` `worth`  decimal(28,8)  DEFAULT 0  COMMENT '单张卡价值(元)',
	CHANGE COLUMN `worth_temp0` `worth`  decimal(28,8)  DEFAULT 0  COMMENT '单张卡价值(元)';
	
	
	
	
# store_value_card
-- 新增新字段
ALTER TABLE `btsaas`.`store_value_card` 
	ADD COLUMN `face_value_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '储值卡面值' AFTER `face_value`,
	ADD COLUMN `face_value_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '储值卡面值' AFTER `face_value`;

-- 赋值新字段
UPDATE `btsaas`.`store_value_card` t SET 
	t.face_value_temp0 = (CASE WHEN t.face_value IS NULL THEN 0 ELSE t.face_value END),
	t.face_value_temp0 = (CASE WHEN t.face_value IS NULL THEN 0 ELSE t.face_value END);		

-- 修改老字段名称 
ALTER TABLE `btsaas`.`store_value_card` 
	CHANGE COLUMN `face_value` `face_value1`  bigint(20)  COMMENT '储值卡面值1',
	CHANGE COLUMN `face_value` `face_value1`  bigint(20)  COMMENT '储值卡面值1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`store_value_card` 
	CHANGE COLUMN `face_value_temp0` `face_value`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '储值卡面值',
	CHANGE COLUMN `face_value_temp0` `face_value`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '储值卡面值';
	
	
	
	
# recharge_order
-- 新增新字段
ALTER TABLE `btsaas`.`recharge_order` 
	ADD COLUMN `total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '金额' AFTER `total`,
	ADD COLUMN `actual_paid_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '实际到账总金额' AFTER `actual_paid`;

-- 赋值新字段
UPDATE `btsaas`.`recharge_order` t SET 
	t.total_temp0 = IFNULL(t.total/100,0),
	t.actual_paid_temp0 = IFNULL(t.actual_paid/100,0);	

-- 修改老字段名称 
ALTER TABLE `btsaas`.`recharge_order` 
	CHANGE COLUMN `total` `total1`  bigint(15)  COMMENT '金额1',
	CHANGE COLUMN `actual_paid` `actual_paid1`  bigint(15)  COMMENT '实际到账总金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`recharge_order` 
	CHANGE COLUMN `total_temp0` `total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '金额',
	CHANGE COLUMN `actual_paid_temp0` `actual_paid`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '实际到账总金额';
	
	
	
	
# order_safeguard
-- 新增新字段
ALTER TABLE `btsaas`.`order_safeguard` 
	ADD COLUMN `returns_num_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '退货数量' AFTER `returns_num`,
	ADD COLUMN `refund_amount_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '退款金额' AFTER `refund_amount`;

-- 赋值新字段
UPDATE `btsaas`.`order_safeguard` t SET 
	t.returns_num_temp0 = (CASE WHEN t.returns_num IS NULL THEN 0 ELSE t.returns_num END),
	t.refund_amount_temp0 = (CASE WHEN t.refund_amount IS NULL THEN 0 ELSE t.refund_amount/100 END);	

-- 修改老字段名称 
ALTER TABLE `btsaas`.`order_safeguard` 
	CHANGE COLUMN `returns_num` `returns_num1`  bigint(20)  COMMENT '退货数量1',
	CHANGE COLUMN `refund_amount` `refund_amount1`  bigint(20)  COMMENT '退款金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_safeguard` 
	CHANGE COLUMN `returns_num_temp0` `returns_num`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '退货数量',
	CHANGE COLUMN `refund_amount_temp0` `refund_amount`  decimal(28,8)  DEFAULT 0  COMMENT '退款金额';
	
	
	
	
# order_main_address
-- 新增新字段
ALTER TABLE `btsaas`.`order_main_address` 
	ADD COLUMN `order_amount_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '订单金额' AFTER `order_amount_total`;

-- 赋值新字段
UPDATE `btsaas`.`order_main_address` t SET 
	t.order_amount_total_temp0 = (CASE WHEN t.order_amount_total IS NULL THEN 0 ELSE t.order_amount_total END);

-- 修改老字段名称 
ALTER TABLE `btsaas`.`order_main_address` 
	CHANGE COLUMN `order_amount_total` `order_amount_total1`  bigint(20)  COMMENT '订单金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_main_address` 
	CHANGE COLUMN `order_amount_total_temp0` `order_amount_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '订单金额';
	
	
	
	
# distribution_withdraw
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_withdraw` 
	ADD COLUMN `commission_charges_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '手续费比例' AFTER `commission_charges`,
	ADD COLUMN `commission_charges_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '手续费金额' AFTER `commission_charges_total`,
	ADD COLUMN `total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '实际提现金额' AFTER `total`;

-- 赋值新字段
UPDATE `btsaas`.`distribution_withdraw` t SET 
	t.commission_charges_temp0 = IFNULL(t.commission_charges/10000,0),
	t.commission_charges_total_temp0 = IFNULL(t.commission_charges_total/100,0),
	t.total_temp0 = IFNULL(t.total/100,0);

-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_withdraw` 
	CHANGE COLUMN `commission_charges` `commission_charges1`  int(9)  COMMENT '手续费比例1',
	CHANGE COLUMN `commission_charges_total` `commission_charges_total1`  bigint(19)  COMMENT '手续费金额1',
	CHANGE COLUMN `total` `total1`  bigint(15)  COMMENT '实际提现金额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_withdraw` 
	CHANGE COLUMN `commission_charges_temp0` `commission_charges`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '手续费比例',
	CHANGE COLUMN `commission_charges_total_temp0` `commission_charges_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '手续费金额',
	CHANGE COLUMN `total_temp0` `total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '实际提现金额';
	
	
	
	
# distribution_profile
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_profile` 
	ADD COLUMN `total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '总收益' AFTER `total`,
	ADD COLUMN `profit_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '提现中金额' AFTER `profit_total`,
	ADD COLUMN `freeze_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '冻结金额' AFTER `freeze_total`,
	ADD COLUMN `can_withdraw_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '可提现' AFTER `can_withdraw`,
	ADD COLUMN `have_withdraw_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '已提现' AFTER `have_withdraw`,
	ADD COLUMN `to_audit_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '' AFTER `to_audit`;

-- 赋值新字段
UPDATE `btsaas`.`distribution_profile` t SET 
	t.total_temp0 = IFNULL(t.total/100,0),
	t.profit_total_temp0 = IFNULL(t.profit_total/100,0),
	t.freeze_total_temp0 = IFNULL(t.freeze_total/100,0),
	t.can_withdraw_temp0 = IFNULL(t.can_withdraw/100,0),
	t.have_withdraw_temp0 = IFNULL(t.have_withdraw/100,0),
	t.to_audit_temp0 = IFNULL(t.to_audit/100,0);

-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_profile` 
	CHANGE COLUMN `total` `total1`  bigint(15)  COMMENT '总收益1',
	CHANGE COLUMN `profit_total` `profit_total1`  bigint(15)  COMMENT '提现中金额1',
	CHANGE COLUMN `freeze_total` `freeze_total1`  bigint(15)  COMMENT '冻结金额1',
	CHANGE COLUMN `can_withdraw` `can_withdraw1`  bigint(15)  COMMENT '可提现1',
	CHANGE COLUMN `have_withdraw` `have_withdraw1`  bigint(15)  COMMENT '已提现1',
	CHANGE COLUMN `to_audit` `to_audit1`  bigint(15)  COMMENT '';

-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_profile` 
	CHANGE COLUMN `total_temp0` `total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '总收益',
	CHANGE COLUMN `profit_total_temp0` `profit_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '提现中金额',
	CHANGE COLUMN `freeze_total_temp0` `freeze_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '冻结金额',
	CHANGE COLUMN `can_withdraw_temp0` `can_withdraw`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '可提现',
	CHANGE COLUMN `have_withdraw_temp0` `have_withdraw`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '已提现',
	CHANGE COLUMN `to_audit_temp0` `to_audit`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '';
	
	
	
	
# distribution_hierarchy
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_hierarchy` 
	ADD COLUMN `withdraw_limit_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '冻结金额比例' AFTER `withdraw_limit`,
	ADD COLUMN `withdraw_limit_money_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '冻结金额上限' AFTER `withdraw_limit_money`,
	ADD COLUMN `withdraw_lowest_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '最低提现金额' AFTER `withdraw_lowest`,
	ADD COLUMN `commission_charges_temp0` decimal(28,8) DEFAULT 0 COMMENT '提现手续费比例' AFTER `commission_charges`;

-- 赋值新字段
UPDATE `btsaas`.`distribution_hierarchy` t SET 
	t.withdraw_limit_temp0 = IFNULL(t.withdraw_limit/100,0),
	t.withdraw_limit_money_temp0 = IFNULL(t.withdraw_limit_money/100,0),
	t.withdraw_lowest_temp0 = IFNULL(t.withdraw_lowest/100,0),
	t.commission_charges_temp0 = IFNULL(t.commission_charges/10000,0);

-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_hierarchy` 
	CHANGE COLUMN `withdraw_limit` `withdraw_limit1`  int(9)  COMMENT '冻结金额比例1',
	CHANGE COLUMN `withdraw_limit_money` `withdraw_limit_money1`  int(15)  COMMENT '冻结金额上限1'v
	CHANGE COLUMN `withdraw_lowest` `withdraw_lowest1`  int(19)  COMMENT '最低提现金额1',
	CHANGE COLUMN `commission_charges` `commission_charges1`  int(9)  COMMENT '提现手续费比例1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_hierarchy` 
	CHANGE COLUMN `withdraw_limit_temp0` `withdraw_limit`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '冻结金额比例',
	CHANGE COLUMN `withdraw_limit_money_temp0` `withdraw_limit_money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '冻结金额上限',
	CHANGE COLUMN `withdraw_lowest_temp0` `withdraw_lowest`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '最低提现金额',
	CHANGE COLUMN `commission_charges_temp0` `commission_charges`  decimal(28,8)  DEFAULT 0  COMMENT '提现手续费比例';
	
	
	
	
# distribution_flow_record
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_flow_record` 
	ADD COLUMN `product_number_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '产品数量' AFTER `product_number`,
	ADD COLUMN `product_price_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '产品价格' AFTER `product_price`,
	ADD COLUMN `order_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '总价' AFTER `order_total`,
	ADD COLUMN `brokerage_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '佣金' AFTER `brokerage_total`,
	ADD COLUMN `freeze_total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '冻结金额' AFTER `freeze_total`,
	ADD COLUMN `ratio_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '比例' AFTER `ratio`;

-- 赋值新字段
UPDATE `btsaas`.`distribution_flow_record` t SET 
	t.product_number_temp0 = IFNULL(t.product_number,0),
	t.product_price_temp0 = IFNULL(t.product_price/100,0),
	t.order_total_temp0 = IFNULL(t.order_total/100,0),
	t.brokerage_total_temp0 = IFNULL(t.brokerage_total/100,0),
	t.freeze_total_temp0 = IFNULL(t.freeze_total/100,0),
	t.ratio_temp0 = IFNULL(t.ratio/100,0);

-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_flow_record` 
	CHANGE COLUMN `product_number` `product_number1`  int(9)  COMMENT '产品数量',
	CHANGE COLUMN `product_price` `product_price1`  bigint(15)  COMMENT '产品价格1',
	CHANGE COLUMN `order_total` `order_total1`  bigint(15)  COMMENT '总价1',
	CHANGE COLUMN `brokerage_total` `brokerage_total1`  bigint(15)  COMMENT '佣金1',
	CHANGE COLUMN `freeze_total` `freeze_total1`  bigint(15)  COMMENT '冻结金额1',
	CHANGE COLUMN `ratio` `ratio1`  int(9)  COMMENT '比例1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_flow_record` 
	CHANGE COLUMN `product_number_temp0` `product_number`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '产品数量',
	CHANGE COLUMN `product_price_temp0` `product_price`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '产品价格',
	CHANGE COLUMN `withdraw_lowest_temp0` `withdraw_lowest`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '总价',
	CHANGE COLUMN `brokerage_total_temp0` `brokerage_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '佣金',
	CHANGE COLUMN `freeze_total_temp0` `freeze_total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '冻结金额',
	CHANGE COLUMN `ratio_temp0` `ratio`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '比例';
	
	
	
	
# distribution_record
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_record` 
	ADD COLUMN `total_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '金额' AFTER `total`,
	ADD COLUMN `balance_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '余额' AFTER `balance`;

-- 赋值新字段
UPDATE `btsaas`.`distribution_record` t SET 
	t.total_temp0 = IFNULL(t.total/100,0),
	t.balance_temp0 = IFNULL(t.balance/100,0);

-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_record`
	CHANGE COLUMN `total` `total1`  bigint(20)  COMMENT '金额1',
	CHANGE COLUMN `balance` `balance1`  bigint(20)  COMMENT '余额1';

-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_record`
	CHANGE COLUMN `total_temp0` `total`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '产品数量',
	CHANGE COLUMN `balance_temp0` `balance`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '产品价格';
	
	
	
	
# distribution_new_rebate
-- 新增新字段
ALTER TABLE `btsaas`.`distribution_new_rebate` 
	ADD COLUMN `rebate_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '比例' AFTER `rebate`;
	
-- 赋值新字段
UPDATE `btsaas`.`distribution_new_rebate` t SET 
	t.rebate_temp0 = IFNULL(t.rebate/100,0);
	
-- 修改老字段名称
ALTER TABLE `btsaas`.`distribution_new_rebate` 
	CHANGE COLUMN `rebate` `rebate1`  int(9)  COMMENT '比例1';
	
-- 修改新字段名称
ALTER TABLE `btsaas`.`distribution_new_rebate` 
	CHANGE COLUMN `rebate_temp0` `rebate`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '比例';
	
	
	
	
# pc_stored_value_template
-- 新增新字段
ALTER TABLE `btsaas`.`pc_stored_value_template` 
	ADD COLUMN `money_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '充值金额' AFTER `money`,
	ADD COLUMN `give_money_temp0` decimal(28,8) NOT NULL DEFAULT 0 COMMENT '赠送金额' AFTER `give_money`;
	
-- 赋值新字段
UPDATE `btsaas`.`pc_stored_value_template` t SET 
	t.money_temp0 = IFNULL(t.money/100,0),
	t.give_money_temp0 = IFNULL(t.give_money/100,0);
	
-- 修改老字段名称
ALTER TABLE `btsaas`.`pc_stored_value_template` 
	CHANGE COLUMN `money` `money1`  bigint(20)  COMMENT '充值金额1',
	CHANGE COLUMN `give_money` `give_money1`  bigint(20)  COMMENT '赠送金额1';
	
-- 修改新字段名称
ALTER TABLE `btsaas`.`pc_stored_value_template` 
	CHANGE COLUMN `money_temp0` `money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '充值金额',
	CHANGE COLUMN `money_temp0` `money`  decimal(28,8) NOT NULL DEFAULT 0  COMMENT '赠送金额';
	
	
	
	
# order_goods_destination
-- 新增新字段
ALTER TABLE `btsaas`.`order_goods_destination` 
	ADD COLUMN `amount_temp0` decimal(20, 8) NOT NULL DEFAULT 0 COMMENT '订购产品数量' AFTER `amount`,
	ADD COLUMN `price_total_temp0` decimal(20, 8) NOT NULL DEFAULT 0 COMMENT '商品总价' AFTER `price_total`,
	ADD COLUMN `unit_price_temp0` decimal(20, 8) NOT NULL DEFAULT 0 COMMENT '加工单价' AFTER `unit_price`,
	ADD COLUMN `wati_out_store_temp0` decimal(20, 8) NULL DEFAULT 0 COMMENT '等待出库数量' AFTER `wati_out_store`,
	ADD COLUMN `discount_temp0` decimal(20, 8) NULL DEFAULT 0 COMMENT '优惠' AFTER `discount`;
	
-- 赋值新字段
UPDATE order_goods_destination ogd SET 
	ogd.amount_temp0 = 
	(CASE
		WHEN ogd.amount IS NULL THEN
			0.00000000
		ELSE
			ogd.amount
	END),
	ogd.price_total_temp0 = 
	(CASE
		WHEN ogd.price_total IS NULL THEN
			0.00000000
		ELSE
			ogd.price_total/100
	END),
	ogd.unit_price_temp0 = 
	(CASE
		WHEN ogd.unit_price IS NULL THEN
			0.00000000
		ELSE
			ogd.unit_price/100
	END),
	ogd.wati_out_store_temp0 = 
	(CASE
		WHEN ogd.wati_out_store IS NULL THEN
			0.00000000
		ELSE
			ogd.wati_out_store
	END),
	ogd.discount_temp0 = 
	(CASE
		WHEN ogd.discount IS NULL THEN
			0.00000000
		ELSE
			ogd.discount/100
	END);
	
-- 修改老字段名称
ALTER TABLE `btsaas`.`order_goods_destination` 
	CHANGE COLUMN `amount` `amount1` int(9) NULL COMMENT '订购产品数量' AFTER `sku_name`,
	CHANGE COLUMN `price_total` `price_total1` bigint(20) NULL COMMENT '商品总价' AFTER `amount_temp0`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20) NULL COMMENT '加工单价' AFTER `price_total_temp0`,
	CHANGE COLUMN `wati_out_store` `wati_out_store1` int(9) NULL DEFAULT NULL COMMENT '等待出库数量' AFTER `unit`,
	CHANGE COLUMN `discount` `discount1` int(9) NULL DEFAULT NULL COMMENT '优惠' AFTER `wati_out_store_temp0`;
	
-- 修改新字段名称
ALTER TABLE `btsaas`.`order_goods_destination` 
	CHANGE COLUMN `price_total_temp0` `price_total` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '商品总价' AFTER `price_total1`,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '加工单价' AFTER `unit_price1`,
	CHANGE COLUMN `wati_out_store_temp0` `wati_out_store` decimal(28, 8) NULL DEFAULT 0 COMMENT '等待出库数量' AFTER `wati_out_store1`,
	CHANGE COLUMN `discount_temp0` `discount` decimal(28, 8) NULL DEFAULT 0 COMMENT '优惠' AFTER `discount1`;
	
	
	
	
# order_consultation_record
-- 新增新字段
ALTER TABLE `btsaas`.`order_consultation_record` 
	ADD COLUMN `returns_num_temp0` decimal(20, 8) NULL DEFAULT 0 COMMENT '退货数量' AFTER `returns_num`,
	ADD COLUMN `refund_amount_temp0` decimal(20, 8) NULL DEFAULT 0 COMMENT '退款金额' AFTER `refund_amount`;
	
-- 赋值新字段
UPDATE order_consultation_record ocr SET 
	ocr.returns_num_temp0 = 
	(CASE
		WHEN ocr.returns_num IS NULL THEN
			0.00000000
		ELSE
			ocr.returns_num
	END),
	ocr.refund_amount_temp0 = 
	(CASE
		WHEN ocr.refund_amount IS NULL THEN
			0.00000000
		ELSE
			ocr.refund_amount/100
	END);
	
-- 修改老字段名称
ALTER TABLE `btsaas`.`order_consultation_record` 
	CHANGE COLUMN `returns_num` `returns_num1` int(20) NULL DEFAULT NULL COMMENT '退货数量' AFTER `apply_time`;
	CHANGE COLUMN `refund_amount` `refund_amount1` bigint(16) NULL DEFAULT NULL COMMENT '退款金额' AFTER `refund_reson`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_consultation_record` 
	CHANGE COLUMN `returns_num_temp0` `returns_num` decimal(20, 8) NULL DEFAULT 0.00000000 COMMENT '退货数量' AFTER `returns_num1`;
	CHANGE COLUMN `refund_amount_temp0` `refund_amount` decimal(20, 8) NULL DEFAULT 0.00000000 COMMENT '退款金额' AFTER `refund_amount1`;
	
	
	
	
# order_product
-- 新增新字段
-------amount_temp0  fanqingchao------------
ALTER TABLE `btsaas`.`order_product` 
	ADD COLUMN `unit_price_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '单价' AFTER `unit_price`,
	ADD COLUMN `discount_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '折扣' AFTER `discount`;

ALTER TABLE `btsaas`.`order_product` 
	MODIFY COLUMN `decimal_delivery_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '出库数量' AFTER `delivery_total`,
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量' AFTER `amount`;
	
-- 赋值新字段
update order_product op set 
	op.amount_temp0 = 
	(CASE
			WHEN op.amount IS NULL THEN
					0.00000000
			ELSE
					op.amount
	END);

	UPDATE order_product op SET 
	op.unit_price_temp0 = 
	(CASE
		WHEN op.unit_price IS NULL THEN
			0.00000000
		ELSE
			op.unit_price/100
	END),
	op.discount_temp0 = 
	(CASE
		WHEN op.discount IS NULL THEN
			0.00000000
		ELSE
			op.discount/100
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_product` 
	CHANGE COLUMN `amount` `amount1` int(9)  NULL COMMENT '订购数量' AFTER `product_sku_name`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20)  NULL COMMENT '单价' AFTER `unit`,
	CHANGE COLUMN `discount` `discount1` int(9) NULL DEFAULT NULL COMMENT '折扣' AFTER `classify_name`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_product` 
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量' AFTER `amount1`,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NULL DEFAULT 0 COMMENT '单价' AFTER `unit_price1`,
	CHANGE COLUMN `discount_temp0` `discount` decimal(28, 8) NULL DEFAULT 0 COMMENT '折扣' AFTER `discount1`;
	
	
	
	
# order_safeguard
-- 新增新字段
ALTER TABLE `btsaas`.`order_safeguard` 
	ADD COLUMN `returns_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '退货数量' AFTER `returns_num`,
	ADD COLUMN `refund_amount_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '退款金额' AFTER `refund_amount`;
	
-- 赋值新字段
UPDATE order_safeguard os SET 
	os.returns_num_temp0 = 
	(CASE
		WHEN os.returns_num IS NULL THEN
			0.00000000
		ELSE
			os.returns_num
	END),
	os.refund_amount_temp0 = 
	(CASE
		WHEN os.refund_amount IS NULL THEN
			0.00000000
		ELSE
			os.refund_amount/100
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_safeguard` 
	CHANGE COLUMN `returns_num` `returns_num1` int(20) NULL COMMENT '退货数量' AFTER `apply_evidence`,
	CHANGE COLUMN `refund_amount` `refund_amount1` bigint(20) NULL DEFAULT NULL COMMENT '退款金额' AFTER `refund_reson_describe`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_safeguard` 
	CHANGE COLUMN `returns_num_temp0` `returns_num` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '退货数量' AFTER `returns_num1`,
	CHANGE COLUMN `refund_amount_temp0` `refund_amount` decimal(28, 8) NULL DEFAULT 0 COMMENT '退款金额' AFTER `refund_amount1`;
	
	
	
	
# order_safeguard_goods
-- 新增新字段
ALTER TABLE `btsaas`.`order_safeguard_goods` 
	ADD COLUMN `returns_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '退货数量' AFTER `returns_num`,
	ADD COLUMN `refund_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '商品总价' AFTER `refund_amount`,
	ADD COLUMN `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '产品单价' AFTER `unit_price`;
	
-- 赋值新字段
UPDATE order_safeguard_goods osg SET 
	osg.returns_num_temp0 = 
	(CASE
		WHEN osg.returns_num IS NULL THEN
			0.00000000
		ELSE
			osg.returns_num
	END),
	osg.refund_amount_temp0 = 
	(CASE
		WHEN osg.refund_amount IS NULL THEN
			0.00000000
		ELSE
			osg.refund_amount/100
	END),
	osg.unit_price_temp0 = 
	(CASE
		WHEN osg.unit_price IS NULL THEN
			0.00000000
		ELSE
			osg.unit_price/100
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_safeguard_goods` 
	CHANGE COLUMN `returns_num` `returns_num1` int(20) NULL COMMENT '退货数量' AFTER `goods_sku_name`,
	CHANGE COLUMN `refund_amount` `refund_amount1` bigint(20) NULL COMMENT '商品总价' AFTER `returns_num_temp0`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20) NULL COMMENT '产品单价' AFTER `refund_amount_temp0`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_safeguard_goods` 
	CHANGE COLUMN `returns_num_temp0` `returns_num` decimal(28, 8) NOT NULL COMMENT '退货数量' AFTER `returns_num1`,
	CHANGE COLUMN `refund_amount_temp0` `refund_amount` decimal(28, 8) NOT NULL COMMENT '商品总价' AFTER `refund_amount1`,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NOT NULL COMMENT '产品单价' AFTER `unit_price1`;
	
	
	
	
# order_waste
-- 新增新字段
ALTER TABLE `btsaas`.`order_waste` 
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '入库数量' AFTER `amount`,
	ADD COLUMN `price_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '总加工费' AFTER `price_total`,
	ADD COLUMN `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '加工差价' AFTER `unit_price`,
	ADD COLUMN `discount_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '优惠' AFTER `discount`;
	
-- 赋值新字段
UPDATE order_waste ow SET 
	ow.amount_temp0 = 
	(CASE
		WHEN ow.amount IS NULL THEN
			0.00000000
		ELSE
			ow.amount/100
	END),
	ow.price_total_temp0 = 
	(CASE
		WHEN ow.price_total IS NULL THEN
			0.00000000
		ELSE
			ow.price_total/10000
	END),
	ow.unit_price_temp0 = 
	(CASE
		WHEN ow.unit_price IS NULL THEN
			0.00000000
		ELSE
			ow.unit_price/100
	END),
	ow.discount_temp0 = 
	(CASE
		WHEN ow.discount IS NULL THEN
			0.00000000
		ELSE
			ow.discount
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_waste` 
	CHANGE COLUMN `amount` `amount1` int(9) NULL COMMENT '入库数量' AFTER `sku_name`,
	CHANGE COLUMN `price_total` `price_total1` bigint(20) NULL COMMENT '总加工费' AFTER `amount_temp0`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20) NULL COMMENT '加工差价' AFTER `price_total_temp0`,
	CHANGE COLUMN `discount` `discount1` int(9) NULL DEFAULT NULL COMMENT '优惠' AFTER `unit`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_waste` 
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '入库数量' AFTER `amount1`,
	CHANGE COLUMN `price_total_temp0` `price_total` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '总加工费' AFTER `price_total1`,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '加工差价' AFTER `unit_price1`,
	CHANGE COLUMN `discount_temp0` `discount` decimal(28, 8) NULL DEFAULT 0 COMMENT '优惠' AFTER `discount1`;
	
	
	
	
# company_distribution_same_city
-- 新增新字段
ALTER TABLE `btsaas`.`company_distribution_same_city` 
	MODIFY COLUMN `starting_price` decimal(28, 8) NULL DEFAULT 0 COMMENT '起送价格' AFTER `remarks`,
	ADD COLUMN `kilometers_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '公里数' AFTER `kilometers`,
	MODIFY COLUMN `delivery_price` decimal(28, 8) NULL  DEFAULT 0 COMMENT '起步价' AFTER `kilometers`,
	ADD COLUMN `kilometers_more_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '每超出公里数' AFTER `kilometers_more`,
	MODIFY COLUMN `delivery_price_more` decimal(28, 8) NULL DEFAULT 0 COMMENT '每超出公里数费用' AFTER `kilometers_more_temp0`;
	ADD COLUMN `ranges_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '配送范围' AFTER `ranges`;
	
-- 赋值新字段
UPDATE company_distribution_same_city cdsc SET 
	cdsc.kilometers_temp0 = 
	(CASE
		WHEN cdsc.kilometers IS NULL THEN
			0.00000000
		ELSE
			cdsc.kilometers
	END),
	cdsc.kilometers_more_temp0 = 
	(CASE
		WHEN cdsc.kilometers_more IS NULL THEN
			0.00000000
		ELSE
			cdsc.kilometers_more
	END),
	cdsc.ranges_temp0 = 
	(CASE
		WHEN cdsc.ranges IS NULL THEN
			0.00000000
		ELSE
			cdsc.ranges
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`company_distribution_same_city` 
	CHANGE COLUMN `kilometers` `kilometers1` bigint(20) NULL DEFAULT NULL COMMENT '公里数' AFTER `starting_price`,
	CHANGE COLUMN `kilometers_more` `kilometers_more1` bigint(20) NULL DEFAULT NULL COMMENT '每超出公里数' AFTER `kilometers_temp0`,
	CHANGE COLUMN `ranges` `ranges1` int(20) NULL DEFAULT NULL COMMENT '配送范围' AFTER `latitude`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_distribution_same_city` 
	CHANGE COLUMN `kilometers_temp0` `kilometers` decimal(28, 8) NULL DEFAULT 0 COMMENT '公里数' AFTER `delivery_price`,
	CHANGE COLUMN `kilometers_more_temp0` `kilometers_more` decimal(28, 8) NULL DEFAULT 0 COMMENT '每超出公里数' AFTER `kilometers_more1`,
	CHANGE COLUMN `ranges_temp0` `ranges` decimal(28, 8) NULL DEFAULT 0 COMMENT '配送范围' AFTER `ranges1`;
	
	
	
	
# order_sub
-- 新增新字段
ALTER TABLE `btsaas`.`order_sub` 
	ADD COLUMN `product_count_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '订购产品数量' AFTER `product_count`,
	ADD COLUMN `product_amount_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '商品总价' AFTER `product_amount_total`,
	ADD COLUMN `waste_machining_fee_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '总废料加工费' AFTER `waste_machining_fee`,
	ADD COLUMN `discount_fee_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '优惠价格' AFTER `discount_fee`,
	ADD COLUMN `logistics_fee_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '物流费用' AFTER `logistics_fee`,
	ADD COLUMN `total_fee_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '合计费用(订单总价)' AFTER `total_fee`,
	ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '结存（kg）' AFTER `balance`,
	ADD COLUMN `approve_remark_total_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '订单备注审核数量' AFTER `approve_remark_total`;
	
-- 赋值新字段
UPDATE order_sub os SET 
	os.product_count_temp0 = 
	(CASE
		WHEN os.product_count IS NULL THEN
			0.00000000
		ELSE
			os.product_count
	END),
	os.product_amount_total_temp0 = 
	(CASE
		WHEN os.product_amount_total IS NULL THEN
			0.00000000
		ELSE
			os.product_amount_total/10000
	END),
	os.waste_machining_fee_temp0 = 
	(CASE
		WHEN os.waste_machining_fee IS NULL THEN
			0.00000000
		ELSE
			os.waste_machining_fee/10000
	END),
	os.discount_fee_temp0 = 
	(CASE
		WHEN os.discount_fee IS NULL THEN
			0.00000000
		ELSE
			os.discount_fee/100
	END),
	os.logistics_fee_temp0 = 
	(CASE
		WHEN os.logistics_fee IS NULL THEN
			0.00000000
		ELSE
			os.logistics_fee/10000
	END),
	os.total_fee_temp0 = 
	(CASE
		WHEN os.total_fee IS NULL THEN
			0.00000000
		ELSE
			os.total_fee/10000
	END),
	os.balance_temp0 = 
	(CASE
		WHEN os.balance IS NULL THEN
			0.00000000
		ELSE
			os.balance
	END),
	os.approve_remark_total_temp0 = 
	(CASE
		WHEN os.approve_remark_total IS NULL THEN
			0.00000000
		ELSE
			os.approve_remark_total
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_sub` 
	CHANGE COLUMN `product_count` `product_count1` int(9)  NULL COMMENT '订购产品数量' AFTER `pay_status`,
	CHANGE COLUMN `product_amount_total` `product_amount_total1` bigint(20)  NULL COMMENT '商品总价' AFTER `product_count_temp0`,
	CHANGE COLUMN `waste_machining_fee` `waste_machining_fee1` bigint(20)  NULL COMMENT '总废料加工费' AFTER `product_amount_total_temp0`,
	CHANGE COLUMN `discount_fee` `discount_fee1` bigint(20)  NULL COMMENT '优惠价格' AFTER `waste_machining_fee_temp0`,
	CHANGE COLUMN `logistics_fee` `logistics_fee1` int(9)  NULL COMMENT '物流费用' AFTER `discount_fee_temp0`,
	CHANGE COLUMN `total_fee` `total_fee1` bigint(20)  NULL COMMENT '合计费用(订单总价)' AFTER `logistics_fee_temp0`,
	CHANGE COLUMN `balance` `balance1` int(9)  NULL COMMENT '结存（kg）' AFTER `total_fee_temp0`,
	CHANGE COLUMN `approve_remark_total` `approve_remark_total1` int(9) NULL DEFAULT NULL COMMENT '订单备注审核数量' AFTER `customer_name`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_sub` 
	CHANGE COLUMN `product_count_temp0` `product_count` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购产品数量' AFTER `product_count1`,
	CHANGE COLUMN `product_amount_total_temp0` `product_amount_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `product_amount_total1`,
	CHANGE COLUMN `waste_machining_fee_temp0` `waste_machining_fee` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '总废料加工费' AFTER `waste_machining_fee1`,
	CHANGE COLUMN `discount_fee_temp0` `discount_fee` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠价格' AFTER `discount_fee1`,
	CHANGE COLUMN `logistics_fee_temp0` `logistics_fee` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '物流费用' AFTER `logistics_fee1`,
	CHANGE COLUMN `total_fee_temp0` `total_fee` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '合计费用(订单总价)' AFTER `total_fee1`,
	CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '结存（kg）' AFTER `balance1`,
	CHANGE COLUMN `approve_remark_total_temp0` `approve_remark_total` decimal(28, 8) NULL DEFAULT 0.00000000 COMMENT '订单备注审核数量' AFTER `approve_remark_total1`;
	
	
	
	
# project_goods
-- 新增新字段
ALTER TABLE `btsaas`.`project_goods` 
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '订购数量' AFTER `amount`,
	ADD COLUMN `price_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '商品总价' AFTER `price_total`,
	ADD COLUMN `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0 COMMENT '单价' AFTER `unit_price`,
	ADD COLUMN `wati_out_store_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '等待出库数量' AFTER `wati_out_store`,
	ADD COLUMN `discount_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '优惠' AFTER `discount`;
	
-- 赋值新字段
UPDATE project_goods pg SET 
	pg.amount_temp0 = 
	(CASE
		WHEN pg.amount IS NULL THEN
			0.00000000
		ELSE
			pg.amount
	END),
	pg.price_total_temp0 = 
	(CASE
		WHEN pg.price_total IS NULL THEN
			0.00000000
		ELSE
			pg.price_total/100
	END),
	pg.unit_price_temp0 = 
	(CASE
		WHEN pg.unit_price IS NULL THEN
			0.00000000
		ELSE
			pg.unit_price/100
	END),
	pg.wati_out_store_temp0 = 
	(CASE
		WHEN pg.wati_out_store IS NULL THEN
			0.00000000
		ELSE
			pg.wati_out_store
	END),
	pg.discount_temp0 = 
	(CASE
		WHEN pg.discount IS NULL THEN
			0.00000000
		ELSE
			pg.discount/100
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`project_goods` 
	CHANGE COLUMN `amount` `amount1` int(9) NULL COMMENT '订购数量' AFTER `sku_name`,
	CHANGE COLUMN `price_total` `price_total1` bigint(20) NULL COMMENT '商品总价' AFTER `amount_temp0`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(20) NULL COMMENT '单价' AFTER `price_total_temp0`,
	CHANGE COLUMN `wati_out_store` `wati_out_store1` int(9) NULL DEFAULT NULL COMMENT '等待出库数量' AFTER `unit`,
	CHANGE COLUMN `discount` `discount1` bigint(20) NULL DEFAULT NULL COMMENT '优惠' AFTER `wati_out_store_temp0`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`project_goods` 
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '订购数量' AFTER `amount1`,
	CHANGE COLUMN `price_total_temp0` `price_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' AFTER `price_total1`,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '单价' AFTER `unit_price1`,
	CHANGE COLUMN `wati_out_store_temp0` `wati_out_store` decimal(28, 8) NULL DEFAULT 0.00000000 COMMENT '等待出库数量' AFTER `wati_out_store1`,
	CHANGE COLUMN `discount_temp0` `discount` decimal(28, 8) NULL DEFAULT 0.00000000 COMMENT '优惠' AFTER `discount1`;
	
	
	
	
# project_template_goods
-- 新增新字段
ALTER TABLE `btsaas`.`project_template_goods` 
	MODIFY COLUMN `amount` int(9) NULL COMMENT '购买数量' AFTER `sku_id`,
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '购买数量' AFTER `amount`;
	
-- 赋值新字段
UPDATE project_template_goods PTG SET 
	PTG.amount_temp0 = 
	(CASE
		WHEN PTG.amount IS NULL THEN
			0.00000000
		ELSE
			PTG.amount
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`project_template_goods` 
	CHANGE COLUMN `amount` `amount1` int(9) NULL DEFAULT NULL COMMENT '购买数量' AFTER `sku_id`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`project_template_goods` 
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '购买数量' AFTER `amount1`;
	
	
	
	
# project_template
-- 新增新字段
ALTER TABLE `btsaas`.`project_template` 
	ADD COLUMN `product_price_total_temp0` decimal(28, 8) NULL DEFAULT 0 COMMENT '商品价格总和' AFTER `product_price_total`;

-- 赋值新字段
UPDATE project_template PT SET 
	PT.amount_temp0 = 
	(CASE
		WHEN PT.product_price_total IS NULL THEN
			0.00000000
		ELSE
			PT.product_price_total/100
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`project_template` 
	CHANGE COLUMN `product_price_total` `product_price_total1` bigint(20) NULL DEFAULT NULL COMMENT '商品价格总和' AFTER `template_name`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`project_template` 
	CHANGE COLUMN `product_price_total_temp0` `product_price_total` decimal(28, 8) NULL DEFAULT 0.00000000 COMMENT '商品价格总和' AFTER `product_price_total1`;




# order_auto_confirm_takedelivery
-- 新增新字段
ALTER TABLE `btsaas`.`order_auto_confirm_takedelivery` 
	ADD COLUMN `product_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `product_amount`;

-- 赋值新字段
UPDATE order_auto_confirm_takedelivery OACT SET 
	OACT.product_amount_temp0 = 
	(CASE
		WHEN OACT.product_amount IS NULL THEN
			0.00000000
		ELSE
			OACT.product_amount
	END);

-- 修改老字段名称
ALTER TABLE `btsaas`.`order_auto_confirm_takedelivery` 
	CHANGE COLUMN `product_amount` `product_amount1` int(9) NULL AFTER `awb_no`;

-- 修改新字段名称
ALTER TABLE `btsaas`.`order_auto_confirm_takedelivery` 
	CHANGE COLUMN `product_amount_temp0` `product_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `product_amount1`;	
	
























	