/**
 * ERP-财务模块小数点改造
 */
 
#################################################################财务

# company_pay_account
-- 新增字段
ALTER TABLE `btsaas`.`company_pay_account` 
	ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '余额' AFTER `balance`;


-- 赋值新字段
update company_pay_account cpa set cpa.balance_temp0 = 
	(CASE
		WHEN cpa.balance IS NULL THEN
			0.00000000
		WHEN cpa.balance = 0 THEN
			0.00000000
		ELSE
			(cpa.balance / 100)
	END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_pay_account` 
	CHANGE COLUMN `balance` `balance1` bigint(15) NULL DEFAULT 0 COMMENT '余额';


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_pay_account` 
	CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '余额';




# fin_account
-- 新增字段
ALTER TABLE `btsaas`.`fin_account` 
	ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '账户总余额  实际充值金额 不包括赠送金额' AFTER `balance`,
	ADD COLUMN `frost_balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '冻结资金' AFTER `frost_balance`,
	ADD COLUMN `redwallet_balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '赠送的资金' AFTER `redwallet_balance`,
	ADD COLUMN `pwd_required_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `pwd_required_amount`;


-- 赋值新字段
update fin_account fa set fa.balance_temp0 = 
	(CASE
		WHEN fa.balance IS NULL THEN
			0.00000000
		WHEN fa.balance = 0 THEN
			0.00000000
		ELSE
			(fa.balance / 100)
	END);

update fin_account fa set fa.frost_balance_temp0 = 
	(CASE
		WHEN fa.frost_balance IS NULL THEN
			0.00000000
		WHEN fa.frost_balance = 0 THEN
			0.00000000
		ELSE
			(fa.frost_balance / 100)
	END);

update fin_account fa set fa.redwallet_balance_temp0 = 
	(CASE
		WHEN fa.redwallet_balance IS NULL THEN
			0.00000000
		WHEN fa.redwallet_balance = 0 THEN
			0.00000000
		ELSE
			(fa.redwallet_balance / 100)
	END);

update fin_account fa set fa.pwd_required_amount_temp0 = 
	(CASE
		WHEN fa.pwd_required_amount IS NULL THEN
			0.00000000
		WHEN fa.pwd_required_amount = 0 THEN
			0.00000000
		ELSE
			(fa.pwd_required_amount / 100)
	END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`fin_account` 
	CHANGE COLUMN `balance` `balance1` bigint(15) UNSIGNED NULL DEFAULT 0 COMMENT '账户总余额  实际充值金额 不包括赠送金额',
	CHANGE COLUMN `frost_balance` `frost_balance1` bigint(15) UNSIGNED NULL DEFAULT 0 COMMENT '冻结资金' ,
	CHANGE COLUMN `redwallet_balance` `redwallet_balance1` bigint(15) UNSIGNED NULL DEFAULT 0 COMMENT '赠送的资金',
	CHANGE COLUMN `pwd_required_amount` `pwd_required_amount1` bigint(15) NULL DEFAULT 0 COMMENT '未知 ';

-- 修改新字段名称
ALTER TABLE `btsaas`.`fin_account` 
	CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '账户总余额  实际充值金额 不包括赠送金额', 
	CHANGE COLUMN `frost_balance_temp0` `frost_balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '冻结资金',
	CHANGE COLUMN `redwallet_balance_temp0` `redwallet_balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '赠送的资金',
	CHANGE COLUMN `pwd_required_amount_temp0` `pwd_required_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# custom_account_setting
-- 新增字段
ALTER TABLE `btsaas`.`custom_account_setting` 
	ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '余额' AFTER `balance`;

-- 赋值新字段
update custom_account_setting cas set cas.balance_temp0 = 
	(CASE
		WHEN cas.balance IS NULL THEN
			0.00000000
		WHEN cas.balance = 0 THEN
			0.00000000
		ELSE
			(cas.balance / 100)
	END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`custom_account_setting` 
CHANGE COLUMN `balance` `balance1` bigint(20) NULL DEFAULT 0 ;

-- 修改新字段名称
ALTER TABLE `btsaas`.`custom_account_setting` 
CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '余额';




# company_pay_record
-- 新增字段
ALTER TABLE `btsaas`.`company_pay_record` 
	ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '金额' AFTER `money`;


-- 赋值新字段
update company_pay_record cpr set cpr.money_temp0 = 
	(CASE
		WHEN cpr.money IS NULL THEN
			0.00000000
		WHEN cpr.money = 0 THEN
			0.00000000
		ELSE
			(cpr.money / 100)
	END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_pay_record` 
	CHANGE COLUMN `money` `money1` bigint(20) NULL COMMENT '未知 ';

-- 修改新字段名称
ALTER TABLE `btsaas`.`company_pay_record` 
	CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# company_pay_withdraw
-- 新增字段
ALTER TABLE `btsaas`.`company_pay_withdraw` 
	ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '金额' AFTER `money`,
	ADD COLUMN `return_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `return_money`;


-- 赋值新字段
update company_pay_withdraw cpw set cpw.money_temp0 = 
	(CASE
		WHEN cpw.money IS NULL THEN
			0.00000000
		WHEN cpw.money = 0 THEN
			0.00000000
		ELSE
			(cpw.money / 100)
	END);

update company_pay_withdraw cpw set cpw.return_money_temp0 = 
	(CASE
		WHEN cpw.return_money IS NULL THEN
			0.00000000
		WHEN cpw.return_money = 0 THEN
			0.00000000
		ELSE
			(cpw.return_money / 100)
	END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_pay_withdraw` 
	CHANGE COLUMN `money` `money1` bigint(20) NULL COMMENT '未知 ';


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_pay_withdraw` 
	CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# fin_offline_recharge_record
-- 新增字段
ALTER TABLE `btsaas`.`fin_offline_recharge_record` 
	ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '打款金额' AFTER `amount`;


-- 赋值新字段
update fin_offline_recharge_record forr set forr.amount_temp0 = 
	(CASE
		WHEN forr.amount IS NULL THEN
			0.00000000
		WHEN forr.amount = 0 THEN
			0.00000000
		ELSE
			(forr.amount / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`fin_offline_recharge_record` 
	CHANGE COLUMN `amount` `amount1` bigint(19) NULL DEFAULT 0 COMMENT '打款金额' COMMENT '未知 ';


-- 修改新字段名称
ALTER TABLE `btsaas`.`fin_offline_recharge_record` 
	CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# salesorder
-- 新增字段
ALTER TABLE `btsaas`.`salesorder` 
	ADD COLUMN `total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠前价格' AFTER `total`,
	ADD COLUMN `actual_paid_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `actual_paid`,
	ADD COLUMN `balance_paid_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `balance_paid`,
	ADD COLUMN `redwallet_paid_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `redwallet_paid`,
	ADD COLUMN `refund_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `refund`;


-- 赋值新字段
update salesorder so set so.total_temp0 = 
	(CASE
		WHEN so.total IS NULL THEN
			0.00000000
		WHEN so.total = 0 THEN
			0.00000000
		ELSE
			(so.total / 100)
	END);

update salesorder so set so.actual_paid_temp0 = 
	(CASE
		WHEN so.actual_paid IS NULL THEN
			0.00000000
		WHEN so.actual_paid = 0 THEN
			0.00000000
		ELSE
			(so.actual_paid / 100)
	END);

update salesorder so set so.balance_paid_temp0 = 
	(CASE
		WHEN so.balance_paid IS NULL THEN
			0.00000000
		WHEN so.balance_paid = 0 THEN
			0.00000000
		ELSE
			(so.balance_paid / 100)
	END);

update salesorder so set so.redwallet_paid_temp0 = 
	(CASE
		WHEN so.redwallet_paid IS NULL THEN
			0.00000000
		WHEN so.redwallet_paid = 0 THEN
			0.00000000
		ELSE
			(so.redwallet_paid / 100)
	END);

update salesorder so set so.refund_temp0 = 
	(CASE
		WHEN so.refund IS NULL THEN
			0.00000000
		WHEN so.refund = 0 THEN
			0.00000000
		ELSE
			(so.refund / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`salesorder` 
	CHANGE COLUMN `total` `total1` bigint(15) NULL COMMENT '优惠前价格';


-- 修改新字段名称
ALTER TABLE `btsaas`.`salesorder` 
	CHANGE COLUMN `total_temp0` `total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠前价格';




# fin_transaction
-- 新增字段
ALTER TABLE `btsaas`.`fin_transaction` 
ADD COLUMN `amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易金额' AFTER `amount`,
ADD COLUMN `tx_balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易后账户余额' AFTER `tx_balance`,
ADD COLUMN `tx_frost_balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易后冻结余额' AFTER `tx_frost_balance`,
ADD COLUMN `redwallet_tx_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `redwallet_tx_amount`,
ADD COLUMN `redwallet_balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `redwallet_balance`;


-- 赋值新字段
update fin_transaction ft set ft.amount_temp0 = 
(CASE
	WHEN ft.amount IS NULL THEN
		0.00000000
	WHEN ft.amount = 0 THEN
		0.00000000
	ELSE
		(ft.amount / 100)
END);

update fin_transaction ft set ft.tx_balance_temp0 = 
(CASE
	WHEN ft.tx_balance IS NULL THEN
		0.00000000
	WHEN ft.tx_balance = 0 THEN
		0.00000000
	ELSE
		(ft.tx_balance / 100)
END);

update fin_transaction ft set ft.tx_frost_balance_temp0 = 
(CASE
	WHEN ft.tx_frost_balance IS NULL THEN
		0.00000000
	WHEN ft.tx_frost_balance = 0 THEN
		0.00000000
	ELSE
		(ft.tx_frost_balance / 100)
END);

update fin_transaction ft set ft.redwallet_tx_amount_temp0 = 
(CASE
	WHEN ft.redwallet_tx_amount IS NULL THEN
		0.00000000
	WHEN ft.redwallet_tx_amount = 0 THEN
		0.00000000
	ELSE
		(ft.redwallet_tx_amount / 100)
END);

update fin_transaction ft set ft.redwallet_balance_temp0 = 
(CASE
	WHEN ft.redwallet_balance IS NULL THEN
		0.00000000
	WHEN ft.redwallet_balance = 0 THEN
		0.00000000
	ELSE
		(ft.redwallet_balance / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`fin_transaction` 
CHANGE COLUMN `amount` `amount1` bigint(15) NULL COMMENT '交易金额' ,
CHANGE COLUMN `tx_balance` `tx_balance1` bigint(15) UNSIGNED NULL COMMENT '交易后账户余额' ,
CHANGE COLUMN `tx_frost_balance` `tx_frost_balance1` bigint(15) UNSIGNED NULL DEFAULT 0 COMMENT '交易后冻结余额' ,
CHANGE COLUMN `redwallet_tx_amount` `redwallet_tx_amount1` bigint(15) NULL DEFAULT NULL COMMENT '未知 ',
CHANGE COLUMN `redwallet_balance` `redwallet_balance1` bigint(15) UNSIGNED NULL DEFAULT NULL COMMENT '未知 ',
CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';


-- 修改新字段名称
ALTER TABLE `btsaas`.`fin_transaction` 
CHANGE COLUMN `amount_temp0` `amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易金额',
CHANGE COLUMN `tx_balance_temp0` `tx_balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易后账户余额',
CHANGE COLUMN `tx_frost_balance_temp0` `tx_frost_balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '交易后冻结余额',
CHANGE COLUMN `redwallet_tx_amount_temp0` `redwallet_tx_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知',
CHANGE COLUMN `redwallet_balance_temp0` `redwallet_balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# company_agent_setting
-- 新增字段
ALTER TABLE `btsaas`.`company_agent_setting` 
ADD COLUMN `report_custom_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `report_custom_money`,
ADD COLUMN `custom_pay_percent_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `custom_pay_percent`,
ADD COLUMN `report_agent_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `report_agent_money`,
ADD COLUMN `agent_custom_pay_percent_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `agent_custom_pay_percent`;

-- 赋值新字段
update company_agent_setting cas set cas.report_custom_money_temp0 = 
(CASE
	WHEN cas.report_custom_money IS NULL THEN
		0.00000000
	WHEN cas.report_custom_money = 0 THEN
		0.00000000
	ELSE
		(cas.report_custom_money / 100)
END);

update company_agent_setting cas set cas.custom_pay_percent_temp0 = 
(CASE
	WHEN cas.custom_pay_percent IS NULL THEN
		0.00000000
	WHEN cas.custom_pay_percent = 0 THEN
		0.00000000
	ELSE
		cas.custom_pay_percent
END);

update company_agent_setting cas set cas.report_agent_money_temp0 = 
(CASE
	WHEN cas.report_agent_money IS NULL THEN
		0.00000000
	WHEN cas.report_agent_money = 0 THEN
		0.00000000
	ELSE
		(cas.report_agent_money / 100)
END);

update company_agent_setting cas set cas.agent_custom_pay_percent_temp0 = 
(CASE
	WHEN cas.agent_custom_pay_percent IS NULL THEN
		0.00000000
	WHEN cas.agent_custom_pay_percent = 0 THEN
		0.00000000
	ELSE
		cas.agent_custom_pay_percent
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_agent_setting` 
CHANGE COLUMN `report_custom_money` `report_custom_money1` bigint(20) NULL COMMENT '未知 ',
CHANGE COLUMN `custom_pay_percent` `custom_pay_percent1` double NULL COMMENT '未知 ',
CHANGE COLUMN `report_agent_money` `report_agent_money1` bigint(20) NULL COMMENT '未知 ',
CHANGE COLUMN `agent_custom_pay_percent` `agent_custom_pay_percent1` double NULL COMMENT '未知 ';


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_agent_setting` 
CHANGE COLUMN `report_custom_money_temp0` `report_custom_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知',
CHANGE COLUMN `custom_pay_percent_temp0` `custom_pay_percent` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知',
CHANGE COLUMN `report_agent_money_temp0` `report_agent_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知',
CHANGE COLUMN `agent_custom_pay_percent_temp0` `agent_custom_pay_percent` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# agent_rebate_record
-- 新增字段
ALTER TABLE `btsaas`.`agent_rebate_record` 
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `money`,
ADD COLUMN `actual_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `actual_money`;


-- 赋值新字段
update agent_rebate_record arr set arr.money_temp0 = 
(CASE
	WHEN arr.money IS NULL THEN
		0.00000000
	WHEN arr.money = 0 THEN
		0.00000000
	ELSE
		(arr.money / 100)
END);

update agent_rebate_record arr set arr.actual_money_temp0 = 
(CASE
	WHEN arr.actual_money IS NULL THEN
		0.00000000
	WHEN arr.actual_money = 0 THEN
		0.00000000
	ELSE
		(arr.actual_money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`agent_rebate_record` 
CHANGE COLUMN `money` `money1` bigint(20) NULL COMMENT '未知 ',
CHANGE COLUMN `actual_money` `actual_money1` bigint(20) NULL DEFAULT NULL COMMENT '未知 ';


-- 修改新字段名称
ALTER TABLE `btsaas`.`agent_rebate_record` 
CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知',
CHANGE COLUMN `actual_money_temp0` `actual_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '未知';




# usr_custom
-- 新增字段
ALTER TABLE `btsaas`.`usr_custom` 
ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '金额' AFTER `balance`,
ADD COLUMN `custom_limit_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '额度' AFTER `custom_limit`,
ADD COLUMN `before_period_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额' AFTER `before_period_money`;


-- 赋值新字段
update usr_custom uc set uc.balance_temp0 = 
(CASE
	WHEN uc.balance IS NULL THEN
		0.00000000
	WHEN uc.balance = 0 THEN
		0.00000000
	ELSE
		(uc.balance / 100)
END);

update usr_custom uc set uc.custom_limit_temp0 = 
(CASE
	WHEN uc.custom_limit IS NULL THEN
		0.00000000
	WHEN uc.custom_limit = 0 THEN
		0.00000000
	ELSE
		(uc.custom_limit / 100)
END);

update usr_custom uc set uc.before_period_money_temp0 = 
(CASE
	WHEN uc.before_period_money IS NULL THEN
		0.00000000
	WHEN uc.before_period_money = 0 THEN
		0.00000000
	ELSE
		(uc.before_period_money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`usr_custom` 
CHANGE COLUMN `balance` `balance1` bigint(20) NULL COMMENT '客户金额' ,
CHANGE COLUMN `custom_limit` `custom_limit1` bigint(20) NULL DEFAULT 0 COMMENT '客户限制',
CHANGE COLUMN `before_period_money` `before_period_money1` bigint(20) NULL DEFAULT 0 COMMENT '期初金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`usr_custom` 
CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '客户金额',
CHANGE COLUMN `custom_limit_temp0` `custom_limit` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '客户限制',
CHANGE COLUMN `before_period_money_temp0` `before_period_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额';


# usr_custom_record
-- 新增字段
ALTER TABLE `btsaas`.`usr_custom_record` 
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '金额' AFTER `money`,
ADD COLUMN `balance_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '金额' AFTER `balance`,
ADD COLUMN `give_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '储值金 (赠送金额/免费兑换金额)' AFTER `give_money`;


-- 赋值新字段
update usr_custom_record ucr set ucr.balance_temp0 = 
(CASE
	WHEN ucr.balance IS NULL THEN
		0.00000000
	WHEN ucr.balance = 0 THEN
		0.00000000
	ELSE
		(ucr.balance / 100)
END);

update usr_custom_record ucr set ucr.money_temp0 = 
(CASE
	WHEN ucr.money IS NULL THEN
		0.00000000
	WHEN ucr.money = 0 THEN
		0.00000000
	ELSE
		(ucr.money / 100)
END);

update usr_custom_record ucr set ucr.give_money_temp0 = 
(CASE
	WHEN ucr.give_money IS NULL THEN
		0.00000000
	WHEN ucr.give_money = 0 THEN
		0.00000000
	ELSE
		(ucr.give_money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`usr_custom_record` 
CHANGE COLUMN `money` `money1` bigint(20) NULL COMMENT '支付金额', 
CHANGE COLUMN `balance` `balance1` bigint(20) NULL DEFAULT NULL COMMENT '余额',
CHANGE COLUMN `give_money` `give_money1` bigint(20) NULL DEFAULT 0 COMMENT '储值金 (赠送金额/免费兑换金额)' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`usr_custom_record` 
CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '支付金额',
CHANGE COLUMN `balance_temp0` `balance` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '余额',
CHANGE COLUMN `give_money_temp0` `give_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '储值金 (赠送金额/免费兑换金额)';




# usr_custom_receipt_record
-- 新增字段
ALTER TABLE `btsaas`.`usr_custom_receipt_record` 
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '收款金额' AFTER `money`;


-- 赋值新字段
update usr_custom_receipt_record ucrr set ucrr.money_temp0 = 
(CASE
	WHEN ucrr.money IS NULL THEN
		0.00000000
	WHEN ucrr.money = 0 THEN
		0.00000000
	ELSE
		(ucrr.money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`usr_custom_receipt_record` 
CHANGE COLUMN `money` `money1` bigint(20) NULL DEFAULT 0 COMMENT '收款金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`usr_custom_receipt_record` 
CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '收款金额';




# company_supplier_pay_record
-- 新增字段
ALTER TABLE `btsaas`.`company_supplier_pay_record` 
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '付款金额' AFTER `money`,
ADD COLUMN `actual_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '申请付款金额' AFTER `actual_amount`;


-- 赋值新字段
update company_supplier_pay_record cspr set cspr.money_temp0 = 
(CASE
	WHEN cspr.money IS NULL THEN
		0.00000000
	WHEN cspr.money = 0 THEN
		0.00000000
	ELSE
		(cspr.money / 100)
END);

update company_supplier_pay_record cspr set cspr.actual_amount_temp0 = 
(CASE
	WHEN cspr.actual_amount IS NULL THEN
		0.00000000
	WHEN cspr.actual_amount = 0 THEN
		0.00000000
	ELSE
		(cspr.actual_amount / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_supplier_pay_record` 
CHANGE COLUMN `money` `money1` bigint(20) NULL DEFAULT 0 COMMENT '付款金额' ,
CHANGE COLUMN `actual_amount` `actual_amount1` bigint(25) NULL DEFAULT 0 COMMENT '申请付款金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_supplier_pay_record` 
CHANGE COLUMN `money_temp0` `money` bigint(20) NULL DEFAULT 0 COMMENT '付款金额' ,
CHANGE COLUMN `actual_amount_temp0` `actual_amount` bigint(25) NULL DEFAULT 0 COMMENT '申请付款金额' ;




# pe_offline_supplier
-- 新增字段
ALTER TABLE `btsaas`.`pe_offline_supplier` 
ADD COLUMN `before_period_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额' AFTER `before_period_money`;


-- 赋值新字段
update pe_offline_supplier pos set pos.before_period_money_temp0 = 
(CASE
	WHEN pos.before_period_money IS NULL THEN
		0.00000000
	WHEN pos.before_period_money = 0 THEN
		0.00000000
	ELSE
		(pos.before_period_money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`pe_offline_supplier` 
CHANGE COLUMN `before_period_money` `before_period_money1` bigint(20) NULL DEFAULT 0 COMMENT '期初金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`pe_offline_supplier` 
CHANGE COLUMN `before_period_money_temp0` `before_period_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额';




# company_custom_link
-- 新增字段
ALTER TABLE `btsaas`.`company_custom_link` 
ADD COLUMN `before_period_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额' AFTER `before_period_money`;


-- 赋值新字段
update company_custom_link ccl set ccl.before_period_money_temp0 = 
(CASE
	WHEN ccl.before_period_money IS NULL THEN
		0.00000000
	WHEN ccl.before_period_money = 0 THEN
		0.00000000
	ELSE
		(ccl.before_period_money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_custom_link` 
CHANGE COLUMN `before_period_money` `before_period_money1` bigint(20) NULL DEFAULT 0 COMMENT '期初金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_custom_link` 
CHANGE COLUMN `before_period_money_temp0` `before_period_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '期初金额';




# company_adjust_account_record
-- 新增字段
ALTER TABLE `btsaas`.`company_adjust_account_record` 
ADD COLUMN `increase_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应收/付款增加' AFTER `increase_money`,
ADD COLUMN `reduce_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应收/付款减少' AFTER `reduce_money`,
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '调账金额' AFTER `money`;


-- 赋值新字段
update company_adjust_account_record caar set caar.increase_money_temp0 = 
(CASE
	WHEN caar.increase_money IS NULL THEN
		0.00000000
	WHEN caar.increase_money = 0 THEN
		0.00000000
	ELSE
		(caar.increase_money / 100)
END);

update company_adjust_account_record caar set caar.reduce_money_temp0 = 
(CASE
	WHEN caar.reduce_money IS NULL THEN
		0.00000000
	WHEN caar.reduce_money = 0 THEN
		0.00000000
	ELSE
		(caar.reduce_money / 100)
END);

update company_adjust_account_record caar set caar.money_temp0 = 
(CASE
	WHEN caar.money IS NULL THEN
		0.00000000
	WHEN caar.money = 0 THEN
		0.00000000
	ELSE
		(caar.money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_adjust_account_record` 
CHANGE COLUMN `increase_money` `increase_money1` bigint(20) NULL DEFAULT 0 COMMENT '应收/付款增加' , 
CHANGE COLUMN `reduce_money` `reduce_money1` bigint(20) NULL DEFAULT 0 COMMENT '应收/付款减少';


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_adjust_account_record` 
CHANGE COLUMN `increase_money_temp0` `increase_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应收/付款增加',
CHANGE COLUMN `reduce_money_temp0` `reduce_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应收/付款增加';




# company_custom_compare_account_record
-- 新增字段
ALTER TABLE `btsaas`.`company_custom_compare_account_record` 
ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应收金额' AFTER `money`;


-- 赋值新字段
update company_custom_compare_account_record cccar set cccar.money_temp0 = 
(CASE
	WHEN cccar.money IS NULL THEN
		0.00000000
	WHEN cccar.money = 0 THEN
		0.00000000
	ELSE
		(cccar.money / 100)
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_custom_compare_account_record` 
CHANGE COLUMN `money` `money1` bigint(20) NULL COMMENT '应付金额' ;


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_custom_compare_account_record` 
CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '应付金额';




# company_pay_stage
-- 新增字段
ALTER TABLE `btsaas`.`company_pay_stage` 
	ADD COLUMN `appoint_money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 AFTER `appoint_money1`;


-- 赋值新字段
update company_pay_stage cps set cps.appoint_money_temp0 = 
	(CASE
		WHEN cps.appoint_money IS NULL THEN
			0.00000000
		WHEN cps.appoint_money = 0 THEN
			0.00000000
		ELSE
			(cps.appoint_money / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`company_custom_compare_account_record` 
	CHANGE COLUMN `appoint_money` `money1` bigint(20) NULL COMMENT '应收金额' AFTER `custom_name`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`company_custom_compare_account_record` 
	CHANGE COLUMN `appoint_money_temp0` `appoint_money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ;




# finance_invoice
-- 新增字段
ALTER TABLE `btsaas`.`finance_invoice` 
	ADD COLUMN `money_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '开票金额' ,
	ADD COLUMN `discount_amount_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠金额' ;


-- 赋值新字段
update finance_invoice fi set fi.money_temp0 = 
	(CASE
		WHEN fi.money IS NULL THEN
			0.00000000
		WHEN fi.money = 0 THEN
			0.00000000
		ELSE
			(fi.money / 100)
	END);

update finance_invoice fi set fi.discount_amount_temp0 = 
	(CASE
		WHEN fi.discount_amount IS NULL THEN
			0.00000000
		WHEN fi.discount_amount = 0 THEN
			0.00000000
		ELSE
			(fi.discount_amount / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`finance_invoice` 
	CHANGE COLUMN `money` `money1` bigint(20) NULL DEFAULT 0 COMMENT '开票金额' AFTER `order_no`,
	CHANGE COLUMN `discount_amount` `discount_amount1` bigint(20) NULL DEFAULT 0 COMMENT '优惠金额' AFTER `invoice_number`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`finance_invoice` 
	CHANGE COLUMN `money_temp0` `money` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '开票金额' ,
	CHANGE COLUMN `discount_amount_temp0` `discount_amount` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '优惠金额' ;




# finance_invoice
-- 新增字段
ALTER TABLE `btsaas`.`project_main` 
	ADD COLUMN `classify_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '分类总数' ,
	ADD COLUMN `product_count_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品总数',
	ADD COLUMN `product_amount_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' ,
	ADD COLUMN `order_amount_total_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	ADD COLUMN `logistics_fee_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '运费';


-- 赋值新字段
update project_main pm set pm.classify_total_temp0 = 
	(CASE
		WHEN pm.classify_total IS NULL THEN
			0.00000000
		WHEN pm.classify_total = 0 THEN
			0.00000000
		ELSE
			pm.classify_total
	END);

update project_main pm set pm.product_count_temp0 = 
	(CASE
		WHEN pm.product_count IS NULL THEN
			0.00000000
		WHEN pm.product_count = 0 THEN
			0.00000000
		ELSE
			pm.product_count
	END);

update project_main pm set pm.product_amount_total_temp0 = 
	(CASE
		WHEN pm.product_amount_total IS NULL THEN
			0.00000000
		WHEN pm.product_amount_total = 0 THEN
			0.00000000
		ELSE
			(pm.product_amount_total / 100)
	END);

update project_main pm set pm.order_amount_total_temp0 = 
	(CASE
		WHEN pm.order_amount_total IS NULL THEN
			0.00000000
		WHEN pm.order_amount_total = 0 THEN
			0.00000000
		ELSE
			(pm.order_amount_total / 100)
	END);

update project_main pm set pm.logistics_fee_temp0 = 
	(CASE
		WHEN pm.logistics_fee IS NULL THEN
			0.00000000
		WHEN pm.logistics_fee = 0 THEN
			0.00000000
		ELSE
			(pm.logistics_fee / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`project_main` 
	CHANGE COLUMN `classify_total` `classify_total1` int(9) NULL COMMENT '分类总数' AFTER `project_name`,
	CHANGE COLUMN `product_count` `product_count1` int(9) NULL COMMENT '产品总数' AFTER `classify_total1`,
	CHANGE COLUMN `product_amount_total` `product_amount_total1` bigint(20) NULL COMMENT '商品总价' AFTER `product_count1`,
	CHANGE COLUMN `order_amount_total` `order_amount_total1` bigint(20) NULL AFTER `product_amount_total1`,
	CHANGE COLUMN `logistics_fee` `logistics_fee1` int(9) NULL DEFAULT NULL COMMENT '运费' AFTER `attachment_id`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`project_main` 
	CHANGE COLUMN `classify_total_temp0` `classify_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '分类总数' ,
	CHANGE COLUMN `product_count_temp0` `product_count` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '产品总数',
	CHANGE COLUMN `product_amount_total_temp0` `product_amount_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '商品总价' ,
	CHANGE COLUMN `order_amount_total_temp0` `order_amount_total` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	CHANGE COLUMN `logistics_fee_temp0` `logistics_fee` decimal(28, 8) NOT NULL DEFAULT 0.00000000 COMMENT '运费';




# finance_invoice
-- 新增字段
ALTER TABLE `btsaas`.`service_market` 
	ADD COLUMN `default_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	ADD COLUMN `service_discount_temp0` decimal(28, 8) NOT NULL DEFAULT 1.00000000 ;


-- 赋值新字段
update service_market sm set sm.default_price_temp0 = 
	(CASE
		WHEN sm.default_price IS NULL THEN
			0.00000000
		WHEN sm.default_price = 0 THEN
			0.00000000
		ELSE
			(sm.default_price / 100)
	END);

update service_market sm set sm.service_discount_temp0 = 
	(CASE
		WHEN sm.service_discount IS NULL THEN
			0.00000000
		WHEN sm.service_discount = 0 THEN
			0.00000000
		ELSE
			(sm.service_discount / 100)
	END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`service_market` 
	CHANGE COLUMN `default_price` `default_price1` bigint(15) NULL AFTER `service_name`,
	CHANGE COLUMN `service_discount` `service_discount1` int(9) NULL DEFAULT 100 AFTER `version`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`service_market` 
	CHANGE COLUMN `default_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	CHANGE COLUMN `service_discount_temp0` decimal(28, 8) NOT NULL DEFAULT 1.00000000 ;




# service_market_param
-- 新增字段
ALTER TABLE `btsaas`.`service_market_param` 
	ADD COLUMN `defaut_value_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	ADD COLUMN `max_value_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	ADD COLUMN `unit_price_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	ADD COLUMN `min_value_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ;


-- 赋值新字段
update service_market_param smp set smp.defaut_value = 
(CASE
	WHEN smp.defaut_value IS NULL THEN
		0.00000000
	WHEN smp.defaut_value = 0 THEN
		0.00000000
	ELSE
		smp.defaut_value
END);

update service_market_param smp set smp.max_value = 
(CASE
	WHEN smp.max_value IS NULL THEN
		0.00000000
	WHEN smp.max_value = 0 THEN
		0.00000000
	ELSE
		smp.max_value
END);

update service_market_param smp set smp.unit_price = 
(CASE
	WHEN smp.unit_price IS NULL THEN
		0.00000000
	WHEN smp.unit_price = 0 THEN
		0.00000000
	ELSE
		(smp.unit_price / 100)
END);

update service_market_param smp set smp.min_value = 
(CASE
	WHEN smp.min_value IS NULL THEN
		0.00000000
	WHEN smp.min_value = 0 THEN
		0.00000000
	ELSE
		smp.min_value
END);


-- 修改老字段名称   
ALTER TABLE `btsaas`.`service_market_param` 
	CHANGE COLUMN `defaut_value` `defaut_value1` int(9) NULL AFTER `consumption_type_cd`,
	CHANGE COLUMN `max_value` `max_value1` int(9) NULL DEFAULT NULL AFTER `defaut_value1`,
	CHANGE COLUMN `unit_price` `unit_price1` bigint(15) NULL AFTER `max_value1`,
	CHANGE COLUMN `min_value` `min_value1` int(9) NULL AFTER `version`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`service_market_param` 
	CHANGE COLUMN `defaut_value_temp0` `defaut_value` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	CHANGE COLUMN `max_value_temp0` `max_value` idecimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	CHANGE COLUMN `unit_price_temp0` `unit_price` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ,
	CHANGE COLUMN `min_value_temp0` `min_value` decimal(28, 8) NOT NULL DEFAULT 0.00000000 ;




# service_activation_code
-- 新增字段
ALTER TABLE `btsaas`.`service_activation_code` 
	ADD COLUMN `user_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	ADD COLUMN `cus_num_temp0` decimal(28, 8) NOT NULL DEFAULT 0.00000000;


-- 赋值新字段
update service_activation_code sac set sac.user_num_temp0 = 
(CASE
	WHEN sac.user_num IS NULL THEN
		0.00000000
	WHEN sac.user_num = 0 THEN
		0.00000000
	ELSE
		sac.user_num
END);

update service_activation_code sac set cus_num_temp0 = 
(CASE
	WHEN sac.cus_num IS NULL THEN
		0.00000000
	WHEN sac.cus_num = 0 THEN
		0.00000000
	ELSE
		sac.cus_num
END);

-- 修改老字段名称   
ALTER TABLE `btsaas`.`service_activation_code` 
	CHANGE COLUMN `user_num` `user_num1` int(9) NULL AFTER `service_code`,
	CHANGE COLUMN `cus_num` `cus_num1` int(12) NULL AFTER `store`;


-- 修改新字段名称
ALTER TABLE `btsaas`.`service_activation_code` 
	CHANGE COLUMN `user_num_temp0` `user_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000,
	CHANGE COLUMN `cus_num_temp0` `cus_num` decimal(28, 8) NOT NULL DEFAULT 0.00000000;

