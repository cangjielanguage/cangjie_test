// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkg01/pkg01.cj -o pkg01.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg02/pkg02.cj -o pkg02.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg03/pkg03.cj -o pkg03.%middle  
// EXEC: %compiler %cmp_opt -c src/pkg04/pkg04.cj -o pkg04.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg05/pkg05.cj -o pkg05.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg06/pkg06.cj -o pkg06.%middle  
// EXEC: %compiler %cmp_opt -c src/pkg07/pkg07.cj -o pkg07.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg08/pkg08.cj -o pkg08.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg09/pkg09.cj -o pkg09.%middle  
// EXEC: %compiler %cmp_opt -c src/pkg10/pkg10.cj -o pkg10.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg11/pkg11.cj -o pkg11.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg12/pkg12.cj -o pkg12.%middle  
// EXEC: %compiler %cmp_opt -c src/pkg13/pkg13.cj -o pkg13.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg14/pkg14.cj -o pkg14.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg15/pkg15.cj -o pkg15.%middle
// EXEC: %compiler %cmp_opt -c src/pkg16/pkg16.cj -o pkg16.%middle    
// EXEC: %compiler %cmp_opt -c	src/pkg17/pkg17.cj -o pkg17.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg18/pkg18.cj -o pkg18.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg19/pkg19.cj -o pkg19.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg20/pkg20.cj -o pkg20.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg21/pkg21.cj -o pkg21.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg22/pkg22.cj -o pkg22.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg23/pkg23.cj -o pkg23.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg24/pkg24.cj -o pkg24.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg25/pkg25.cj -o pkg25.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg26/pkg26.cj -o pkg26.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg27/pkg27.cj -o pkg27.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg28/pkg28.cj -o pkg28.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg29/pkg29.cj -o pkg29.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg30/pkg30.cj -o pkg30.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg31/pkg31.cj -o pkg31.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg32/pkg32.cj -o pkg32.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg33/pkg33.cj -o pkg33.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg34/pkg34.cj -o pkg34.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg35/pkg35.cj -o pkg35.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg36/pkg36.cj -o pkg36.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg37/pkg37.cj -o pkg37.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg38/pkg38.cj -o pkg38.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg39/pkg39.cj -o pkg39.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg40/pkg40.cj -o pkg40.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg41/pkg41.cj -o pkg41.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg42/pkg42.cj -o pkg42.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg43/pkg43.cj -o pkg43.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg44/pkg44.cj -o pkg44.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg45/pkg45.cj -o pkg45.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg46/pkg46.cj -o pkg46.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg47/pkg47.cj -o pkg47.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg48/pkg48.cj -o pkg48.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg49/pkg49.cj -o pkg49.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg50/pkg50.cj -o pkg50.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg51/pkg51.cj -o pkg51.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg52/pkg52.cj -o pkg52.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg53/pkg53.cj -o pkg53.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg54/pkg54.cj -o pkg54.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg55/pkg55.cj -o pkg55.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg56/pkg56.cj -o pkg56.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg57/pkg57.cj -o pkg57.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg58/pkg58.cj -o pkg58.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg59/pkg59.cj -o pkg59.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg60/pkg60.cj -o pkg60.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg61/pkg61.cj -o pkg61.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg62/pkg62.cj -o pkg62.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg63/pkg63.cj -o pkg63.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg64/pkg64.cj -o pkg64.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg65/pkg65.cj -o pkg65.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg66/pkg66.cj -o pkg66.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg67/pkg67.cj -o pkg67.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg68/pkg68.cj -o pkg68.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg69/pkg69.cj -o pkg69.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg70/pkg70.cj -o pkg70.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg71/pkg71.cj -o pkg71.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg72/pkg72.cj -o pkg72.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg73/pkg73.cj -o pkg73.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg74/pkg74.cj -o pkg74.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg75/pkg75.cj -o pkg75.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg76/pkg76.cj -o pkg76.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg77/pkg77.cj -o pkg77.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg78/pkg78.cj -o pkg78.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg79/pkg79.cj -o pkg79.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg80/pkg80.cj -o pkg80.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg81/pkg81.cj -o pkg81.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg82/pkg82.cj -o pkg82.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg83/pkg83.cj -o pkg83.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg84/pkg84.cj -o pkg84.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg85/pkg85.cj -o pkg85.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg86/pkg86.cj -o pkg86.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg87/pkg87.cj -o pkg87.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg88/pkg88.cj -o pkg88.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg89/pkg89.cj -o pkg89.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg90/pkg90.cj -o pkg90.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg91/pkg91.cj -o pkg91.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg92/pkg92.cj -o pkg92.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg93/pkg93.cj -o pkg93.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg94/pkg94.cj -o pkg94.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg95/pkg95.cj -o pkg95.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg96/pkg96.cj -o pkg96.%middle 
// EXEC: %compiler %cmp_opt -c	src/pkg97/pkg97.cj -o pkg97.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg98/pkg98.cj -o pkg98.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg99/pkg99.cj -o pkg99.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg100/pkg100.cj -o pkg100.%middle  
// EXEC: %compiler %cmp_opt pkg01.%middle pkg02.%middle pkg03.%middle pkg04.%middle pkg05.%middle pkg06.%middle pkg07.%middle pkg08.%middle pkg09.%middle pkg10.%middle pkg11.%middle pkg12.%middle pkg13.%middle pkg14.%middle pkg15.%middle pkg16.%middle pkg17.%middle pkg18.%middle pkg19.%middle pkg20.%middle pkg21.%middle pkg22.%middle pkg23.%middle pkg24.%middle pkg25.%middle pkg26.%middle pkg27.%middle pkg28.%middle pkg29.%middle pkg30.%middle pkg31.%middle pkg32.%middle pkg33.%middle pkg34.%middle pkg35.%middle pkg36.%middle pkg37.%middle pkg38.%middle pkg39.%middle pkg40.%middle pkg41.%middle pkg42.%middle pkg43.%middle pkg44.%middle pkg45.%middle pkg46.%middle pkg47.%middle pkg48.%middle pkg49.%middle pkg50.%middle pkg51.%middle pkg52.%middle pkg53.%middle pkg54.%middle pkg55.%middle pkg56.%middle pkg57.%middle pkg58.%middle pkg59.%middle pkg60.%middle pkg61.%middle pkg62.%middle pkg63.%middle pkg64.%middle pkg65.%middle pkg66.%middle pkg67.%middle pkg68.%middle pkg69.%middle pkg70.%middle pkg71.%middle pkg72.%middle pkg73.%middle pkg74.%middle pkg75.%middle pkg76.%middle pkg77.%middle pkg78.%middle pkg79.%middle pkg80.%middle pkg81.%middle pkg82.%middle pkg83.%middle pkg84.%middle pkg85.%middle pkg86.%middle pkg87.%middle pkg88.%middle pkg89.%middle pkg90.%middle pkg91.%middle pkg92.%middle pkg93.%middle pkg94.%middle pkg95.%middle pkg96.%middle pkg97.%middle pkg98.%middle pkg99.%middle pkg100.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args


import pkg100.*


func main(): Int64 {

    return 0
}
