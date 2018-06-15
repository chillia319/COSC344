select snum, amt from orders where amt = (select max(amt) from orders i where i.snum = orders.snum) order by snum, amt;
select snum, amt from orders where (amt = (select max(amt) from orders i where i.snum = orders.snum)) AND (amt > 3000) order by snum,amt;
select fname, lname, salary from employee order by salary, lname;
select o.onum,c.cname, o.cnum, o.snum from orders o join customers c on c.cnum =o.cnum join salespeople s on s.snum = o.snum where s.city !=c.city order by o.onum;
select cname, orders.amt from customers,orders where customers.cnum = orders.cnum and amt = (select Max(orders.amt)from orders);
select onum,amt,odate,cnum,snum from orders where amt > (select avg(amt)from orders where odate = TO_DATE('03-10-1990','DD-MM-YYYY'));
select onum,amt,odate,cnum,snum from orders where snum in (select salespeople.snum from salespeople where city = 'London');
