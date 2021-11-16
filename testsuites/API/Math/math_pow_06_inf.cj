// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试func pow(base: float16, exponent: float16) : float16
//入参异常：负无穷的正小数次幂，抛异常
func main() {
       CaseRunner<Bool>().runCasesTrue(
           [
               isInf(pow(-inf16,Float16(2.2))),
               isInf(pow(-inf32,Float32(2.2))),
               isInf(pow(-inf64,Float64(2.2))),
               isInf(pow(inf16,Float16(2.2))),
               isInf(pow(inf32,Float32(2.2))),
               isInf(pow(inf64,Float64(2.2))),
               isInf(pow(-inf16,inf16)),
               isInf(pow(-inf32,inf32)),
               isInf(pow(-inf64,inf64)),

               isInf(pow(inf16,inf16)),
               isInf(pow(inf32,inf32)),
               isInf(pow(inf64,inf64)),

               isInf(pow(Float16(2.2),inf16)),
               isInf(pow(Float32(2.2),inf32)),
               isInf(pow(Float64(2.2),inf64))
           ],
         description: "test case 01"
       )
  return 0
}
