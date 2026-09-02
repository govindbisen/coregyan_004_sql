-- pattern matching

-- display name start with 'A'
select * from employees where name like 'A%'

-- display name ends with 'A'
select * from employees where name like '%A'

-- display name any position with 'A' 
select * from employees where name like '%A%'

-- not like 
select * from employees where name not like '%Ar%'

-- display name conain exactly 4 letter
select * from employees where name  like '_____'

-- display where l latter is l
select * from employees where name  like '_l%'


