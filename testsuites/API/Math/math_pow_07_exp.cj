// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
func main() {
      CaseRunner<Bool>().runCasesTrue(
      [
        isNaN(pow(Float64(-2.2),Float64(2.2))),
        isNaN(pow(Float64(-2.2),Float64(-2.2))),
        isNaN(pow(Float64(-2),Float64(2.2))),
        isNaN(pow(Float64(-2),Float64(-2.2))),
        isNaN(pow(Float32(-2.2),Float32(2.2))),
        isNaN(pow(Float32(-2.2),Float32(-2.2))), 
        isNaN(pow(Float32(-2),Float32(2.2))),
        isNaN(pow(Float32(-2),Float32(-2.2))),
        isNaN(pow(Float16(-2.2),Float16(2.2))),
        isNaN(pow(Float16(-2.2),Float16(-2.2))), 
        isNaN(pow(Float16(-2),Float16(2.2))),
        isNaN(pow(Float16(-2),Float16(-2.2)))
      ],
    description: "计算结果是无效数字"
    )   
    return 0
}
