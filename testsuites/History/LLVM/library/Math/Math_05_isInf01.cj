// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
import math.*

func main(): Int64{

   if ("${isInf(1234.5 * 163.1)}" != "false" ) {
       return 1
   }

   if (isInf(3.5E38)) {
       return 1
   }


   // verify isInf16
   if ("${isInf(Inf16 + Inf16)}" != "true" ) {
       return 1
   }

   if ("${isInf(Inf16 * Inf16)}" != "true" ) {
       return 1
   }

   if ("${isInf(-Inf16 - Inf16)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf16/1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(-Inf16/-1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf16/-1.0)}" != "true" )  {
       return 1
   }

   if (!isInf(Inf16/0.0)) {
       return 1
   }

   if (!isInf(-Inf16/0.0)) {
       return 1
   }


   // verify isInf32
   if ("${isInf(Inf32 + Inf32)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf32 * Inf32)}" != "true" )  {
       return 1
   }

   if ("${isInf(-Inf32 - Inf32)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf32/1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(-Inf32/-1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf32/-1.0)}" != "true" )  {
       return 1
   }

   if (!isInf(Inf32/0.0)) {
       return 1
   }

   if (!isInf(-Inf32/0.0)) {
       return 1
   }


// verify isInf64
   if ("${isInf(Inf64 + Inf64)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf64 * Inf64)}" != "true" )  {
       return 1
   }

   if ("${isInf(-Inf64 - Inf64)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf64/1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(-Inf64/-1.0)}" != "true" )  {
       return 1
   }

   if ("${isInf(Inf64/-1.0)}" != "true" )  {
       return 1
   }

   if (!isInf(Inf64/0.0)) {
       return 1
   }

   if (!isInf(-Inf64/0.0)) {
       return 1
   }

   return 0

}