%let UID= 660185526 ;
%let libpath=/folders/myfolders/PermLib ;
%let pdfpath=/folders/myfolders/Final Exercise ;

libname HW3 "&libpath." ;
ods pdf file="&pdfpath.\HW3-&UID..pdf" ;

title "&SYSUSERID. - &UID. - Final Exericse" ;



/***************************************************************************************/
/***************************************************************************************/
/***************************** Macrotize Long Strings **********************************/
/***************************************************************************************/
/***************************************************************************************/

%let droprenamemv = (drop = CRSDepTime DepTime CRSArrTime ArrTime FirstDepTime WheelsOff WheelsOn Div1WheelsOn Div1WheelsOff Div2WheelsOn 
Div2WheelsOff Div3WheelsOn Div3WheelsOff Div4WheelsOn Div4WheelsOff Div5WheelsOn Div5WheelsOff 
rename =(CRSDepTimeF=CRSDepTime DepTimeF=DepTime CRSArrTimeF=CRSArrTime ArrTimeF=ArrTime FirstDepTimeF=FirstDepTime 
WheelsOffF=WheelsOff WheelsOnF=WheelsOn Div1WheelsOnF=Div1WheelsOn Div1WheelsOffF=Div1WheelsOff Div2WheelsOnF=Div2WheelsOn 
Div2WheelsOffF=Div2WheelsOff Div3WheelsOnF=Div3WheelsOn Div3WheelsOffF=Div3WheelsOff Div4WheelsOnF=Div4WheelsOn 
Div4WheelsOffF=Div4WheelsOff Div5WheelsOnF=Div5WheelsOn Div5WheelsOffF=Div5WheelsOff) ) ;

%let lengthmv = length Year 4. Quarter 4. Month 4. DayofMonth 4. DayOfWeek 4. FlightDate 8. UniqueCarrier $8. AirlineID  $4. 
Carrier  $4. TailNum  $10. FlightNum  4. OriginAirportID  $8. OriginAirportSeqID  $8. OriginCityMarketID  $6. Origin  $32. 
OriginCityName  $32. OriginState  $32. OriginStateFips  $32. OriginStateName  $32. OriginWac  $32. DestAirportID  $6. 
DestAirportSeqID  $6. DestCityMarketID  $6. Dest  $32. DestCityName  $32. DestState  $32. DestStateFips  $32. 
DestStateName  $32. DestWac  $32. CRSDepTime  $8. CRSDepTimeF 8. DepTime  $8. DepTimeF  8. DepDelay 4. DepDelayMinutes 4. 
DepDel15 4. DepartureDelayGroups 4. DepTimeBlk  $9. TaxiOut 4. WheelsOff  $8. WheelsOffF  8. WheelsOn  $8. WheelsOnF  8. 
TaxiIn 4. CRSArrTime  $8. CRSArrTimeF  8. ArrTime  $8. ArrTimeF  8. ArrDelay 4. ArrDelayMinutes 4. ArrDel15 4. 
ArrivalDelayGroups  4. ArrTimeBlk  $9. Cancelled 4. CancellationCode  $8. Diverted  4. CRSElapsedTime 4. ActualElapsedTime 4. 
AirTime 4. Flights 4. Distance 4. DistanceGroup 4. CarrierDelay 4. WeatherDelay 4. NASDelay 4. SecurityDelay 4. LateAircraftDelay 4. 
FirstDepTime  $8. FirstDepTimeF  8. TotalAddGTime 4. LongestAddGTime 4. DivAirportLandings 4. DivReachedDest 4. DivActualElapsedTime 4. DivArrDelay 4. 
DivDistance 4. Div1Airport  $8. Div1AirportID  $8. Div1AirportSeqID  $8. Div1WheelsOn  $8. Div1WheelsOnF  8. Div1TotalGTime 4. Div1LongestGTime 4. 
Div1WheelsOff  $8. Div1WheelsOffF  8. Div1TailNum  $8. Div2Airport  $8. Div2AirportID  $8. Div2AirportSeqID  $8. Div2WheelsOn  $8. Div2WheelsOnF  8. Div2TotalGTime 4. 
Div2LongestGTime 4. Div2WheelsOff  $8. Div2WheelsOffF  8. Div2TailNum  $8. Div3Airport  $8. Div3AirportID  $8. Div3AirportSeqID  $8. Div3WheelsOn  $8. Div3WheelsOnF  8. 
Div3TotalGTime 4. Div3LongestGTime 4. Div3WheelsOff  $8. Div3WheelsOffF  8. Div3TailNum  $8. Div4Airport  $8. Div4AirportID  $8. Div4AirportSeqID  $8. 
Div4WheelsOn  $8. Div4WheelsOnF  8. Div4TotalGTime 4. Div4LongestGTime 4. Div4WheelsOff  $8. Div4WheelsOffF  8. Div4TailNum  $8. Div5Airport  $8. Div5AirportID  $8. 
Div5AirportSeqID  $8. Div5WheelsOn  $8. Div5WheelsOnF  8. Div5TotalGTime 4. Div5LongestGTime 4. Div5WheelsOff  $8. Div5WheelsOffF  8. Div5TailNum   $8.  ; 

%let inputmv = input Year Quarter Month DayofMonth DayOfWeek FlightDate :yymmdd10. UniqueCarrier $ AirlineID $ Carrier $ TailNum $ FlightNum 
OriginAirportID $ OriginAirportSeqID $ OriginCityMarketID $ Origin $ OriginCityName $ OriginState $ OriginStateFips $ 
OriginStateName $ OriginWac $ DestAirportID $ DestAirportSeqID $ DestCityMarketID $ Dest $ DestCityName $ DestState $ 
DestStateFips $ DestStateName $ DestWac $ CRSDepTime $ DepTime $ DepDelay DepDelayMinutes DepDel15 DepartureDelayGroups 
DepTimeBlk $ TaxiOut WheelsOff $ WheelsOn $ TaxiIn CRSArrTime $ ArrTime $ ArrDelay ArrDelayMinutes ArrDel15 ArrivalDelayGroups 
ArrTimeBlk $ Cancelled CancellationCode $ Diverted CRSElapsedTime ActualElapsedTime AirTime Flights Distance DistanceGroup 
CarrierDelay WeatherDelay NASDelay SecurityDelay LateAircraftDelay FirstDepTime $ TotalAddGTime LongestAddGTime 
DivAirportLandings DivReachedDest DivActualElapsedTime DivArrDelay DivDistance Div1Airport $ Div1AirportID $ Div1AirportSeqID $ 
Div1WheelsOn $ Div1TotalGTime Div1LongestGTime Div1WheelsOff $ Div1TailNum $ Div2Airport $ Div2AirportID $ Div2AirportSeqID $ 
Div2WheelsOn $ Div2TotalGTime Div2LongestGTime Div2WheelsOff $ Div2TailNum $ Div3Airport $ Div3AirportID $ Div3AirportSeqID $ 
Div3WheelsOn $ Div3TotalGTime Div3LongestGTime Div3WheelsOff $ Div3TailNum $ Div4Airport $ Div4AirportID $ Div4AirportSeqID $ 
Div4WheelsOn $ Div4TotalGTime Div4LongestGTime Div4WheelsOff $ Div4TailNum $ Div5Airport $ Div5AirportID $ Div5AirportSeqID $ 
Div5WheelsOn $ Div5TotalGTime Div5LongestGTime Div5WheelsOff $ Div5TailNum  $ ;

%macro timevars ;
if CRSDepTime="2400" then do ;
	CRSDepTimeF=input("23:59", time5.) ; end ;
		else do ;
			format CRSDepTimeF time5. ;
			CRSDepTimeF=input(substr(CRSDepTime,1,2)||":"||substr(CRSDepTime,3,2), time5.) ; end ;
if DepTime="2400" then do ;
	DepTimeF=input("23:59", time5.) ; end ;
		else do ;
			format DepTimeF time5. ;
			DepTimeF=input(substr(DepTime,1,2)||":"||substr(DepTime,3,2), time5.) ; end ;
if CRSArrTime="2400" then do ;
	CRSArrTimeF=input("23:59", time5.) ; end ;
		else do ;
			format CRSArrTimeF time5. ;
			CRSArrTimeF=input(substr(CRSArrTime,1,2)||":"||substr(CRSArrTime,3,2), time5.) ; end ;
if ArrTime="2400" then do ;
	ArrTimeF=input("23:59", time5.) ; end ;
		else do ;
			format ArrTimeF time5. ;
			ArrTimeF=input(substr(ArrTime,1,2)||":"||substr(ArrTime,3,2), time5.) ; end ;
if FirstDepTime="2400" then do ;
	FirstDepTimeF=input("23:59", time5.) ; end ;
		else do ;
			format FirstDepTimeF time5. ;
			FirstDepTimeF=input(substr(FirstDepTime,1,2)||":"||substr(FirstDepTime,3,2), time5.) ; end ;
if WheelsOff="2400" then do ;
	WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format WheelsOffF time5. ;
			WheelsOffF=input(substr(WheelsOff,1,2)||":"||substr(WheelsOff,3,2), time5.) ; end ;
if WheelsOn="2400" then do ;
	WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format WheelsOnF time5. ;
			WheelsOnF=input(substr(WheelsOn,1,2)||":"||substr(WheelsOn,3,2), time5.) ; end ;
if Div1WheelsOn="2400" then do ;
	Div1WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format Div1WheelsOnF time5. ;
			Div1WheelsOnF=input(substr(Div1WheelsOn,1,2)||":"||substr(Div1WheelsOn,3,2), time5.) ; end ;
if Div1WheelsOff="2400" then do ;
	Div1WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format Div1WheelsOffF time5. ;
			Div1WheelsOffF=input(substr(Div1WheelsOff,1,2)||":"||substr(Div1WheelsOff,3,2), time5.) ; end ;
if Div2WheelsOn="2400" then do ;
	Div2WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format Div2WheelsOnF time5. ;
			Div2WheelsOnF=input(substr(Div2WheelsOn,1,2)||":"||substr(Div2WheelsOn,3,2), time5.) ; end ;
if Div2WheelsOff="2400" then do ;
	Div2WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format Div2WheelsOffF time5. ;
			Div2WheelsOffF=input(substr(Div2WheelsOff,1,2)||":"||substr(Div2WheelsOff,3,2), time5.) ; end ;
if Div3WheelsOn="2400" then do ;
	Div3WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format Div3WheelsOnF time5. ;
			Div3WheelsOnF=input(substr(Div3WheelsOn,1,2)||":"||substr(Div3WheelsOn,3,2), time5.) ; end ;
if Div3WheelsOff="2400" then do ;
	Div3WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format Div3WheelsOffF time5. ;
			Div3WheelsOffF=input(substr(Div3WheelsOff,1,2)||":"||substr(Div3WheelsOff,3,2), time5.) ; end ;
if Div4WheelsOn="2400" then do ;
	Div4WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format Div4WheelsOnF time5. ;
			Div4WheelsOnF=input(substr(Div4WheelsOn,1,2)||":"||substr(Div4WheelsOn,3,2), time5.) ; end ;
if Div4WheelsOff="2400" then do ;
	Div4WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format Div4WheelsOffF time5. ;
			Div4WheelsOffF=input(substr(Div4WheelsOff,1,2)||":"||substr(Div4WheelsOff,3,2), time5.) ; end ;
if Div5WheelsOn="2400" then do ;
	Div5WheelsOnF=input("23:59", time5.) ; end ;
		else do ;
			format Div5WheelsOnF time5. ;
			Div5WheelsOnF=input(substr(Div5WheelsOn,1,2)||":"||substr(Div5WheelsOn,3,2), time5.) ; end ;
if Div5WheelsOff="2400" then do ;
	Div5WheelsOffF=input("23:59", time5.) ; end ;
		else do ;
			format Div5WheelsOffF time5. ;
			Div5WheelsOffF=input(substr(Div5WheelsOff,1,2)||":"||substr(Div5WheelsOff,3,2), time5.) ; end ;
%mend ;


/***************************************************************************************/
/***************************************************************************************/
/**************** Reference Multiple Files in a SAS Dataset Manifest *******************/
/***************************************************************************************/
/***************************************************************************************/

filename IN1 
"/folders/myfolders/Final Exercise/On_Time_On_Time_Performance_2015_5.csv" ;

data HW3.BTS201505 &droprenamemv. ;
infile IN1 dsd delimiter=',' firstobs=2 obs=max ;

	&lengthmv. ;
format flightdate yymmdd10.;
	&inputmv. ;
	%timevars ;

run ;


/*****************************************************************************/
/*****************************************************************************/
/***** Use PROC SQL to Generate a random subset of the BTS file **************/
/*****************************************************************************/
/*****************************************************************************/
proc sql ;
* <Randomly subset monthly file here.> ;
create table HW3.BTS201505_subids as 
select carrier , tailnum , flightdate , count(*) as NN , ranuni(&UID.) as random 
from HW3.BTS201505
group by carrier , tailnum , flightdate
having random>.2 ; 


create table HW3.BTS201505_&uid. as 
select a.*
from HW3.BTS201505 a inner join HW3.BTS201505_subids b
	on a.carrier=b.carrier and  a.flightdate=b.flightdate and a.tailnum=b.tailnum ;

drop table HW3.BTS201505_subids ;

quit ;

/********* Replace MNAR Missing Values by Rule **************/

PROC STDIZE data=HW3.BTS201505_&uid. out=HW3.BTS201505_&uid. reponly missing=0 ;
VAR DepDelay ArrDelay Distance ;
run ;

/********* END / Replace MNAR Missing Values by Rule **************/




/********* Create Lag Variables: 
	ArrDelayLag ArrDelayLagInd ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag 
**************/

proc sort data=HW3.BTS201505_&uid. ;
by Carrier TailNum FlightDate ;
run ;


data HW3.BTS201505_&uid.;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2Ind 4. ;
set HW3.BTS201505_&uid.;
by Carrier TailNum FlightDate ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	ArrDelayLag2=0 ;
	ArrDelayLag2Ind=0 ;

	CancelledLag = 0 ;
	DistanceLag = 0 ;

	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

	ArrDelayLag2Ind=(ArrDelayLag2>0) ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;

/********* END / Create Lag Variables ***********************/




/********* Generate OLS estimates of model:

DepDelay = Carrier CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag

**************/


proc glm data=HW3.BTS201505_&uid.;
	class Carrier ;
	model DepDelay = Carrier CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 ArrDelayLag2Ind CancelledLag DistanceLag ;
run ; quit ;

proc reg data=HW3.BTS201505_&uid.;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 ArrDelayLag2Ind CancelledLag DistanceLag ;
run ;


/********* END / Generate OLS estimates of OLS model **************/



/********* Read the O'Hare 2015 weather file (Weather_ord_2015_miss.txt) into a SAS dataset. 
Variables are Flight Date, Weather Station Name, Daily Precipitation (PRCP), Snow Depth on Ground (SNWD), Daily Snowfall (SNOW), 
Daily Low Temp (TEMPMIN), and  Daily High Temp (TEMPMAX).

1.a. Note that the weather file includes missing values.
***********************************************************/
FILENAME IN1 "/folders/myfolders/Final Exercise/Weather_ord_2015_miss_prcp.csv" ;

data HW3.Weather_ORD ; 
infile IN1 dsd delimiter="," dlmstr=',' missover firstobs=2 ;
length FlightDate 8. WeatherStation $36. PRCP 4. SNWD 4. SNOW 4. TempMAX 4. TempMin 4. MonthNum 4.;
format FlightDate mmddyy10. ;
input FlightDate :yymmdd10. WeatherStation $ PRCP SNWD SNOW TempMAX TempMin MonthNum ;
	
run ;

/** Sorting the Weather file by FlightDate **/
proc sort data=HW3.Weather_ORD ;
by FlightDate ;
run ;

/** Filtering the Weather file for the month of May **/

data HW3.Weather_ORD ;
set HW3.Weather_ORD;
if '01May2015'd <= FlightDate <= '31May2015'd ;
run ;


/** Sorting the May 2015 BTS file by FlightDate **/
proc sort data=HW3.BTS201505_&uid. ;
by flightdate;
run ;


/***********************************************************
1.b. Create a new dataset named BTS201505WTHR that MERGEs the partial weather file to the May, 2015 BTS file in a DATA step-Include only observations with ORIGIN="ORD" in the new dataset.
***********************************************************/


data HW3.BTS201505WTHR (drop=div:) ;
merge HW3.BTS201505_&uid. 
	HW3.Weather_ORD(keep= WeatherStation FlightDate PRCP SNWD SNOW TempMAX TempMin MonthNum);
by FlightDate ;
if Origin='ORD' ;
run ;

/***********************************************************

1.c. Create a new dataset named BTS201505WTHRIMP with 12 iterations of multiple imputation values for missing values of prcp, tempmin, and tempmax.
***********************************************************/

/** Looking at the missing values **/
proc reg data=HW3.BTS201505WTHR outest=HW3.BTS201505WTHR_reg ;
model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2Ind ArrDelayLag2
	CancelledLag DistanceLag PRCP SNWD SNOW TempMAX TempMin ;
where cancelled=0  ;
run ; quit ;

proc means N NMISS data=HW3.BTS201505WTHR ;
var SNWD SNOW TempMin PRCP TempMAX ;
run ;

/** Multiple imputation to replace missing values of PRCP, TempMax and TempMin **/

proc mi data= HW3.BTS201505WTHR nimpute=12 out=HW3.BTS201505WTHRIMP seed=54321;
fcs;
var PRCP TempMAX TempMin;
run;

proc sort data=HW3.BTS201505WTHRIMP ;
by _imputation_ ;
run ;

/** Checking missing values after imputation **/
proc means data = HW3.BTS201505WTHRIMP n nmiss;
  var _numeric_;
run;


/***********************************************************
1.d. Estimate an OLS regression model for DepDelay, using the following input variables:

CRSDepTime
seqnum
ArrDelayLagInd
ArrDelayLag
ArrDelayLagCum
ArrDelayLag2
DistanceLag
CancelledLag
Tempmin (from the Weather file)
Tempmax (from the Weather file)
PRCP (from the Weather file)

1.e. Use only observations where CANCELLED=0 and ORIGIN="ORD".


***********************************************************/

PROC glm DATA=HW3.BTS201505WTHRIMP;
model DepDelay = CRSDepTime SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 DistanceLag CancelledLag PRCP TempMAX TempMin;
*by Carrier;
where cancelled=0 and Origin = "ORD";
run; 
quit;

proc reg data=HW3.BTS201505WTHRIMP outest=HW3.BTS201505WTHRIMP_mimp COVOUT ;
model DepDelay = CRSDepTime SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 DistanceLag CancelledLag PRCP TempMAX TempMin;
where cancelled=0 and Origin = "ORD";
by _imputation_ ; /* We estimate unique parameters for each set of imputed values */
*title 'Regular OLS regression model for each carrier with DepDelay as the DV using all non-cancelled flights in BTS201505WTHRIMP';
run; 
quit ;

/***********************************************************
1.f. Use an appropriate SAS proc to evaluate the Multiple Imputation parameter estimates for tempmin, tempmax, and prcp.

***********************************************************/

proc mianalyze data=HW3.BTS201505WTHRIMP_mimp ;
modeleffects PRCP TempMAX TempMin ;
run ;




/***********************************************************
Part 2
***********************************************************/


/***********************************************************
- Use an appropriate SAS PROC to impute missing values for MNAR variables DepDelay, ArrDelay, and Distance in HW3.BTS201505_&UID. 
(Do NOT rename  HW3.BTS201505_&UID. Simply replace missing values without changing the name of HW3.BTS201505_&UID.)



- Create Lag1 variables for ArrDelay, Distance, and Cancelled

- Create variables ArrDelayLagInd and ArrDelayLagCum 

- Create Lag2 variables from ArrDelay (ArrDelayLag2 and ArrDelayLag2Ind)
***********************************************************/

/** Replacing missing values for DepDelay, ArrDelay and Distance **/
proc stdize data=HW3.BTS201505_&uid. out=HW3.BTS201505_&uid. reponly missing=0 ;
var DepDelay ArrDelay Distance ;
run ;

/** Sorting BTS dataset by Carrier TailNum FlightDate **/
proc sort data=HW3.BTS201505_&uid. ;
by Carrier TailNum FlightDate ;
run ;

/** Creating Lag Valriables **/
data HW3.BTS201505_&uid.;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2Ind 4. ;
set HW3.BTS201505_&uid.;
by Carrier TailNum FlightDate ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	ArrDelayLag2=0 ;
	ArrDelayLag2Ind=0 ;

	CancelledLag = 0 ;
	DistanceLag = 0 ;

	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

	ArrDelayLag2Ind=(ArrDelayLag2>0) ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;

/***********************************************************
Generate standard OLS parameter estimates from the HW3.BTS201505_&UID. dataset for the following MODEL specification:

DepDelay=Carrier CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 ArrDelayLag2Ind CancelledLag DistanceLag


Generate standard OLS parameter estimates from the HW3.BTS201505_&UID. dataset for the following MODEL specification BY CARRIER:

Use an appropriate PROC option to output the parameter estimates for each BY GROUP to a SAS dataset 
The dataset with parameter estimates will be created with each BY model in a separate row. 
TRANSPOSE that table so that each model appears in a column.
In the TRANSPOSEd table create new variables that compare the percent difference in parameter estimates for each Carrier against the parameter estimates for the "AA" BY group


***********************************************************/

proc glm data=HW3.BTS201505_&uid.; *outstat = HW3.glm_result ;
	class Carrier ;
	model DepDelay = Carrier CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 ArrDelayLag2Ind CancelledLag DistanceLag ;
run ; quit ;

proc reg data=HW3.BTS201505_&uid. outest = HW3.reg_result;
	by Carrier ;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 ArrDelayLag2Ind CancelledLag DistanceLag ;
run ;

proc transpose data = HW3.reg_result out = HW3.transposed_reg_results (drop = AA AS B6 DL EV F9 HA MQ NK OO UA US VX WN
rename = (Col1 = AA Col2 = AS Col3 = B6 Col4 = DL Col5 = EV
 Col6 = F9 Col7 = HA Col8 = MQ Col9 = NK Col10 = OO Col11 = UA Col12 = US Col13 = VX Col14 = WN)) ;
by _Model_;
run;

proc print data = HW3.transposed_reg_results;
run;

data HW3.parameter_diff (drop=_Label_ _Model_ ) ;
set HW3.transposed_reg_results ;
format delta_AS delta_B6 delta_DL delta_EV delta_F9 delta_HA delta_MQ delta_NK delta_OO delta_UA delta_US delta_VX delta_WN percent10.4;
delta_AS=1-(AS/AA);
delta_B6=1- (B6/AA) ;
delta_DL=1- (DL/AA);
delta_EV=1-(EV/AA) ;
delta_F9=1-(F9/AA) ;
delta_HA=1-(HA/AA) ;
delta_MQ=1-(MQ/AA) ;
delta_NK=1-(NK/AA) ;
delta_OO=1-(OO/AA);
delta_UA=1-(UA/AA);
delta_US=1-(US/AA) ;
delta_VX=1-(VX/AA) ;
delta_WN=1-(WN/AA) ;
run;

proc print data = HW3.parameter_diff;
run;



/********* Create CARRIER/TAILNUM/FLIGHTDATE summary data set **************/

proc stdize data=HW3.BTS201505_&uid. out=HW3.BTS201505_&uid. reponly missing=0 ;
var DepDelay ArrDelay Distance ;
run ;

proc sort data=HW3.BTS201505_&uid. ;
by Carrier TailNum FlightDate ;
run ;

data HW3.BTS201505_&UID._DEL15S; 
retain DelayCt 0 MaxCRSDepTime 0 DistanceCum 0 CancelledCt 0;
format MaxCRSDepTime time5.;
set HW3.BTS201505_&UID.; 

by Carrier TailNum FlightDate;

if first.FlightDate = 1 and DepDelay > 15 then do;
	DelayCt = 1 ;
end;

else if first.FlightDate = 1 and DepDelay <= 15 then do;
DelayCt = 0;
end;

else if DepDelay > 15 then do;
DelayCt = DelayCt + 1;
end;

else do;
DelayCt = DelayCt;
end;

if first.FlightDate = 1 then do;
	count = 1;
	MaxCRSDepTime = max(CRSDepTime);
	DistanceCum = Distance;
end;
else do;
	count + 1;
	MaxCRSDepTime = MaxCRSDepTime;
	DistanceCum = DistanceCum + Distance;
end;

if first.FlightDate = 1 and Cancelled = 1 then do;
	CancelledCt = 1;
end;
else if first.FlightDate = 1 and Cancelled = 0 then do;
	CancelledCt = 0;
end;
else do;
	CancelledCt = CancelledCt + Cancelled;
end;
output ;

run;


proc sort data = HW3.BTS201505_&UID._DEL15S;
by Carrier TailNum FlightDate Descending SeqNum;
run;

data HW3.BTS201505_&UID._DEL15S (drop = SeqNum rename = SeqNum1 = SeqNum);
retain LnSeqNUM 0 SeqNum1 0;
set HW3.BTS201505_&UID._DEL15S; 
by Carrier TailNum FlightDate;
if first.FlightDate = 1 then do;
	SeqNum1 = SeqNum;
	LnSeqNUM = log(SeqNum);
end;
else do;
	SeqNum1 = SeqNum1;
	LnSeqNUM = LnSeqNUM;
end;
run;

proc sort data = HW3.BTS201505_&UID._DEL15S;
by Carrier TailNum FlightDate Descending CancelledCt;
run;

data HW3.BTS201505_&UID._DEL15S (drop = CancelledCt);
retain CancelledCount 0;
set HW3.BTS201505_&UID._DEL15S; 
by Carrier TailNum FlightDate;
if first.FlightDate = 1 then do;
	CancelledCount = max(CancelledCt);
end;
else do;
	CancelledCount = CancelledCount;
end;
run;

proc sort data = HW3.BTS201505_&UID._DEL15S;
by Carrier TailNum FlightDate count;
run;


proc sort data = HW3.BTS201505_&UID._DEL15S;
by Carrier TailNum FlightDate Descending DelayCt;
run;

data HW3.BTS201505_&UID._DEL15S; *(drop = DelayCount rename = DelayCt = DelayCount);
retain DelayCount 0;
set HW3.BTS201505_&UID._DEL15S; 
by Carrier TailNum FlightDate;
if first.FlightDate = 1 then do;
	DelayCount = max(DelayCt);
end;
else do;
	DelayCount = DelayCount;
end;
run;

proc sort data = HW3.BTS201505_&UID._DEL15S;
by Carrier TailNum FlightDate count;
run;


/********* END / Create CARRIER/TAILNUM/FLIGHTDATE summary data set **************/





/********* Estimate POISSON model parameters for CARRIER/TAILNUM/FLIGHTDATE summary data set **************/

proc genmod data = HW3.BTS201505_&UID._DEL15S;
class Carrier;
model DelayCt = Carrier MaxCRSDepTime DistanceCum CancelledCount / dist=poisson link=log;
offset = log(SeqNum);
run;
quit;


proc genmod data = HW3.BTS201505_&UID._DEL15S;
by Carrier;
model DelayCt = MaxCRSDepTime DistanceCum CancelledCount / dist=poisson link=log; 
offset = LnSeqNUM;
run;
quit;

/********* END / Estimate POISSON model parameters for CARRIER/TAILNUM/FLIGHTDATE summary data set **************/




/******************** Easter Egg 1 *************************/

proc sql ;
* <Randomly subset monthly file here.> ;
create table HW3.BTS201505_subids as 
select carrier , tailnum , flightdate , count(*) as NN , ranuni(&UID.) as random 
from HW3.BTS201505
group by carrier , tailnum , flightdate
having random>.2 ; 


create table HW3.BTS201505_&uid. as 
select a.*
from HW3.BTS201505 a inner join HW3.BTS201505_subids b
	on a.carrier=b.carrier and  a.flightdate=b.flightdate and a.tailnum=b.tailnum ;

drop table HW3.BTS201505_subids ;

quit ;

/** Adding variable FlightNumChar **/
data HW3.BTS201505_easter;
set HW3.BTS201505_&UID.;
	FlightNumChar = put(FlightNum , $4. -l);
run ;

/** Replacing Missing Values **/
proc stdize data=HW3.BTS201505_easter out=HW3.BTS201505_easter reponly missing=0 ;
var DepDelay ArrDelay ;
run ;

/** Creating a data step HW3.BTS201505_1 by Sorting the SAS dataset by Carrier, TailNum, FlightDate, CRSDepTime, FlightNum **/

data HW3.BTS201505_1;
set HW3.BTS201505_easter ;
run ;

proc sort data = HW3.BTS201505_1;
by Carrier TailNum FlightDate CRSDepTime FlightNum;
run ;

/** Creating Lag Variables **/
data HW3.BTS201505_1 ;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ArrDelayLagInd 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4. ;
set HW3.BTS201505_1 ;
by Carrier TailNum FlightDate CRSDepTime FlightNum ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	ArrDelayLag2=0 ;
	
	CancelledLag = 0 ;
	DistanceLag = 0 ;

	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;

proc reg data=HW3.BTS201505_1 outest = HW3.easter1;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag ;
run ;
	
/** END **/

/**Creating a data step HW3.BTS201505_2 by sorting the SAS dataset by Carrier,TailNum, FlightDate,CRSDepTime,FlightNumChar**/
data HW3.BTS201505_2;
set HW3.BTS201505_easter ;
run ;

proc sort data = HW3.BTS201505_2;
by Carrier TailNum FlightDate CRSDepTime FlightNumChar;
run ;

/** Creating Lag Variables **/
data HW3.BTS201505_2 ;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4. ;
set HW3.BTS201505_2 ;
by Carrier TailNum FlightDate CRSDepTime FlightNumChar ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;
	ArrDelayLag2=0 ;
	CancelledLag = 0 ;
	DistanceLag = 0 ;
	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;



/**Compare the regression model estimates from the two different sorts**/
proc reg data=HW3.BTS201505_2 outest = HW3.easter2;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag ;
run ;

proc append base = HW3.easter1 data = HW3.easter2;
run;

/**Use appropriate SAS syntax to identify the source of any differences between the two sets of regression estimates**/
proc transpose data = HW3.easter1 out = HW3.easter_results (drop = easter1 easter2
rename = (Col1 = easter1 Col2 = easter2 )) ;
by _Model_;
run;

data HW3.easter_parameter_diff (drop=_Label_ _Model_ ) ;
set HW3.easter_results ;
format delta percent10.4;
delta= 1-(easter2/easter1);
run;

proc print data = HW3.easter_parameter_diff;
run;


/** The parameter estimates differ due to the difference in sort order of the numeric variable FlightNum and 
the non-numeric variable FlightNumChar.
To resolve the differences in the two sets of regression estimates we will change
the position of variables FlightNum and FlightNumChar in the sort order. We will change it to 
FlightNum/FlightNumChar Carrier TailNum FlightDate CRSDepTime instead of 
Carrier TailNum FlightDate CRSDepTime FlightNum/FlightNumChar **/

proc sql ;
* <Randomly subset monthly file here.> ;
create table HW3.BTS201505_subids as 
select carrier , tailnum , flightdate , count(*) as NN , ranuni(&UID.) as random 
from HW3.BTS201505
group by carrier , tailnum , flightdate
having random>.2 ; 


create table HW3.BTS201505_&uid. as 
select a.*
from HW3.BTS201505 a inner join HW3.BTS201505_subids b
	on a.carrier=b.carrier and  a.flightdate=b.flightdate and a.tailnum=b.tailnum ;

drop table HW3.BTS201505_subids ;

quit ;


data HW3.BTS201505_neweaster;
set HW3.BTS201505_&UID.;
	FlightNumChar = put(FlightNum , $4. -l);
run ;

proc stdize data=HW3.BTS201505_neweaster out=HW3.BTS201505_neweaster reponly missing=0 ;
var DepDelay ArrDelay ;
run ;

data HW3.BTS201505_new1;
set HW3.BTS201505_neweaster ;
run ;

proc sort data = HW3.BTS201505_new1;
by FlightNum Carrier TailNum FlightDate CRSDepTime;
run ;


data HW3.BTS201505_new1 ;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ArrDelayLagInd 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4. ;
set HW3.BTS201505_new1 ;
by FlightNum Carrier TailNum FlightDate CRSDepTime  ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;

	ArrDelayLag2=0 ;
	
	CancelledLag = 0 ;
	DistanceLag = 0 ;

	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;
	

/** END **/

/***** Sort your SAS dataset by Carrier, TailNum, FlightDate, CRSDepTime, FlightNumChar******/
data HW3.BTS201505_new2;
set HW3.BTS201505_neweaster ;
run ;

proc sort data = HW3.BTS201505_new2;
by FlightNumChar Carrier TailNum FlightDate CRSDepTime ;
run ;

data HW3.BTS201505_new2 ;
retain ArrDelayLag ArrDelayLagCum 0 CancelledLag 0 ArrDelayLag2 0 DistanceLag 0 ;
format flightdate yymmdd10. SeqNum ArrDelayLagInd ArrDelayLag ArrDelayLagCum 4. ;
set HW3.BTS201505_new2 ;
by FlightNumChar Carrier TailNum FlightDate CRSDepTime  ;
if first.FlightDate=1 then do ;

	ArrDelayLag=0 ;
	ArrDelayLagInd=0 ;
	ArrDelayLagCum=0 ;
	ArrDelayLag2=0 ;
	CancelledLag = 0 ;
	DistanceLag = 0 ;
	SeqNum=1 ;
end ;

else do ;
	SeqNum+1 ;
	
	ArrDelayLagInd=(ArrDelayLag>0) ;
	ArrDelayLagCum+ArrDelayLag ;

end ;

output ;

ArrDelayLag2=ArrDelayLag ;

ArrDelayLag=ArrDelay ;

CancelledLag = Cancelled ;
DistanceLag = Distance ;

run ;


proc reg data=HW3.BTS201505_new1 outest = HW3.newEaster1;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag ;
run ;

proc reg data=HW3.BTS201505_new2 outest = HW3.newEaster2;
	model DepDelay = CRSDepTime seqnum ArrDelayLagInd ArrDelayLag ArrDelayLagCum ArrDelayLag2 CancelledLag DistanceLag ;
run ;

proc append base = HW3.newEaster1 data = HW3.newEaster2;
run;

proc transpose data = HW3.newEaster1 out = HW3.NewEaster_results (drop = easter1 easter2
rename = (Col1 = easter1 Col2 = easter2 )) ;
by _Model_;
run;

data HW3.NewEaster_parameter_diff (drop=_Label_ _Model_ ) ;
set HW3.NewEaster_results ;
format delta percent10.4;
delta= 1-(easter2/easter1);
run;


proc print data = HW3.NewEaster_parameter_diff;
run;


ods pdf close ;


