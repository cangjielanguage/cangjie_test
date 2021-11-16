// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   // para2 = +/-0.0
   if (pow(10.0, 0.0) != 1.000000) {
       return 1
   }

   if (pow(10.0, -0.0)  != 1.000000) {
       return 1
   }


   // para1 = +/-1.0
 if (pow(1.0, 2.0) != 1.000000) {
       return 1
   }

   if (pow(1.0, -2.0) != 1.000000) {
       return 1
   }

   if (pow(Float32(-1.0), Inf32) != 1.000000) {
       return 1
   }
   if (pow(Float32(-1.0), -Inf32) != 1.000000) {
       return 1
   }
   if (pow(Float64(-1.0), Inf64) != 1.000000) {
       return 1
   }
   if (pow(Float64(-1.0), -Inf64) != 1.000000) {
       return 1
   }


   // para1 = 1.0
   if (pow(999.0, 1.0) != 999.000000) {
       return 1
   }


   // para1 = NaN32/64
   if (!isNaN(pow(NaN32, Float32(-99.0)))) {
       return 1
   }

   if (!isNaN(pow(NaN64, Float64(99.0)))) {
       return 1
   }


   // para2 = NaN32/64
  if (!isNaN(pow(Float32(-99.0),NaN32))) {
       return 1
   }

   if (!isNaN(pow(Float64(99.0), NaN64))) {
       return 1
   }


   // para1 = +/-0.0
   if (pow(0.0, 99.0) != 0.000000) {
       return 1
   }

   if (!isInf(pow(0.0, -99.0))) {
       return 1
   }


   if (pow(0.0, Inf32) != 0.000000) {
       return 1
   }

   if (pow(0.0, Inf64) != 0.000000) {
       return 1
   }

   if (isInf(pow(Float32(0.0), Inf32))) {
       return 1
   }

  if (isInf(pow(0.0, Inf64))) {
       return 1
   }



   // abs(para1) > 1 and para2 = Inf
  if (!isInf(pow(Float32(1.01), Inf32))) {
       return 1
   }

   if (!isInf(pow(Float64(1.01), Inf64))) {
       return 1
   }

   // abs(para1) > 1 and para2 = -Inf
   if (pow(Float32(1.01), -Inf32) != 0.000000) {
       return 1
   }

   if (pow(Float64(1.01), -Inf64) != 0.000000) {
       return 1
   }

   // abs(para1) < 1 and para2 = Inf
   if (pow(Float32(0.99), Inf32) != 0.000000) {
       return 1
   }

   if (pow(Float64(0.99), Inf64) != 0.000000) {
       return 1
   }

   // abs(para1) < 1 and para2 = -Inf
   if (!isInf(pow(Float32(0.99), -Inf32))) {
       return 1
   }

   if (!isInf(pow(Float64(0.99), -Inf64))) {
       return 1
   }


   // para1 = +/-Inf
  if (!isInf(pow(-Inf32, Float32(0.99)))) {
       return 1
   }

   if (pow(Inf32, Float32(-0.99)) != 0.000000) {
       return 1
   }


   if (!isInf(pow(Inf32, Float32(0.99)))) {
       return 1
   }

   if (pow(Inf32,Float32(-0.99)) != 0.000000) {
       return 1
   }

   return 0

}