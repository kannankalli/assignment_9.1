PETROLEUM = load '/user/acadgild/pig/petroleum/petroleum.txt' using PigStorage(',') as 
(distributorid:chararray,distributorname:chararray,buyrate:chararray,sellrate:chararray,volumeIn:int,volumeOut:int,year:int);

DISTRIBUTOR_GROUP = group PETROLEUM by distributorname;
DISTRIBUTOR_SOLD_VOLUME = foreach DISTRIBUTOR_GROUP generate group,SUM(PETROLEUM.volumeOut);

store DISTRIBUTOR_SOLD_VOLUME into '/user/acadgild/pig/petroleum/distributorsoldvolume';

