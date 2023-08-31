mydataset = load '/user/training/mrinaal/pigfiles/demo/crimeyear.csv' using PigStorage(',') as (state:chararray,crime:chararray,y1:int,y2:int,y3:int,y4:int,y5:int,y6:int,y7:int,y8:int,y9:int,y10:int,y11:int,y12:int);

df = group mydataset by state;

result = foreach df generate group,SUM(mydataset.y6);

df2 = group mydataset all;

result2 = foreach df2 generate group , SUM(mydataset.y6);


dump result;
dump result2;
