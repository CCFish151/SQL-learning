#向employees插入数据
insert into employees
values
('000001','王林','大专','1966-01-23','1','8','中山路32-1-508','83355668','2'),
('010008','伍容华','本科','1976-03-28','1','3','北京东路100-2','83321321','1'),
('020010','王向蓉','硕士','1982-12-09','1','2','四牌楼10-10-108','83792361','1'),
('020018','李丽','大专','1960-07-30','0','6','中山东路102-2','83413301','1'),
('102201','刘明','本科','1972-10-18','1','3','虎踞路100-2','83606608','5'),
('102208','朱骏','硕士','1965-09-28','1','2','牌楼巷5-3-106','84708817','5');

#向departments表中插入数据
insert into departments(departmentid,departmentname)
values
('2','人力资源部'),
('3','经理办公室');

#向salary表插入数据
insert into salary
values
('000001','2100.8','123.09'),
('010008','1582.62','88.03'),
('020010','2860','598'),
('020018','2347.68','180'),
('102201','2569.88','185.65'),
('102208','1980','100'),
('108991','3259.98','281.52'),
('111006','1987.01','79.58'),
('210678','2240','121'),
('302566','1980.7','210.2'),
('308759','2531.98','199.08'),
('504209','2066.15','108');

#插入记录
insert into salary values ('000001','2100.8','123.09');

#利用repalce语句插入数据
replace into departments values ('1','广告部','负责推广产品');

#使用sql语句修改表的数据
##将编号为102201的员工收入改为2890元
update salary 
set income = 2890 where employeeid = '102201'; 
##将所有员工的收入增加100元
update salary
set income = income + 100;
##删除员工表中编号为102201的员工的信息
delete from employees where employeeid = '102201';

###创建空表
create table employees2 like employees;
###向其中添加数据
insert into employees2
       select * from employees;
select * from employees2;


