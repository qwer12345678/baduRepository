/**
 * ERP-其他模块小数点改造
 */
 
#################################################################采购

# 发起采购时发票快照表 
-- 新增字段
ALTER TABLE `btsaas`.`pe_purchase_bill_template` 
	ADD bill_money_temp0 decimal(28, 8) DEFAULT NULL AFTER bill_money;
	
-- 赋值新字段
update pe_purchase_bill_template ppbt set 
	ppbt.bill_money_temp0 = ppbt.bill_money/100;

-- 修改老字段名称   
ALTER TABLE pe_purchase_bill_template 
	CHANGE bill_money bill_money1 bigint(15) DEFAULT NULL;

-- 修改新字段名称
ALTER TABLE pe_purchase_bill_template
	CHANGE bill_money_temp0 bill_money decimal(28, 8) DEFAULT NULL;




# distribution_withdraw
-- 新增字段
ALTER TABLE `btsaas`.`distribution_withdraw` 
	ADD `total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `total`,
	ADD `commission_charges_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `commission_charges`,
	ADD `commission_charges_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `commission_charges_total`;
	
-- 赋值新字段
update distribution_withdraw dw set 
	dw.total_temp0 = dw.total/100,
	dw.commission_charges_temp0 = dw.commission_charges/100,
	dw.commission_charges_total_temp0 = dw.commission_charges_total/100;
	
-- 修改老字段名称   
ALTER TABLE distribution_withdraw 
	CHANGE total1 total bigint(15) NOT NULL DEFAULT '0',
	CHANGE commission_charges1 commission_charges int(9) NOT NULL DEFAULT '0',
	CHANGE commission_charges_total1 commission_charges_total bigint(19) NOT NULL DEFAULT '0';

-- 修改新字段名称
ALTER TABLE distribution_withdraw 
	CHANGE total_temp0 total decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	CHANGE commission_charges_temp0 commission_charges decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	CHANGE commission_charges_total_temp0 commission_charges_total decimal(28, 8) NOT NULL DEFAULT 0.00000000;
	
	
	

-- DistributionRecordServiceImpl
-- DistributionWithdrawServiceImpl
-- BuyBdsaasServiceInfoServiceImpl
-- DistributionProfileProductServiceImpl
-- AgentCustomReportServiceImpl
-- AgentRebateRecordServiceImpl
-- AgentDepositRecordServiceImpl
-- AgencyNewProfileServiceImpl
-- UsrAgentServiceImpl




















