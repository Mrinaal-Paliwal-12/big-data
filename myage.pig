mydataset = load '/user/training/mrinaal/pigfiles/demo/crimeage.csv' using PigStorage(',') as (state:chararray,crime:chararray,mb1:int,fb1:int,mb2:int,fb2:int,mb3:int,fb3:int,mb4:int,fb4:int,mb5:int,fb5:int,mb6:int,fb6:int,tot:int);

diff_state = group mydataset by (crime,state);

result = foreach diff_state generate group, SUM(mydataset.fb2);

dump result;
