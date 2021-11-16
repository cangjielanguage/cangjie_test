// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数：clamp (x,min,max)
//函数功能：该函数的功能是如果x在min与max之间则返回x，如果x小于min则返回min，若x大于max，则返回max。如果是max<min则需要返回NaN
func main() {
    CaseRunner<Float16>().runCases(
        [
            (clamp(Float16(5.83),Float16(3.98),Float16(9.45)),Float16(5.83),Float16(0.0001)),//min<x<max
            (clamp(Float16(-5.83),Float16(-10.98),Float16(-3.45)),Float16(-5.83),Float16(0.0001)),//min<x<max
            (clamp(Float16(5.83),Float16(8.98),Float16(9.45)),Float16(8.98),Float16(0.0001)),//x<min
            (clamp(Float16(-5.83),Float16(8.98),Float16(9.45)),Float16(8.98),Float16(0.0001)),//x<min
            (clamp(Float16(45.83),Float16(8.98),Float16(9.45)),Float16(9.45),Float16(0.0001)),//x>max
            (clamp(Float16(-45.83),Float16(-128.98),Float16(-99.45)),Float16(-99.45),Float16(0.0001))//x>max
        ],
        description: "clamp（）函数入参是Float16，且min<max"
    )
    CaseRunner<Float32>().runCases(
        [
            (clamp(Float32(5.83),Float32(3.98),Float32(9.45)),Float32(5.83),Float32(0.0001)), //min<x<max
            (clamp(Float32(-5.83),Float32(-10.98),Float32(-3.45)),Float32(-5.83),Float32(0.0001)), //min<x<max
            (clamp(Float32(5.83),Float32(8.98),Float32(9.45)),Float32(8.98),Float32(0.0001)),//x<min
            (clamp(Float32(-5.83),Float32(8.98),Float32(9.45)),Float32(8.98),Float32(0.0001)),//x<min
            (clamp(Float32(45.83),Float32(8.98),Float32(9.45)),Float32(9.45),Float32(0.0001)),//x>max
            (clamp(Float32(-45.83),Float32(-128.98),Float32(-99.45)),Float32(-99.45),Float32(0.0001))
        ],
    description: "clamp（）函数入参是Float32，且min<max"
    )
    CaseRunner<Float64>().runCases(
        [
            (clamp(Float64(5.83),Float64(3.98),Float64(9.45)),Float64(5.83),Float64(0.0001)),//min<x<max
            (clamp(Float64(-5.83),Float64(-10.98),Float64(-3.45)),Float64(-5.83),Float64(0.0001)),//min<x<max
            (clamp(Float64(5.83),Float64(8.98),Float64(9.45)),Float64(8.98),Float64(0.0001)),//x<min
            (clamp(Float64(-5.83),Float64(8.98),Float64(9.45)),Float64(8.98),Float64(0.0001)),//x<min
            (clamp(Float64(45.83),Float64(8.98),Float64(9.45)),Float64(9.45),Float64(0.0001)),//x>max
            (clamp(Float64(-45.83),Float64(-128.98),Float64(-99.45)),Float64(-99.45),Float64(0.0001))//x>max
        ],
    description: "clamp（）函数入参是Float64，且min<max"
  )
  return 0
}