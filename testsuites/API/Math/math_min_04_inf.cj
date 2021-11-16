// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*

//min（）函数针对Float的测试Inf
func main() {
    CaseRunner<Float16>().runCases(
        [
            (min(inf16,Float16(5)),Float16(5),Float16(0.0001)),
            (min(Float16(5),inf16),Float16(5),Float16(0.0001)),
            (min(-inf16,Float16(5)),-inf16,Float16(0.0001)),
            (min(Float16(5),-inf16),-inf16,Float16(0.0001)),
            (min(inf16,inf16),inf16,Float16(0.0001)),
            (min(-inf16,inf16),-inf16,Float16(0.0001))
        ],
      description: "test case 01"
    )
    CaseRunner<Float32>().runCases(
        [
            (min(inf32,Float32(5)),Float32(5),Float32(0.0001)),
            (min(Float32(5),inf32),Float32(5),Float32(0.0001)),
            (min(-inf32,Float32(5)),-inf32,Float32(0.0001)),
            (min(Float32(5),-inf32),-inf32,Float32(0.0001)),
            (min(inf32,inf32),inf32,Float32(0.0001)),
            (min(-inf32,inf32),-inf32,Float32(0.0001))
        ],
      description: "test case 02"
    )
    CaseRunner<Float64>().runCases(
        [
            (min(inf64,Float64(5)),Float64(5),Float64(0.0001)),
            (min(Float64(5),inf64),Float64(5),Float64(0.0001)),
            (min(-inf64,Float64(5)),-inf64,Float64(0.0001)),
            (min(Float64(5),-inf64),-inf64,Float64(0.0001)),
            (min(inf64,inf64),inf64,Float64(0.0001)),
            (min(-inf64,inf64),-inf64,Float64(0.0001))
        ],
      description: "test case 03"
    )
    return 0
}
