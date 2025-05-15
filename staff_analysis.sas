/*Scenarii 3C*/

libname cert '/home/u64206886/';

/* task1: create a new temporary dataset in the work library called staffReport*/
data work.staffReports;
    set cert.staff;
    where wageCategory = 'H'; /*task2: keep only the rows where wageCategory = 'H'*/

    format DOB ddmmyy10.; /*task3: apply a format to the DOB as ddmmyy10.*/

    raise = round(wageRate * 0.30, 0.001); /*task4: create a new variable called raise whose value is wageRate multiplied by 30%, formated with 3 decimal place*/
run;

proc print data=work.staffReports (obs=10); 
    var ID Name DOB WageCategory WageRate Bonus raise;
    title 'Filtered Staff with WageCategory H and Calculated Raise';
run;

/*task5: determine the grand total of raise for the entire dataset*/
proc means data=work.staffReports sum maxdec=3;
    var raise;
    title 'Grand Total of Raise';
run;

/*
Q1: For observation 5, what is the value of DOB ? 28-04-1951
Q2: For observation 6, what is the value of raise ? Round your answer to 1 decimal places. 5
Q3: What is the grand total of Raise for the entire data set ? 24.408
*/