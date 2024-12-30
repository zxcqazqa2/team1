select *from member;
select *from board;
select *from reply;
select *from cate;
select * from attach;

insert into cate(id, name) values(1,"notice");
insert into cate(id, name) values(2,"free");

select * from board where cate_id=1;
select * from board where cate_id=2;

delete from member;
delete from reply;
delete from board;



commit;

drop table attach;
drop table reply;
drop table board;
drop table cate;
drop table member;