--Query 1
select L_ID from T_LION where sdo_filter(L_COOR,sdo_geometry(2003,null,null,sdo_elem_info_array(1,1003,3),sdo_ordinate_array(150,200,400,350)))='TRUE';

--Query 2
select l.L_ID from T_LION l,T_POND p where p.P_ID='P1' and sdo_within_distance(p.P_COOR,l.L_COOR,'distance=150')='TRUE';

--QUERY 3
select p.P_ID from T_LION l,T_POND p where l.L_ID='L2' and sdo_nn(p.P_COOR,l.L_COOR,'sdo_num_res=3',1)='TRUE' order by sdo_nn_distance(1) asc;

--QUERY 4
select l.L_ID,p.P_ID from T_LION l,T_POND p where sdo_filter(l.L_COOR,p.P_COOR,'querytype=join')='TRUE';

--QUERY 5
select r.R_ID from T_LION l,T_REGION r where sdo_relate(l.L_COOR,r.R_COOR,'mask=ANYINTERACT')='TRUE'
MINUS select r.R_ID from T_REGION r,T_POND p where sdo_relate(p.P_COOR,r.R_COOR,'mask=ANYINTERACT')='TRUE';

--QUERY 6
select L_ID from T_LION
MINUS
select l.L_ID from T_LION l,T_AMBULANCE a where sdo_relate(l.L_COOR,a.A_COOR,'mask=ANYINTERACT')='TRUE';
