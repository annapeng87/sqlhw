CREATE VIEW isolate as
select cc.card, cc.id_card_holder, t.id, t.date, t.amount, t.id_merchant
from credit_card as cc
inner join transactions as t on t.card = cc.card
where cc.id_card_holder = 1


CREATE VIEW time_slice as
select t.amount, t.date
from transactions as t
where t.date > '2018-01-01 7:00:00'
	and t.date < '2019-01-01 9:00:00'
order by t.amount desc
limit 100

CREATE VIEW small_transactions as
select t.amount, mc.id
from transactions as t, merchant_category as mc
where t.amount < '2'
order by mc.id, t.amount 

--350 transactions in merchant id 1
--350 transactions in merchant id 2
--350 transactions in merchant id 3
--350 transactions in merchant id 4
--350 transactions in merchant id 5
--all merchants had the same amount of transactions under 2 dollars. 

