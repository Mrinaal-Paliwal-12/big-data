mydataset = load '/user/training/mrinaal/pigfiles/demo/customer.txt' using PigStorage(',') as (id:int,name:chararray,age:int,gender:chararray,city:chararray,type:chararray);

f1 = filter mydataset by
 age >= 20 and age <= 30;
gf1 = group f1 all;
result1 = foreach gf1 generate COUNT(f1);

f2 = filter mydataset by
 age >= 31 and age <= 45;
gf2 = group f2 all;
result2 = foreach gf2 generate COUNT(f2);

f3 = filter mydataset by
 age >= 46 and age <= 60;
gf3 = group f3 all;
result3 = foreach gf3 generate COUNT(f3);

f4 = filter mydataset by
 age >= 60;
gf4 = group f4 all;
result4 = foreach gf4 generate COUNT(f4);

finalstr = UNION result1,result2,result3,result4;

dump finalstr;

