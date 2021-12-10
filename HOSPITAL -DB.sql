/*ADMIN*/
drop table admin_table;
create table admin_table(admin_id varchar2(10) ,
                         admin_password varchar2(20),
                         check(length(admin_password)>=8),
                         check(REGEXP_LIKE (admin_password,'[0-9]')),
                         check(REGEXP_LIKE (admin_password,'[a-z]')),
                         check(REGEXP_LIKE (admin_password,'[A-Z]')),
                         check(REGEXP_LIKE (admin_password,'[@#$%^&*_-]')),
                         constraint pk_admin primary key(admin_id));

                        

insert into admin_table values('AD001','Admin#123');
insert into admin_table values('AD002','Admin@345');
insert into admin_table values('AD003','Admin%678');
insert into admin_table values('AD004','Admin@901');
select * from admin_table


/*DOCTOR*/
drop table doctor;
create table doctor(doc_id varchar2(10),
                    doc_name varchar2(20) not null,
                    doc_password varchar2(20) not null,
                    degree varchar2(10) not null,
                    doc_dob date not null,
                    doc_department varchar2(20) not null,
                    doc_gender varchar2(10) not null,
                    doc_consult_fees integer not null,
                    check(length(doc_password)>=8),
                    check(REGEXP_LIKE (doc_password,'[0-9]')),
                    check(REGEXP_LIKE (doc_password,'[a-z]')),
                    check(REGEXP_LIKE (doc_password,'[A-Z]')),
                    check(REGEXP_LIKE (doc_password,'[!@#$%^&*?.,;~_-]')),
                    constraint pk_doc primary key(doc_id));



insert into doctor values('DOC001', 'Daniel', 'Danielhp@12', 'BDS', to_date('1989-07-23','yyyy-mm-dd'), 'Dentistry', 'Male', 1000);
insert into doctor values('DOC002', 'Jessy', 'Jess#1241', 'MBBS', to_date('1992-02-10','yyyy-mm-dd'), 'Neurology', 'Female', 1200);
insert into doctor values('DOC003', 'Tony Stark', 'Tonystark%234', 'MBBS', to_date('1993-11-08','yyyy-mm-dd'), 'Cardiology', 'Male', 1000);
insert into doctor values('DOC004', 'Bruce Banner', 'Greenhulk@hydra34', 'BPT, MPT', to_date('1997-08-05','yyyy-mm-dd'), 'Phyisiotherapy', 'Male', 1500);
insert into doctor values('DOC005', 'Kavya', 'Kavya$2001', 'MBBS, DNB', to_date('1976-05-03','yyyy-mm-dd'), 'Paediatrics', 'Female', 1000);
insert into doctor values('DOC006', 'Franklin', 'Franklin_2002', 'BHMS', to_date('1997-04-25','yyyy-mm-dd'), 'Dentistry', 'Male', 1000);
insert into doctor values('DOC007', 'Grams', 'Grams@345', 'MBBS, MD', to_date('1988-07-22','yyyy-mm-dd'), 'General medicine', 'Female', 1300);
insert into doctor values('DOC008', 'Nick', 'Nicky@2345', 'BDS', to_date('1978-05-12','yyyy-mm-dd'), 'Dentistry', 'Male', 1500);
insert into doctor values('DOC009', 'Carrie', 'Car@3451', 'MBBS', to_date('1988-06-25','yyyy-mm-dd'), 'Gynecologist', 'Female', 1000);
insert into doctor values('DOC010', 'Sandra', 'Sandra#452', 'MBBS,MD', to_date('1977-09-04','yyyy-mm-dd'), 'Cardiology', 'Female', 1200);
select * from doctor;

/*DOC_MAIL*/
drop table doc_mail;
create table doc_mail(doc_id varchar2(10) not null,
                      doc_email varchar2(30) not null unique,
                      constraint fk_doctor_mail foreign key(doc_id) references doctor(doc_id),
                      constraint pk_doc_email primary key(doc_id),
                      check (doc_email like '%_@_%._%'));



insert into doc_mail values('DOC001', 'doctordaniel@gmail.com');
insert into doc_mail values('DOC002', 'jessia@yahoo.com');
insert into doc_mail values('DOC003', 'tonystarkindustries@gmail.com');
insert into doc_mail values('DOC004', 'drbruce7phd@gmail.com');
insert into doc_mail values('DOC005', 'doctorkavyasiva@gmail.com');
insert into doc_mail values('DOC006', 'franklin234@gmail.com');
insert into doc_mail values('DOC007', 'grams#345@gmail.com');
insert into doc_mail values('DOC008', 'nicky43@yahoo.com');
insert into doc_mail values('DOC009', 'carri24@outlook.com');
insert into doc_mail values('DOC010', 'sandra345@yahoo.com');
select * from doc_mail;

/*DOC_PHONE*/
drop table doc_phone;                       
create table doc_phone(doc_id varchar2(20) not null,
                      doc_phone_no integer not null unique,
                      constraint fk_doctor_phone foreign key(doc_id) references doctor(doc_id),
                      check(length(doc_phone_no)=10));

insert into doc_phone values('DOC001',8451654155);
insert into doc_phone values('DOC001',9578402365);
insert into doc_phone values('DOC002', 8451236985);
insert into doc_phone values('DOC002', 9454154784);
insert into doc_phone values('DOC003', 9641548451);
insert into doc_phone values('DOC004', 7489741514);
insert into doc_phone values('DOC005', 9018664666);
insert into doc_phone values('DOC006', 9854673452);
insert into doc_phone values('DOC006', 8765410963);
insert into doc_phone values('DOC007', 8976356278);
insert into doc_phone values('DOC008', 8765431093);
insert into doc_phone values('DOC009', 7645190356);
insert into doc_phone values('DOC010', 9874563451);

select * from doc_phone;

/*LABTECH*/
drop table labtechnician;
create table labtechnician (labtech_id varchar2(10),
                            labtech_name varchar2(50) not null,
                            labtech_password varchar2(50) not null,
                            labtech_gender varchar2(10) not null,
                            labtech_dob date not null,
                            labtech_address varchar2(100) not null,
                            check(length(labtech_password)>=8),
                            check(REGEXP_LIKE (labtech_password,'[0-9]')),
                            check(REGEXP_LIKE (labtech_password,'[a-z]')),
                            check(REGEXP_LIKE (labtech_password,'[A-Z]')),
                            check(REGEXP_LIKE (labtech_password,'[!@#$%^&*?.,;~_-]')),
                            constraint pk_labtech primary key(labtech_id));

insert into labtechnician values('LT001', 'Suriya', 'Suriya1977##', 'Male', to_date('1993-11-10','yyyy-mm-dd'), '123, periyar street, coimbatore -601839');
insert into labtechnician values('LT002', 'Ram', 'Ram2$004', 'Male', to_date('1996-11-20','yyyy-mm-dd'), '98/3, mullai street, pollachi -389924');
insert into labtechnician values('LT003', 'Tom', 'Tomcruise@124', 'Male', to_date('2014-03-10','yyyy-mm-dd'), '139, Argonne street, california-328758.');
insert into labtechnician values('LT004', 'Elena', '#Eleelena8', 'Female', to_date('1987-02-17','yyyy-mm-dd'), '89, Buckingham street, elliot road, paris-190435.');
insert into labtechnician values('LT005', 'Aditi', '12Aditi.q', 'Female', to_date('1995-01-31','yyyy-mm-dd'), '208, white pine lane, virginia -374258.');
insert into labtechnician values('LT006', 'Caroline', 'Carol#2001', 'Female', to_date('2001-07-19','yyyy-mm-dd'), '396, creek side lane, utah-285292.');
insert into labtechnician values('LT007', 'Stefan', 'Stefan93258#', 'Male', to_date('2002-08-22','yyyy-mm-dd'), '221, Augusta country lane, Georgia-735865.');
insert into labtechnician values('LT008', 'Damon', 'Dam$&*90', 'Male', to_date('1972-10-26','yyyy-mm-dd'), '308, Farm beach garden, Florida-326578.');
insert into labtechnician values('LT009', 'Jeremy', 'Jerm123%%%', 'Male', to_date('1971-05-28','yyyy-mm-dd'), '245, Tera street, Seattle-238574.');
insert into labtechnician values('LT010', 'Viola', 'ViolaV$234', 'Female', to_date('1964-07-31','yyyy-mm-dd'), '500, feathers hooves drive, newyork-827586.');
select * from labtechnician;


/*LABTECH_MAIL*/
drop table labtech_mail;
create table labtech_mail(labtech_id varchar2(10) not null,
                         labtech_email varchar2(30) not null unique,
                         constraint fk_labtech_mail foreign key(labtech_id) references labtechnician(labtech_id),
                         constraint pk_labtech_email primary key(labtech_id),
                         check (labtech_email like '%_@_%._%'));
                      
insert into labtech_mail values('LT001','suriya.123@yahoo.com' );
insert into labtech_mail values('LT002', 'rammy2@outlook.com');
insert into labtech_mail values('LT003', 'tomcruise@gmail.com');
insert into labtech_mail values('LT004', 'elenadamon@dmail.com');
insert into labtech_mail values('LT005', 'aditi1234@outlook.com');
insert into labtech_mail values('LT006', 'caroline@gmail.com');
insert into labtech_mail values('LT007', 'stefencaroline@gmail.com');
insert into labtech_mail values('LT008', 'damon89@yahoo.com');
insert into labtech_mail values('LT009', 'jeremy@edr.com');
insert into labtech_mail values('LT010', 'Violapurple@yahoo.com');
select * from labtech_mail;

/*LABTECH_PHONE*/
drop table labtech_phone;                       
create table labtech_phone(labtech_id varchar2(20) not null,
                           labtech_phone_no integer not null unique,
                           constraint fk_labtech_phone foreign key(labtech_id) references labtechnician(labtech_id),
                           check(length(labtech_phone_no)=10));

insert into labtech_phone values('LT001', 9673263772);
insert into labtech_phone values('LT002', 9812345672);
insert into labtech_phone values('LT003', 7654289012);
insert into labtech_phone values('LT004', 8765209431);
insert into labtech_phone values('LT004', 8765332312);
insert into labtech_phone values('LT005', 9864563219);
insert into labtech_phone values('LT006', 7657891235);
insert into labtech_phone values('LT006', 8790634521);
insert into labtech_phone values('LT007', 6789543217);
insert into labtech_phone values('LT008', 8976540912);
insert into labtech_phone values('LT009', 6789432156);
insert into labtech_phone values('LT010', 8723416789);
insert into labtech_phone values('LT010', 9856432789);

select * from labtech_phone;

/*PATIENT*/
drop table patient;
create table patient (patient_id varchar2(10) not null,
                      patient_name varchar2(20) not null,
                      patient_password varchar2(20) not null,
                      patient_gender varchar2(10) not null,
                      patient_dob date not null,
                      patient_address varchar2(100) not null,
                      patient_age integer,
                      check(length(patient_password)>=8),
                      check(REGEXP_LIKE (patient_password,'[0-9]')),
                      check(REGEXP_LIKE (patient_password,'[a-z]')),
                      check(REGEXP_LIKE (patient_password,'[A-Z]')),
                      check(REGEXP_LIKE (patient_password,'[!@#$%^&*?.,;~_-]')),
                      constraint pk_patient primary key(patient_id));

create or replace TRIGGER db
After insert ON patient
begin
update patient set patient_age = to_char(sysdate,'yyyy')- extract (year from patient_dob);
end;
/
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT001', 'Steven', 'Steven@07', 'Male', to_date('1987-09-23','yyyy-mm-dd'),'345,georgia street,USA-098752');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT002', 'Regina', 'Regina#45', 'Female',to_date('1977-04-11','yyyy-mm-dd'), '34,sector 18,rohini,delhi-875643');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT003', 'David', 'Dav@3465', 'Male',to_date('1988-10-20','yyyy-mm-dd'), '39,Sajwat complex,Mumbai-9876541');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT004', 'Halim', 'Halim$235', 'Male',to_date('2007-02-05','yyyy-mm-dd'), '67,Nava pool,Nagarwada-986732');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT005', 'Lomal', 'Lomal@564', 'Male',to_date('1980-01-17','yyyy-mm-dd'), '24,railway colony,nerul-7654389');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT006', 'Jerry', 'Jerry#745', 'Male',to_date('1985-04-19','yyyy-mm-dd'),'268,front street,michigan');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT007', 'Bonnie', 'Bon$3452', 'Female',to_date('1982-05-19','yyyy-mm-dd'), '142,timber brook lane,Colorado-786543');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT008', 'Maria', 'Maria@34565', 'Female',to_date('1972-11-29','yyyy-mm-dd'), '279,Fancher Drive, Texas-786543');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT009', 'Katherine', 'Kath#564', 'Female',to_date('1970-10-30','yyyy-mm-dd'), '243,Karen lane,kentucky-765478');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT010', 'Freya', 'Freya#345', 'Female',to_date('1987-07-23','yyyy-mm-dd'), '345,forest avenue,elmsord-328954');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT011', 'Hasera', 'Hasi_273', 'Female',to_date('1989-12-23','yyyy-mm-dd'), '453, manchester street, california-657367.');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT012', 'Quetsiyah', 'Qyet#5678', 'Female',to_date('1974-03-18','yyyy-mm-dd'), '91,turkey pen lane,dothan-987456');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT013', 'Henry', 'Henry%457', 'Male',to_date('1971-11-08','yyyy-mm-dd'), '30,wrighter street,albama-657098');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT014', 'Newton', 'NewT@345', 'Male',to_date('1988-08-12','yyyy-mm-dd'), '89,quilly lane wester ville-768904');
insert into patient(patient_id,patient_name,patient_password,patient_gender,patient_dob,patient_address) values('PAT015', 'Jensen', 'Jen#4567', 'Male',to_date('1980-09-04','yyyy-mm-dd'), '258,frosty street,candor-678943');
select * from patient;

/*PATIENT EMAIL*/

drop table patient_mail;
create table patient_mail(patient_id varchar2(10) not null,
                         patient_email varchar2(30) not null unique,
                         constraint fk_patient_mail foreign key(patient_id) references patient(patient_id),
                         constraint pk_patient_email primary key(patient_id),
                         check (patient_email like '%_@_%._%'));
                         
insert into patient_mail values('PAT001', 'steven123@gmail.com');
insert into patient_mail values('PAT002', 'regina1234@gmail.com');
insert into patient_mail values('PAT003', 'david34@outlook.com');
insert into patient_mail values('PAT004', 'halim234@yahoo.com');
insert into patient_mail values('PAT005', 'lomal234@gmail.com');
insert into patient_mail values('PAT006', 'jerry453@gmail.com');
insert into patient_mail values('PAT007', 'bonnie378@microsoft.com');
insert into patient_mail values('PAT008', 'maria234@gmail.com');
insert into patient_mail values('PAT009', 'katherine345@meta.com');
insert into patient_mail values('PAT010', 'freya345@insta.com');
insert into patient_mail values('PAT011', 'hasera3467@gmail.com');
insert into patient_mail values('PAT012', 'quetsiyah289@outlook.com');
insert into patient_mail values('PAT013', 'henry89@microsoft.com');
insert into patient_mail values('PAT014', 'newton456@gmail.com');
insert into patient_mail values('PAT015', 'jensen45@facebook.com');
select * from patient_mail;


/*PATIENT PHONE*/

drop table patient_phone;                       
create table patient_phone(patient_id varchar2(20) not null,
                           patient_phone_no integer not null unique,
                           constraint fk_patient_phone foreign key(patient_id) references patient(patient_id),
                           check(length(patient_phone_no)=10));

insert into patient_phone values('PAT001', 8765309875);
insert into patient_phone values('PAT001', 8790634567);
insert into patient_phone values('PAT002', 7890543678);
insert into patient_phone values('PAT003', 8764325678);
insert into patient_phone values('PAT004', 6789034567);
insert into patient_phone values('PAT004', 8765389026);
insert into patient_phone values('PAT005', 9854673456);
insert into patient_phone values('PAT006', 8765234679);
insert into patient_phone values('PAT006', 8907654316);
insert into patient_phone values('PAT007', 7653890245);
insert into patient_phone values('PAT008', 6789435126);
insert into patient_phone values('PAT009', 7890345618);
insert into patient_phone values('PAT010', 8753912689);
insert into patient_phone values('PAT011', 9746728901);
insert into patient_phone values('PAT012', 8646728901);
insert into patient_phone values('PAT013', 8764390256);
insert into patient_phone values('PAT014', 8763589025);
insert into patient_phone values('PAT015', 7654328901);
insert into patient_phone values('PAT015', 7890453217);
select * from patient_phone;

/*PHARMACIST*/
drop table pharmacist;
create table pharmacist(phar_id varchar2(20),
                        phar_name varchar2(20) not null,
                        phar_password varchar2(20)not null,
                        phar_gender varchar2(10) not null,
                        phar_dob date not null,
                        phar_address varchar2(100) not null,
                        check(length(phar_password)>=8),
                        check(REGEXP_LIKE (phar_password,'[0-9]')),
                        check(REGEXP_LIKE (phar_password,'[a-z]')),
                        check(REGEXP_LIKE (phar_password,'[A-Z]')),
                        check(REGEXP_LIKE (phar_password,'[!@#$%^&*?.,;~_-]')),
                        constraint pk_phar primary key(phar_id));

insert into pharmacist values('PHAR001', 'Ken', 'Keny#657', 'Male', to_date('1986-02-13','yyyy-mm-dd'),'45,FGR Street, Gujarat-768453');
insert into pharmacist values('PHAR002', 'Silas', 'Silas@3465', 'Male', to_date('1984-01-20','yyyy-mm-dd'), '35,north cersent, singapore-874239');
insert into pharmacist values('PHAR003', 'Jian', 'Jian*234', 'Male', to_date('1974-11-20','yyyy-mm-dd'), '42,industrial state,singapore-965432');
insert into pharmacist values('PHAR004', 'Denver', 'Deny&456', 'Male', to_date('1974-05-23','yyyy-mm-dd'), '67, bellard street,georgia-895643');
insert into pharmacist values('PHAR005', 'Klaus', 'Klaus342#', 'Female', to_date('1984-07-23','yyyy-mm-dd'), '100,Peach circle,cotes-567243');
insert into pharmacist values('PHAR006', 'Gwen', 'Gwen& 5643', 'Female', to_date('1986-05-23','yyyy-mm-dd'), '96,Vicar Lane,sandget-654389');
select * from pharmacist;

/*PHAR EMAIL*/
drop table phar_mail;
create table phar_mail(phar_id varchar2(10) not null,
                       phar_email varchar2(30) not null unique,
                       constraint fk_phar_mail foreign key(phar_id) references pharmacist(phar_id),
                       constraint pk_phar_email primary key(phar_id),
                       check (phar_email like '%_@_%._%'));
                         
insert into phar_mail values('PHAR001', 'ken234@gmail.com');
insert into phar_mail values('PHAR002', 'silas564@outlook.com');
insert into phar_mail values('PHAR003', 'jian2346@microsoft.com');
insert into phar_mail values('PHAR004', 'denver567@gmail.com');
insert into phar_mail values('PHAR005', 'klaus67@gmail.com');
insert into phar_mail values('PHAR006', 'gwen67@yahoo.com');
select * from phar_mail;

/*PHAR PHONE*/
drop table phar_phone;                       
create table phar_phone(phar_id varchar2(20) not null,
                        phar_phone_no integer not null unique,
                        constraint fk_phar_phone foreign key(phar_id) references pharmacist(phar_id),
                        check(length(phar_phone_no)=10));

insert into phar_phone values('PHAR001', 9867356710);
insert into phar_phone values('PHAR002', 9876452490);
insert into phar_phone values('PHAR003', 6789352781);
insert into phar_phone values('PHAR003', 8906534278);
insert into phar_phone values('PHAR004', 7645190342);
insert into phar_phone values('PHAR005', 7890432678);
insert into phar_phone values('PHAR006', 8763529017);
insert into phar_phone values('PHAR006', 8906534789);
select * from phar_phone;

/*14.	RECEPTIONIST TABLE:*/
drop table receptionist;
create table receptionist(rec_id varchar2(10),
                          rec_name varchar(20) not null,
                          rec_password varchar(20) not null,
                          rec_gender varchar(20) not null,
                          rec_dob date not null,
                          rec_address varchar(250) not null,
                          check(length(rec_password)>=8),
                          check(REGEXP_LIKE (rec_password,'[0-9]')),
                          check(REGEXP_LIKE (rec_password,'[a-z]')),
                          check(REGEXP_LIKE (rec_password,'[A-Z]')),
                          check(REGEXP_LIKE (rec_password,'[!@#$%^&*?.,;~_-]')),
                          constraint pk_rec primary key(rec_id));
   
insert into receptionist values('REC001', 'Yaseen', 'Yasen$12', 'Female', to_date('1971-03-21','yyyy-mm-dd'), '142, dumbo colony, persia-732485');
insert into receptionist values('REC002', 'Jim', 'Jim;01234', 'Male', to_date('1974-06-27','yyyy-mm-dd'), '438, Doctors drive, Torance-365762.');
insert into receptionist values('REC003', 'Chandler', 'Chandler%8764', 'Male',to_date('1975-09-07','yyyy-mm-dd'), '477, pinewood drive, alaska-726357.');
insert into receptionist values('REC004', 'Dennis', 'Dennis^77847', 'Male', to_date('1972-04-27','yyyy-mm-dd'), '135, indiana avenue, Hawaii-387573.');
insert into receptionist values('REC005', 'Bruno', 'Bruno1234@', 'Male', to_date('1990-03-31','yyyy-mm-dd'), '266, cessna drive, Indiana-382757.');
select * from receptionist;

/*REC EMAIL*/

drop table rec_mail;
create table rec_mail(rec_id varchar2(10) not null,
                      rec_email varchar2(30) not null unique,
                      constraint fk_rec_mail foreign key(rec_id) references receptionist(rec_id),
                      constraint pk_rec_email primary key(rec_id),
                      check (rec_email like '%_@_%._%'));
                         
insert into rec_mail values('REC001', 'yaseen37@yahoo.com');
insert into rec_mail values('REC002', 'jimrec@gmail.com');
insert into rec_mail values('REC003', 'chandler@outlook.com');
insert into rec_mail values('REC004', 'dennis1234@gmail.com');
insert into rec_mail values('REC005', 'brunosmi@gmail.com');
select * from rec_mail;

/*REC_PHONE:*/
drop table rec_phone;                       
create table rec_phone(rec_id varchar2(20) not null,
                       rec_phone_no integer not null unique,
                       constraint fk_rec_phone foreign key(rec_id) references receptionist(rec_id),
                       check(length(rec_phone_no)=10));

insert into rec_phone values('REC001', 9367564289);
insert into rec_phone values('REC002', 9637565332);
insert into rec_phone values('REC003', 7632782790);
insert into rec_phone values('REC003', 8652353273);
insert into rec_phone values('REC004', 6553576678);
insert into rec_phone values('REC005', 9645434676);
select * from rec_phone;



/*BOOK_CONSULT:*/
drop table book_consult;
create table book_consult(consult_id varchar2(20),
                          queries varchar2(200) not null,
                          appointment_fees integer not null,
                          booking_date_time timestamp default systimestamp  not null,
                          appointment_date_time timestamp not null,
                          constraint pk_consult primary key(consult_id));


insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON001', 'tooth ache', 1000, to_timestamp('2021-11-12 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON002', 'Left shoulder pain, chest pain', 1000, to_timestamp('2021-11-19 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON003', 'Stomach ache at late nights.', 500, to_timestamp('2021-11-18 18:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON004', 'Fever and cold', 500,to_timestamp('2021-11-10 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON005', 'Lower back ache.', 1000, to_timestamp('2021-11-18 11:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON006', 'neck pain', 1000, to_timestamp('2021-11-15 09:30:00','YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON007', 'Regular checkup', 1000, to_timestamp('2021-11-20 08:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON008', 'Regular check up', 1000, to_timestamp('2021-11-14 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON009', 'Physiotherapy session ', 500, to_timestamp('2021-11-23 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON010', 'Joint pain', 700, to_timestamp('2021-11-22 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON011', 'Head ache-sinus', 500, to_timestamp('2021-11-22 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON012', 'Food poisoning', 800, to_timestamp('2021-11-30 20:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON013', 'Cold and cough', 500, to_timestamp('2021-11-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON014', 'Spine problem', 700, to_timestamp('2021-11-16 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON015', 'leg pain', 500, to_timestamp('2021-11-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON016', 'stomach disorder', 1500, to_timestamp('2021-11-19 19:30:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into book_consult(consult_id,queries,appointment_fees,appointment_date_time) values('CON017', 'check up', 500, to_timestamp('2021-11-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
select * from book_consult;


/*CONSULT_PATIENT_ID*/
drop table consult_patient_id;
create table consult_patient_id(consult_id varchar2(20) not null,
                                patient_id varchar2(10) not null,
                                constraint fk_consult foreign key(consult_id) references book_consult(consult_id),
                                constraint fk_patient_consult foreign key(patient_id) references patient(patient_id),
                                constraint pk_consult_patient primary key (consult_id));

insert into consult_patient_id values('CON001', 'PAT001');
insert into consult_patient_id values('CON002', 'PAT010');
insert into consult_patient_id values('CON003', 'PAT004');
insert into consult_patient_id values('CON004', 'PAT005');
insert into consult_patient_id values('CON005', 'PAT002');
insert into consult_patient_id values('CON006', 'PAT006');
insert into consult_patient_id values('CON007', 'PAT003');
insert into consult_patient_id values('CON008', 'PAT007');
insert into consult_patient_id values('CON009', 'PAT008');
insert into consult_patient_id values('CON010', 'PAT011');
insert into consult_patient_id values('CON011', 'PAT009');
insert into consult_patient_id values('CON012', 'PAT013');
insert into consult_patient_id values('CON013', 'PAT014');
insert into consult_patient_id values('CON014', 'PAT012');
insert into consult_patient_id values('CON015', 'PAT002');
insert into consult_patient_id values('CON016', 'PAT015');
insert into consult_patient_id values('CON017', 'PAT008');
select * from consult_patient_id;

/*LABTESTS*/
drop table labtest_list;
create table labtest_list(test_id varchar2(10),
                          test_name varchar2(20) not null unique,
                          test_price integer not null,
                          constraint pk_labtest primary key(test_id));

insert into labtest_list values('LAB001', 'CT Scan',1300);
insert into labtest_list values('LAB002', 'X-Ray',350);
insert into labtest_list values('LAB003', 'Hemoglobin test',120);
insert into labtest_list values('LAB004', 'Blood Sugar test',230);
insert into labtest_list values('LAB005', 'X-Ray-Lungs',850);
insert into labtest_list values('LAB006', 'MRI',2000);
insert into labtest_list values('LAB007', 'EEG',2750);
insert into labtest_list values('LAB008', 'Sonography',1750);
insert into labtest_list values('LAB009', 'Covid test',2430);
insert into labtest_list values('LAB010', 'Cancer test',1999);
select * from labtest_list;

/*MEDICINE LIST*/
drop table medicine_list;
create table medicine_list(medicine_id varchar2(10),
                           medicine_name varchar2(20) not null,
                           medicine_price integer not null,
                           constraint pk_med_id primary key(medicine_id));

insert into medicine_list values('MED001', 'Crocin',3);
insert into medicine_list values('MED002', 'Ibuprofen',6);
insert into medicine_list values('MED003', 'Omeprazole',5);
insert into medicine_list values('MED004', 'Metformin',12);
insert into medicine_list values('MED005', 'Diclofenac',12);
insert into medicine_list values('MED006', 'Captopril',15);
insert into medicine_list values('MED007', 'Cephalexin',10);
insert into medicine_list values('MED008', 'Losartan',70);
insert into medicine_list values('MED009', 'Aspirin',3);
insert into medicine_list values('MED010', 'Paracetamol',4);
insert into medicine_list values('MED011', 'Atenolol',5);
insert into medicine_list values('MED012',  'Cefepime',10);
insert into medicine_list values('MED013', 'Dapsone',14);
insert into medicine_list values('MED014',  'kiclofenac',4);
insert into medicine_list values('MED015', 'Enalapril',8); 
insert into medicine_list values('MED016', 'Famciclovir',9);
insert into medicine_list values('MED017', 'Hydralazine',10);
insert into medicine_list values('MED018', 'Ketoconazole',16);
select * from medicine_list;

/*ROOM:*/
create table room(Room_no integer,vacancy varchar2(10) not null,constraint pk_room_no primary key(Room_no));
insert into room values(101, 'Yes');
insert into room values(102, 'No');
insert into room values(103, 'No');
insert into room values(104, 'Yes');
insert into room values(105, 'Yes');
insert into room values(106, 'No');
insert into room values(107, 'Yes');
insert into room values(108, 'Yes');
insert into room values(109, 'No');
insert into room values(110, 'No');
select * from room;

/*ROOM BOOK*/
drop table room_book;
create table room_book(booking_id varchar2(10),
                       admit_date_time timestamp not null,
                       discharge_date_time timestamp not null,
                       room_bill integer not null,
                       fees integer not null,
                       Room_no integer not null,
                       constraint fk_room foreign key(Room_no) references room(Room_no),
                       constraint pk_roombook_id primary key(booking_id));
                       
insert into room_book values('RBOOK001', to_timestamp('2021-11-07 15:32:00','YYYY-MM-DD HH24:MI:SS'), to_timestamp('2021-11-17 20:02:00','YYYY-MM-DD HH24:MI:SS'), 7000, 10500, 102);
insert into room_book values('RBOOK002', to_timestamp('2021-11-07 15:33:26','YYYY-MM-DD HH24:MI:SS'), to_timestamp('2021-11-16 20:03:48','YYYY-MM-DD HH24:MI:SS'), 7000, 1250, 103);
insert into room_book values('RBOOK003', to_timestamp('2021-11-07 15:33:26','YYYY-MM-DD HH24:MI:SS'), to_timestamp('2021-11-30 20:03:48','YYYY-MM-DD HH24:MI:SS'), 7000, 11000, 106);
insert into room_book values('RBOOK004', to_timestamp('2021-11-07 15:33:26','YYYY-MM-DD HH24:MI:SS'), to_timestamp('2021-12-15 20:03:48','YYYY-MM-DD HH24:MI:SS'), 7000, 12000, 109);
insert into room_book values('RBOOK005', to_timestamp('2021-11-07 15:33:26','YYYY-MM-DD HH24:MI:SS'), to_timestamp('2021-12-01 20:03:48','YYYY-MM-DD HH24:MI:SS'), 7000, 15000, 110);
select * from room_book;


/*RBOOK_PATIENT_ID*/
drop table rbook_patient_id;
create table rbook_patient_id(booking_id varchar2(10),
                              patient_id varchar2(10) not null,
                              constraint fk_room_bookid2 foreign key(booking_id) references room_book(booking_id),
                              constraint fk_room_patid1 foreign key(patient_id) references patient(patient_id),
                              constraint pk_roombook1 primary key(booking_id));
insert into rbook_patient_id values('RBOOK001','PAT001');
insert into rbook_patient_id values('RBOOK002','PAT006');
insert into rbook_patient_id values('RBOOK003','PAT008');
insert into rbook_patient_id values('RBOOK004','PAT003');
insert into rbook_patient_id values('RBOOK005','PAT012');
select * from rbook_patient_id;


/*PATIENT_MEDICINE*/
drop table patient_medicine;
create table patient_medicine(patient_id varchar2(10) not null,
                              medicine_id varchar2(10) not null,
                              med_quantity integer not null,
                              bill_date timestamp not null,
                              constraint fk_pat1 foreign key(patient_id) references patient(patient_id),
                              constraint fk_med1 foreign key(medicine_id) references medicine_list(medicine_id));

insert into patient_medicine values('PAT001', 'MED011',20, to_timestamp('2021-09-12 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT001', 'MED012',10, to_timestamp('2021-09-12 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT001', 'MED004',25, to_timestamp('2021-09-24 10:40:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT001', 'MED002',15, to_timestamp('2021-09-24 10:40:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT002', 'MED009',5, to_timestamp('2021-03-07 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT003', 'MED012',22, to_timestamp('2021-05-20 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT003', 'MED018',10, to_timestamp('2021-05-20 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT005', 'MED001',11, to_timestamp('2021-11-12 15:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT005', 'MED003',6, to_timestamp('2021-11-12 15:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT005', 'MED013',18, to_timestamp('2021-11-12 15:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT005', 'MED012',20, to_timestamp('2021-11-12 19:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT011', 'MED017',23, to_timestamp('2021-10-12 12:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT011', 'MED002',30, to_timestamp('2021-10-12 12:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT013', 'MED017',22, to_timestamp('2021-11-12 14:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT014', 'MED006',20, to_timestamp('2021-11-12 14:55:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT015', 'MED006',19, to_timestamp('2021-12-14 10:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_medicine values('PAT012', 'MED013',18, to_timestamp('2021-12-14 10:00:00 ','YYYY-MM-DD HH24:MI:SS'));
select * from patient_medicine;

/*PATIENT_LABTEST*/
drop table patient_labtest;
create table patient_labtest(patient_id varchar2(10) not null,
                             test_id varchar2(10) not null,
                             lbill_time timestamp not null,
                             constraint fk_pat1 foreign key(patient_id) references patient(patient_id),
                             constraint fk_test1 foreign key(test_id) references labtest_list(test_id));

insert into patient_labtest values('PAT001', 'LAB001', to_timestamp('2021-11-12 16:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT001', 'LAB002', to_timestamp('2021-11-12 16:57:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT003', 'LAB005', to_timestamp('2021-11-20 09:22:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT003', 'LAB008', to_timestamp('2021-11-20 10:01:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT004', 'LAB008', to_timestamp('2021-11-19 11:17:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT005', 'LAB002', to_timestamp('2021-11-10 18:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT005', 'LAB006', to_timestamp('2021-11-10 18:23:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT005', 'LAB001', to_timestamp('2021-11-10 19:04:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT006', 'LAB002', to_timestamp('2021-11-15 10:02:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT007', 'LAB003', to_timestamp('2021-11-14 15:13:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT009', 'LAB002', to_timestamp('2021-11-22 13:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into patient_labtest values('PAT008', 'LAB004', to_timestamp('2021-11-23 15:05:00 ','YYYY-MM-DD HH24:MI:SS'));
select * from patient_labtest;


/*PHAR_PATIENT_ID*/
drop table phar_patient_id;
create table phar_patient_id(patient_id varchar2(10) not null,
                             phar_id varchar2(10) not null,
                             bill_time timestamp not null,
                             constraint fk3 foreign key(phar_id) references pharmacist(phar_id),
                             constraint fk4 foreign key(patient_id) references patient(patient_id));
insert into phar_patient_id values('PAT001', 'PHAR001', to_timestamp('2021-09-12 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT001', 'PHAR006', to_timestamp('2021-09-24 10:40:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT002', 'PHAR001', to_timestamp('2021-03-07 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT003', 'PHAR003', to_timestamp('2021-05-20 17:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT005', 'PHAR002', to_timestamp('2021-11-12 15:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT011', 'PHAR006', to_timestamp('2021-10-12 12:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT013', 'PHAR004', to_timestamp('2021-11-12 14:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT014', 'PHAR004', to_timestamp('2021-11-12 14:55:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT015', 'PHAR002', to_timestamp('2021-12-14 10:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into phar_patient_id values('PAT012', 'PHAR001', to_timestamp('2021-12-14 10:00:00 ','YYYY-MM-DD HH24:MI:SS'));
select * from phar_patient_id;


/*LABTECH_PATIENT_ID*/

drop table labtech_patient_id;
create table labtech_patient_id(patient_id varchar2(10) not null,
                                labtech_id varchar2(10) not null,
                                lab_time timestamp not null,
                                constraint fk1 foreign key(labtech_id) references labtechnician(labtech_id),
                                constraint fk2 foreign key(patient_id) references patient(patient_id));

insert into labtech_patient_id values('PAT001', 'LT008', to_timestamp('2021-11-12 16:00:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT001', 'LT007', to_timestamp('2021-11-12 16:57:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT003', 'LT007', to_timestamp('2021-11-20 09:22:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT003', 'LT010', to_timestamp('2021-11-20 10:01:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT004', 'LT005', to_timestamp('2021-11-19 11:17:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT005', 'LT007', to_timestamp('2021-11-10 18:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT005', 'LT003', to_timestamp('2021-11-10 18:23:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT005', 'LT004', to_timestamp('2021-11-10 19:04:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT006', 'LT007', to_timestamp('2021-11-15 10:02:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT007', 'LT002', to_timestamp('2021-11-14 15:13:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT009', 'LT009', to_timestamp('2021-11-22 13:50:00 ','YYYY-MM-DD HH24:MI:SS'));
insert into labtech_patient_id values('PAT008', 'LT006', to_timestamp('2021-11-23 15:05:00 ','YYYY-MM-DD HH24:MI:SS'));
select * from labtech_patient_id;

/*DOCTOR_PATIENT_ID*/

create table doc_patient_id(patient_id varchar2(10) not null,
                            doc_id varchar2(10) not null,
                            constraint fk_doc foreign key(doc_id) references doctor(doc_id),
                            constraint fk_pat foreign key(patient_id) references patient(patient_id));

insert into doc_patient_id values ('PAT001', 'DOC008');
insert into doc_patient_id values ('PAT002', 'DOC007');
insert into doc_patient_id values ('PAT003', 'DOC007');
insert into doc_patient_id values ('PAT003', 'DOC010');
insert into doc_patient_id values ('PAT004', 'DOC005');
insert into doc_patient_id values ('PAT005', 'DOC007');
insert into doc_patient_id values ('PAT006', 'DOC007');
insert into doc_patient_id values ('PAT006', 'DOC004');
insert into doc_patient_id values ('PAT007', 'DOC007');
insert into doc_patient_id values ('PAT008', 'DOC002');
insert into doc_patient_id values ('PAT009', 'DOC009');
insert into doc_patient_id values ('PAT010', 'DOC006');
insert into doc_patient_id values ('PAT011', 'DOC001');
insert into doc_patient_id values ('PAT012', 'DOC006');
insert into doc_patient_id values ('PAT013', 'DOC003');
insert into doc_patient_id values ('PAT014', 'DOC007');
insert into doc_patient_id values ('PAT015', 'DOC004');
select * from doc_patient_id;

/*SIMPLE QUERIES*/
select doc_id,doc_name,doc_consult_fees from doctor where doc_id in(select doc_id from doctor where doc_consult_fees <= 1000 and doc_department='Dentistry'); 
select Room_no from room where vacancy = 'Yes';
select consult_id,queries from book_consult where appointment_date_time>=to_timestamp('2021-11-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS') and appointment_date_time<to_timestamp('2021-11-18 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
select * from medicine_list order by medicine_name;
select * from labtechnician where labtech_name like 'A%' or labtech_name like 'S%';



/*AGGREGATE QUERIES*/
select doc_department, count(*) from doctor group by doc_department
select count(*) as total_rooms from room;
select doc_department, min(doc_consult_fees) as MinFees from doctor group by doc_department;
select patient_id,count(*) as no_of_phone_numbers from patient_phone group by patient_id order by patient_id;
select sum(test_price) from labtest_list where test_name in ('X-Ray-Lungs','EEG','Sonography');

/*JOIN QUERIES*/
1.	select distinct doctor.doc_id,doctor.doc_name,patient.patient_id,patient.patient_name from doctor join patient_doctor_id on doctor.doc_id=patient_doctor_id.doc_id join patient on patient.patient_id=patient_doctor_id.patient_id order by patient.patient_id; 
2.	select patient.patient_id,patient.patient_name,patient.patient_gender,patient.patient_age from patient right join rbook_patient_id on patient.patient_id=rbook_patient_id.patient_id;
3.	select distinct receptionist.rec_id,receptionist.rec_name,rec_phone.rec_phone_no,rec_mail.rec_email from receptionist join rec_phone on rec_phone.rec_id=receptionist.rec_id inner join rec_mail on rec_phone.rec_id=rec_mail.rec_id order by receptionist.rec_id;
4.	select patient_labtest.patient_id,labtest_list.test_id,labtest_list.test_name from patient_labtest left join labtest_list on patient_labtest.test_id=labtest_list.test_id order by patient_labtest.patient_id;
5.	select patient_id,medicine_name from patient_medicine natural join medicine_list order by patient_id;
   
/*VIEWS*/
1. create view receptionist_view as
select patient.patient_id,patient.patient_name,patient.patient_age,patient.patient_gender,book_consult.consult_id,book_consult.queries,book_consult.appointment_date_time,doctor.doc_name,doctor.doc_department,doctor.doc_id,doctor.doc_consult_fees from patient
join doc_patient_id on patient.patient_id=doc_patient_id.patient_id 
join doctor on doctor.doc_id=doc_patient_id.doc_id  
join consult_patient_id on patient.patient_id=consult_patient_id.patient_id 
join book_consult on book_consult.consult_id=consult_patient_id.consult_id 
order by patient.patient_id; 

select * from receptionist_view;
2. create or replace view labtechnician_view as 
select distinct patient.patient_id,patient.patient_name,patient.patient_gender,patient.patient_age,labtechnician.labtech_id,labtechnician.labtech_name,labtest_list.test_id,labtest_list.test_name,labtest_list.test_price from patient join labtech_patient_id on patient.patient_id=labtech_patient_id.patient_id 
join labtechnician on labtechnician.labtech_id=labtech_patient_id.labtech_id
join patient_labtest on patient_labtest.patient_id=patient.patient_id
join labtest_list on labtest_list.test_id=patient_labtest.test_id order by patient.patient_id;

select * from labtechnician_view;
3. select distinct patient.patient_id,patient.patient_name,patient.patient_gender,patient.patient_age,pharmacist.phar_id,pharmacist.phar_name,medicine_list.medicine_id,medicine_list.medicine_name,patient_medicine.med_quantity,medicine_list.medicine_price,medicine_list.medicine_price*patient_medicine.med_quantity as total from patient 
join phar_patient_id on patient.patient_id=phar_patient_id.patient_id
join pharmacist on pharmacist.phar_id=phar_patient_id.phar_id
join patient_medicine on patient_medicine.patient_id=patient.patient_id and patient_medicine.bill_date=phar_patient_id.bill_time
join medicine_list on medicine_list.medicine_id=patient_medicine.medicine_id order by patient.patient_id;
4. create or replace view admin_view_doc_salary as
select doc_id,doc_name,doc_department,(doc_consult_fees+5000)*30 as salary from doctor;

select * from admin_view_doc_salary;
5. create view doc_view as
select book_consult.consult_id,patient.patient_id,patient.patient_name,patient.patient_age,patient.patient_gender,book_consult.queries,book_consult.appointment_date_time from patient
join consult_patient_id on consult_patient_id.patient_id=patient.patient_id
join book_consult on book_consult.consult_id=consult_patient_id.consult_id 
join doc_patient_id on doc_patient_id.patient_id=patient.patient_id 
join doctor on doctor.doc_id=doc_patient_id.doc_id where doctor.doc_id='DOC007' order by book_consult.consult_id;

select * from doc_view;

/*INDEXES*/
1. CREATE UNIQUE INDEX patindex ON patient(patient_name,patient_address);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='PATIENT';
2. CREATE UNIQUE INDEX Med_index ON medicine_list(medicine_name);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='MEDICINE_LIST';
     3. CREATE INDEX room_no ON room_book(Room_no);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='ROOM_BOOK';

4. CREATE UNIQUE INDEX phar_phone_index ON phar_phone(phar_phone_no);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='PHAR_PHONE';
5. CREATE INDEX bill_index ON patient_medicine(bill_date);
SELECT * FROM ALL_INDEXES WHERE TABLE_NAME='PATIENT_MEDICINE';



 

