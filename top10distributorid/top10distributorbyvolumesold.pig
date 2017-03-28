PETROLEUM = load '/user/acadgild/pig/petroleum/petroleum.txt' using PigStorage(',') as 
(distributorid:chararray,distributorname:chararray,buyrate:chararray,sellrate:chararray,volumeIn:int,volumeOut:int,year:int);

DISTRIBUTOR_GROUP = group PETROLEUM by distributorid;
DISTRIBUTOR_SOLD_VOLUME = foreach DISTRIBUTOR_GROUP generate group as distributorid,SUM(PETROLEUM.volumeOut) as volumeOut;
DISTRIBUTOR_SOLD_VOLUME_ORDERBY_VOLUMEOUT = order DISTRIBUTOR_SOLD_VOLUME by volumeOut;
DISTRIBUTOR_SOLD_VOLUME_TOP10 = limit DISTRIBUTOR_SOLD_VOLUME_ORDERBY_VOLUMEOUT 10;
store DISTRIBUTOR_SOLD_VOLUME_TOP10 into '/user/acadgild/pig/petroleum/top10distributoridbysoldvolume';

