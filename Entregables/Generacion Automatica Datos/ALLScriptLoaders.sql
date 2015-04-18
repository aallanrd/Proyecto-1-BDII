
select * from Usuarios;
EXECUTE loadUsuarios (5);
--drop procedure loadUsuarios;
--////////////////////////////////////////////////////////////
CREATE OR REPLACE PROCEDURE loadUsuarios (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              insert into usuarios values ( dbms_random.string('A', 8),
                                            dbms_random.string('B', 5),
                                            dbms_random.string('C', 8),
                                            dbms_random.string('D', 4),
                                            'Adm',
                                            NULL);
            END LOOP;
       END;



--select  * from usuarios;
--truncate table usuarios


--/////////////////////////////////////////////////////////////////////
insert into proveedores values ('1234','INTEL','Proc',NULL);
insert into proveedores values ('222','PANASONIC','Proc',NULL);
insert into proveedores values ('333','GNSYS','Proc',NULL);
insert into proveedores values ('444','APQ','Proc',NULL);

EXECUTE loadProveedores (5);

CREATE OR REPLACE PROCEDURE loadProveedores (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              insert into proveedores values (dbms_random.string('B', 4),
                                            dbms_random.string('B', 5),
                                            dbms_random.string('C', 8),
                                            NULL);
            END LOOP;
       END;



--select  * from proveedores;
--truncate table usuarios
select * from proveedores;
--////////////////////////////////////////////////////////////////////////////////////////////////

insert into unidadmedida  values ( 'UN','UNIDAD');
insert into unidadmedida  values ( 'PE','Peso');
insert into unidadmedida  values ( 'HT','Horas Trabajador');
insert into unidadmedida  values ( 'MD','Moneda');

EXECUTE loadUnidades (5);

CREATE OR REPLACE PROCEDURE loadUnidades (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              
              insert into unidadmedida  values ( dbms_random.string('B', 4),dbms_random.string('B', 7));
             
            END LOOP;
       END;



select * from unidadmedida;
--/////////////////////////////////////////////////////////////////////////////
select * from familia;

insert into familia values ('Default','001');
insert into familia values ('Procesadores','001');
insert into familia values ('Monitores','001');
insert into familia values ('USB','001');

EXECUTE loadFamilia (5);

CREATE OR REPLACE PROCEDURE loadFamilia (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              
              insert into familia values (dbms_random.string('B', 4),'001');
              
            END LOOP;
       END;
       
--//////////////////////////////////////////////////////////////////////////

insert into indiceeconomico values ('001','Indice Fam: Proc','1','001');
insert into indiceeconomico values ('002','Indice Fam: Monitores','2','001');
insert into indiceeconomico values ('003','Indice Fam: USB','3','002');

EXECUTE loadIndices (5);

CREATE OR REPLACE PROCEDURE loadIndices (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
               
insert into indiceeconomico values (
                     dbms_random.string('B', 4),
                      'Indice Fam:'+  dbms_random.string('B', 4) ,
                      ''+DBMS_RANDOM.value(1,12)+'',
                      '002');  
              
             -- insert into unidadmedida  values ( dbms_random.string('B', 4),dbms_random.string('B', 7));
             
            END LOOP;
       END;


select * from indiceeconomico;
--/////////////////////////////////////////////////////////////////////////////////////////////
insert into valores values ('001','535','01/01/2015','001');
insert into valores values ('001','545','01/02/2015','001');
insert into valores values ('002','535','01/03/2015','001');
select * from valores;
EXECUTE loadUnidades (5);

CREATE OR REPLACE PROCEDURE loadUnidades (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              
              insert into unidadmedida  values ( dbms_random.string('B', 4),dbms_random.string('B', 7));
             
            END LOOP;
       END;

truncate table valores;

insert into facturacompra values ( '','HFLMSOLXIWJCFQPTCOLO','1500','222','222','','17','PE');

select * from facturacompra;

select * from articulo;

--//////////////////////Prueba////////////////////////////

CREATE PROCEDURE insertEmployee (employee_id NUMBER) AS
   tot_emps NUMBER;
   BEGIN
      DELETE FROM employees
      WHERE employees.employee_id = remove_emp.employee_id;
   tot_emps := tot_emps - 1;
   END;