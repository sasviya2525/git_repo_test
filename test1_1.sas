/* proc printto log='/home/sasdemo/test1_1.log'; run; */
cas test11 authinfo="/home/&sysuserid./.authinfo" host="localhost" port=5570;
*caslib test path='/home/sasdemo' global;
caslib _ALL_ assign;

proc casutil;
droptable incaslib='test' casdata='class1' quiet;
quit;

data test.class1 (copies=0 replace=yes compress=yes promote=yes) ;
set sashelp.class;
run;

/* add 3 second sleep time to job to make sure that the second step waits for both jobs in step1 to complete */
data _null_;
	sleeptime=sleep(3,1);
run;

/*data a;
set b;
run;*/


cas test11 terminate;
/* proc printto; run; */