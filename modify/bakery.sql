/*
 For each pastry flavor which is found in more than three types of
 pastries sold by the bakery, report the average price of an item of this
 flavor and the total number of different pastrties of this flavor on the
 menu. Sort the output in ascending order by the average price
*/

select flavor, count(id) as count, avg(price) as avg_price from goods
group by flavor
having count > 3
order by avg_price asc;

/*
 Find the total amount of money the bakery earned between October
 10, 2007 and October 15, 2007 (inclusive). Report just the amount.
*/

select sum(price) as earned from receipts
inner join receipt_items
on receipt_items.receipt_id=receipts.id
inner join goods
on goods.id=receipt_items.good_id
where date >= "2007-10-10"
and date <= "2007-10-15";


/*
 For each purchase made by CHARLENE MESDAQ output the receipt number,
 the date of purchase, the total number of items purchased and
 the amount paid. Sort in descending order by the amount paid.
*/

select receipts.id, receipts.date, count(receipt_items.id) as items_purchased, sum(goods.price) as amount_paid from customers
inner join receipts
on receipts.customer_id=customers.id
inner join receipt_items
on receipt_items.receipt_id=receipts.id
inner join goods
on receipt_items.good_id=goods.id
where last_name="MESDAQ"
and first_name="CHARLENE"
group by receipts.id
order by amount_paid desc;
