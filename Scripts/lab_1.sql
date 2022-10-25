CREATE TABLE product_master
(
    product_id NUMBER(7),
    product_name VARCHAR2(50),
    code VARCHAR2(10),
    reorder_threshold NUMBER(5),
    cost NUMBER(5, 2),
    price NUMBER(5, 2),
    CONSTRAINT pk_inv PRIMARY KEY (product_id),
    CONSTRAINT chk_reorder CHECK (reorder_threshold > 0)
);

alter table product_master nologging
/
insert into product_master
select
100000 + rownum,
'NAME' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
dbms_random.string('a',10),
mod(abs(dbms_random.random),1000) + 100,
25.25,
50.88
from all_objects
/
commit
/
alter table product_master logging;

create index i_product_master on product_master(upper(substr(code, 5, 2)));

DROP INDEX I_PRODUCT_MASTER;

declare
t1 timestamp;
t2 timestamp;
l_name varchar2(30);

begin
t1 := systimestamp;
for c1 in (
select count(*)
from product_master
where upper(substr(code,5,2)) in
('AA','BB','GR','RE','TT','PO','OI','TE','EW','QE',
 'UU','FE','BV','VD','FD','WW','PX','XX','ZW','CO',
 'VE','VX','VV','MM','MN','MO','MA','AQ','AE','AT',
 'CZ','CX','CQ','CW','CE','CR','CT','CY','CU','CI')
) loop
t2 := systimestamp;
end loop;
dbms_output.put_line('Start: '||t1);
dbms_output.put_line('End: '||t2);
dbms_output.put_line('Elapsed seconds: '||TO_CHAR(t2-t1, 'SSSS.FF'));
end;
