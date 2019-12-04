--Ticket #12
/*
alter table db_ddladmin.Anwaltbutler_Mitarbeiter
add constraint FK_AbteilungsNr foreign key (AbteilungsNr)
    references db_ddladmin.Anwaltbutler_Abteilung (AbteilungsNr)
    on update cascade
    on delete set null
go

alter table db_ddladmin.Anwaltbutler_Mitarbeiter_Projekt
add constraint PK_MNr_PNr primary key (MitarbeiterNr,ProjektNr),
    constraint FK_MitarbeiterNr foreign key (MitarbeiterNr)
    references db_ddladmin.Anwaltbutler_Mitarbeiter (MitarbeiterNr)
    on update cascade
    on delete no action,
    constraint FK_ProjektNr foreign key (ProjektNr)
    references db_ddladmin.Anwaltbutler_Projekt (ProjektNr)
    on update cascade
    on delete no action
go

alter table db_ddladmin.Anwaltbutler_Mitarbeiter
add gehalt smallmoney,
    constraint ck_gehalt check (gehalt>0)
go

alter table db_ddladmin.Anwaltbutler_Mitarbeiter
alter column NName varchar(100)
go
--*/
-- Ticket #13
/*
alter table db_ddladmin.Anwaltbutler_Mitarbeiter
drop constraint ck_gehalt
go
alter table db_ddladmin.Anwaltbutler_Projekt
drop column Kostensatz
go
--*/
--Ticket #14
/*
drop table db_ddladmin.Elblieferung_Artikel

create table db_ddladmin.Elblieferung_Artikel(
    p_art_id int primary key identity(0,1) not null,
    aktBestand int,
    minBestand int,
    umsatzsteuer decimal(3,2),
    bezeichnung varchar(50),
    preis smallmoney,
    istDiabGeeignet bit,
    imSortimentSeit date,
    pathFotoProdukt varchar(max)
)
--*/
--Ticket #15
/*
insert into db_ddladmin.Elblieferung_Artikel(bezeichnung,aktBestand,minBestand,umsatzsteuer,imSortimentSeit,preis,istDiabGeeignet)
values ('Buch Oscar Wilde Zitate aus se',null,10,0.07,'9.11.15',6.59,0),
       ('Berghain für Dummies',5,5,0.19,'18.9.17',14.56,0),
       ('Do It Yourself Vintage Look',17,10,null,'29.6.15',7.5,0),
       ('Britzer Mate',397,50,0.07,'18.9.17',1.23,0),
       ('Bio Spritz',473,100,0.07,'3.8.14',12.45,0),
       ('Hipster-Treter',120,25,0.19,null,99.9,1),
       ('Avocado-Snack',18,10,0.07,null,2.19,1),
       ('Schmackofatz-Biokekse',36,30,0.19,'9.9.16',3.29,0),
       ('Instant-Quinoa-Bratlinge',258,100,0.19,'10.4.18',2.22,1),
       ('Chia-Riegel mit Agavesaft',58,50,0.19,'14.10.19',1.55,0)
--*/
--Ticket #16
/*
insert into db_ddladmin.Anwaltbutler_Abteilung
values ('EIK','Einkauf'),
       ('PER','Personal'),
       ('VEK','Verkauf')
go

insert into db_ddladmin.Anwaltbutler_Mitarbeiter
values ('Klara','Geist','PER',null),
       ('Tatjana','Hohl','EIK',null),
       ('Tatjana Sush','Hohl','PER',null),
       ('Theodor','Wildschrei','PER',null),
       ('Hans-Otto','Richter','VEK',null),
       ('Brunhilde','Wiesenland','EIK',null)
go

insert into db_ddladmin.Anwaltbutler_Projekt
values ('Konkurrenzanalyse'),
       ('Kundenpsychologie'),
       ('Kundenumfrage'),
       ('Verkaufspromotion')
go

insert into db_ddladmin.Anwaltbutler_Mitarbeiter_Projekt
values (0,1,130),
       (0,3,80),
       (1,0,90),
       (1,1,25),
       (1,3,60),
       (2,2,120),
       (3,3,140),
       (4,0,20),
       (4,3,150),
       (5,2,145)
--*/
--Ticket #17
/*
update e
set preis=79.9
from db_ddladmin.Elblieferung_Artikel as e
where p_art_id=5
go

update e
set preis=preis*0.95
from db_ddladmin.Elblieferung_Artikel as e
where p_art_id in (0,1,2,3,4,6,7,8,9)
go

delete from db_ddladmin.Elblieferung_Artikel
where p_art_id=2
go

update e
set bezeichnung='"Oscar Wilde" Zitate',
    aktBestand=13
from db_ddladmin.Elblieferung_Artikel as e
where p_art_id=0
go

update e
set imSortimentSeit='26.11.19'
from db_ddladmin.Elblieferung_Artikel as e
where p_art_id in (5,6)
go
--*/
--Ticket #19
--/*
update m
set NName='Kob-Hohl'
from db_ddladmin.Anwaltbutler_Mitarbeiter as m
where MitarbeiterNr=1
go

delete from db_ddladmin.Anwaltbutler_Mitarbeiter
where MitarbeiterNr=4
go

insert into db_ddladmin.Anwaltbutler_Mitarbeiter
values ('Caro','Kästchen','VEK',null)
go
insert into db_ddladmin.Anwaltbutler_Mitarbeiter_Projekt
values (6,3,73)
go

update a
set AbteilungsNr='KUF',
    Bezeichnung='Kaufen'
from db_ddladmin.Anwaltbutler_Abteilung as a
where AbteilungsNr='EIK'
go
update db_ddladmin.Anwaltbutler_Mitarbeiter
set AbteilungsNr='KUF'
where AbteilungsNr='VEK'
go
delete from db_ddladmin.Anwaltbutler_Abteilung
where AbteilungsNr='VEK'
go

update db_ddladmin.Anwaltbutler_Mitarbeiter_Projekt
set Stundenzahl=case when Stundenzahl>50 then Stundenzahl*0.9 else Stundenzahl*0.95 end
go

insert into db_ddladmin.Anwaltbutler_Abteilung
values ('GRS','Grosshandel')
go
update db_ddladmin.Anwaltbutler_Mitarbeiter
set AbteilungsNr='GRS'
where NName='Hohl'
go
--*/
