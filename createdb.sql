create table T_LION(L_ID varchar(10) primary key,L_COOR sdo_geometry);
insert into user_sdo_geom_metadata values('T_LION','L_COOR',SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X',0,1000,0.0005),SDO_DIM_ELEMENT('Y',0,1000,0.0005)),NULL);
CREATE INDEX SI_Lion ON T_Lion(L_COOR) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

insert into T_Lion values('L1',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(50,450,null),null,null));
insert into T_Lion values('L2',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(230,475,null),null,null));
insert into T_Lion values('L3',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(370,455,null),null,null));
insert into T_Lion values('L4',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(450,300,null),null,null));
insert into T_Lion values('L5',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(20,20,null),null,null));
insert into T_Lion values('L6',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(350,300,null),null,null));
insert into T_Lion values('L7',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(35,10,null),null,null));
insert into T_Lion values('L8',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(115,350,null),null,null));
insert into T_Lion values('L9',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(240,335,null),null,null));
insert into T_Lion values('L10',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(355,190,null),null,null));
insert into T_Lion values('L11',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(30,210,null),null,null));
insert into T_Lion values('L12',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(50,200,null),null,null));
insert into T_Lion values('L13',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(170,230,null),null,null));
insert into T_Lion values('L14',SDO_GEOMETRY(2001,null,SDO_POINT_TYPE(350,50,null),null,null));

create table T_REGION(R_ID varchar(10) primary key,R_COOR sdo_geometry);
insert into user_sdo_geom_metadata values('T_REGION','R_COOR',SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X',0,1000,0.0005),SDO_DIM_ELEMENT('Y',0,1000,0.0005)),NULL);
CREATE INDEX SI_REGION ON T_REGION(R_COOR) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

insert into T_region values('R1',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(0,0,150,0,100,100,0,100)));
insert into T_region values('R2',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(150,0,250,0,300,150,100,100)));
insert into T_region values('R3',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(250,0,400,0,400,100,300,150)));
insert into T_region values('R4',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(400,0,500,0,500,100,400,100)));
insert into T_region values('R5',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(400,100,500,100,500,250,400,200)));
insert into T_region values('R6',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(300,150,400,100,400,200,250,250)));
insert into T_region values('R7',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(100,100,300,150,250,250,150,250)));
insert into T_region values('R8',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(0,100,100,100,150,250,0,250)));
insert into T_region values('R9',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(0,250,150,250,150,400,0,350)));
insert into T_region values('R10',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(150,250,250,250,300,350,150,400)));
insert into T_region values('R11',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(250,250,400,200,400,350,300,350)));
insert into T_region values('R12',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(400,200,500,250,500,350,400,350)));
insert into T_region values('R13',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(400,350,500,350,500,500,400,500)));
insert into T_region values('R14',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(300,350,400,350,400,500,300,500)));
insert into T_region values('R15',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(150,400,300,350,300,500,150,500)));
insert into T_region values('R16',mdsys.sdo_geometry(2003,null,null,SDO_ELEM_INFO_ARRAY(1,1003,1),SDO_ORDINATE_ARRAY(0,350,150,400,150,500,0,500)));

create table T_POND(P_ID varchar(10) primary key,P_COOR sdo_geometry);
insert into user_sdo_geom_metadata values('T_POND','P_COOR',SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X',0,1000,0.0005),SDO_DIM_ELEMENT('Y',0,1000,0.0005)),NULL);
CREATE INDEX SI_POND ON T_POND(P_COOR) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

INSERT INTO T_POND VALUES('P1',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(60,430,75,445,90,430)));
INSERT INTO T_POND VALUES('P2',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(205,430,220,445,225,430)));
INSERT INTO T_POND VALUES('P3',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(355,435,370,450,385,435)));
INSERT INTO T_POND VALUES('P4',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(60,330,75,345,90,330)));
INSERT INTO T_POND VALUES('P5',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(305,280,320,295,335,280)));
INSERT INTO T_POND VALUES('P6',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(205,320,220,335,235,320)));
INSERT INTO T_POND VALUES('P7',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(455,280,470,295,485,280)));
INSERT INTO T_POND VALUES('P8',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(360,175,375,190,390,175)));

create table T_AMBULANCE(A_ID varchar(10) primary key,A_COOR sdo_geometry);
insert into user_sdo_geom_metadata values('T_AMBULANCE','A_COOR',SDO_DIM_ARRAY(SDO_DIM_ELEMENT('X',0,1000,0.0005),SDO_DIM_ELEMENT('Y',0,1000,0.0005)),NULL);
CREATE INDEX SI_AMBULANCE ON T_AMBULANCE(A_COOR) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

INSERT INTO T_AMBULANCE VALUES('A1',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(10,400,100,490,190,400)));
INSERT INTO T_AMBULANCE VALUES('A2',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(160,400,250,490,340,400)));
INSERT INTO T_AMBULANCE VALUES('A3',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(310,400,400,490,490,400)));
INSERT INTO T_AMBULANCE VALUES('A4',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(310,250,400,340,490,250)));
INSERT INTO T_AMBULANCE VALUES('A5',SDO_GEOMETRY(2003,NULL,NULL,SDO_ELEM_INFO_ARRAY(1,1003,4),SDO_ORDINATE_ARRAY(210,100,300,190,390,100)));