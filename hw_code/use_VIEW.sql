#创建视图
##创建视图ds_new
CREATE VIEW ds_view AS SELECT * FROM departments;

##创建视图Employees_view
DROP VIEW IF EXISTS EMPLOYEES_VIEW;
CREATE VIEW employees_view AS 
    SELECT E.EMPLOYEEID , departmentID ,  NAME , FORMAT(S.INCOME - S.OUTCOME , 2) AS "realCOME" #实际多查了一个部门ID，用于下面的连接
			FROM EMPLOYEES AS E JOIN SALARY AS S ON E.EMPLOYEEID = S.EMPLOYEEID ;
                
##创建视图，包含员工号码、姓名、所在部门名称和实际收入列。
DROP VIEW IF EXISTS TOTAL_VIEW;
CREATE VIEW Total_view AS
	SELECT EMPLOYEEID , NAME , DEPARTMENTNAME , realCOME
		FROM EMPLOYEES_VIEW E JOIN DS_VIEW D ON E.DEPARTMENTID = D.DEPARTMENTID;
        
#查询视图
##从视图ds_view中查询出部门号为3的部门名称
SELECT DEPARTMENTID , DEPARTMENTNAME FROM DS_VIEW WHERE DEPARTMENTID = "3";

##从视图Employees_view中查询出姓名为“王林”的员工的实际收入
SELECT NAME , REALCOME FROM EMPLOYEES_VIEW WHERE NAME = "王林" ;

#更新视图
##向视图ds_view中插入一行数据：6，财务部，财务管理
INSERT INTO DS_VIEW VALUES(6 , "财务部" ,"财务管理" );
SELECT * FROM DS_VIEW;

##尝试向视图Employees_view中插入一行数据。
INSERT INTO EMPLOYEES_VIEW VALUES('15602','CCF');  #显示无法插入

##修改视图ds_view，将部门号为5的部门名称修改为“生产车间”。
UPDATE DS_VIEW SET DEPARTMENTNAME = '生产车间' WHERE DEPARTMENTID = '5' ;

##修改视图Employees_view中号码为“000001”的员工的姓名为“王浩”。
UPDATE EMPLOYEES_VIEW SET NAME = '王浩' WHERE EMPLOYEEID = "000001" ;

##删除视图ds_view中部门号为“1”的数据。
DELETE FROM DS_VIEW WHERE DEPARTMENTID = '1';

##删除视图ds_view
DROP VIEW DS_VIEW;



