PETROLEUM = load '/user/acadgild/pig/petroleum/petroleum.txt' using PigStorage(',') as 
(distributorid:chararray,distributorname:chararray,buyrate:chararray,sellrate:chararray,volumeIn:int,volumeOut:int,year:int);

ORDERBYVOLUMEOUT = order PETROLEUM by volumeOut desc;
DISTRIBUTOR_SOLD_VOLUME = foreach ORDERBYVOLUMEOUT generate year,distributorid,volumeOut;
DISTRIBUTOR_SOLD_VOLUME_LIMIT = limit DISTRIBUTOR_SOLD_VOLUME 10;

store DISTRIBUTOR_SOLD_VOLUME_LIMIT into '/user/acadgild/pig/petroleum/topsalesbyyearwithdistributorid';

