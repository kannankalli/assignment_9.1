PETROLEUM = load '/user/acadgild/pig/petroleum/petroleum.txt' using PigStorage(',') as 
(distributorid:chararray,distributorname:chararray,buyrate:chararray,sellrate:chararray,volumeIn:int,volumeOut:int,year:int);

DISTRIBUTOR_GROUP = group PETROLEUM by distributorname;
DISTRIBUTOR_SOLD_VOLUME = foreach DISTRIBUTOR_GROUP generate group as distributorname,SUM(PETROLEUM.volumeOut) as volumeOut;
DISTRIBUTOR_SOLD_VOLUME_ORDERBY_VOLUMEOUT = order DISTRIBUTOR_SOLD_VOLUME by volumeOut ASC;
DISTRIBUTOR_SOLD_VOLUME_LEAST = limit DISTRIBUTOR_SOLD_VOLUME_ORDERBY_VOLUMEOUT 1;
store DISTRIBUTOR_SOLD_VOLUME_LEAST into '/user/acadgild/pig/petroleum/leastsoldbydistributorname';

