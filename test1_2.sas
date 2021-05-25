cas test12 authinfo="/home/&sysuserid./.authinfo" host="localhost" port=5570;
*caslib test path='/home/sasdemo' global;
caslib _ALL_ assign;

proc casutil;
droptable incaslib='test' casdata='class2' quiet;
quit;

data test.class2 (copies=0 replace=yes compress=yes promote=yes) ;
set sashelp.class;
run;

cas test12 terminate;
