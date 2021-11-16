// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试tanh(x:Float16)：Float16
//函数功能：tanh函数
//测试入参x是NaN
func main() {
    CaseRunner<Float16>().runCases(
        [
          (tanh(inf16),Float16(1.0),Float16(0.0001)),
          (tanh(-inf16),Float16(-1),Float16(0.0001))
        ],
      description: "test case 01"
    )
    CaseRunner<Float32>().runCases(
            [
              (tanh(inf32),Float32(1.0),Float32(0.0001)),
              (tanh(-inf32),Float32(-1),Float32(0.0001))
            ],
          description: "test case 02"
    )
    CaseRunner<Float64>().runCases(
             [
               (tanh(inf64),Float64(1.0),Float64(0.0001)),
               (tanh(-inf64),Float64(-1),Float64(0.0001))
             ],
           description: "test case 03"
     )
  return 0
}