select snum,sname from salespeople where (select count(customers.snum) from customers where salespeople.snum = customers.snum group by customers.snum) > 1;
