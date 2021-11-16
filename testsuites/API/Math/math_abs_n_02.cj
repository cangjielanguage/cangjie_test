// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//测试入参是float16
func main() {
 //重载abs(Float16)：Float16
 var m1:Float16=-956.000000
 var m2:Float16=956.000000

 var m3:Float32=-956.000000
 var m4:Float32=956.000000


 var m5:Float64=-956.000000
 var m6:Float64=956.000000


 CaseRunner<Float16>().runCases(
    [
        (abs(m1),m2,0.0001), //x:Float16=（-956）(正常负数)
        (abs(Float16(-0)), Float16(0.000000),Float16(0.0001)), //x: Float16=-0 :特殊值
        (abs(Float16(0)), Float16(0.000000),Float16(0.0001)), //x: Float16=0 :特殊值
        (abs(Float16(745)), Float16(745.000000),Float16(0.0001)) //x:Float16=（745）（正常正数）
    ],
    description: "abs()入参是Float16"
 )
 print("m1=${m1}\n")
 print("abs(m1)=${abs(m1)}\n")
 CaseRunner<Float32>().runCases(
    [
        (abs(m3),m4,Float32(0.0001)), //x:Float32=（-956）(正常负数)
        (abs(Float32(-0)), Float32(0.000000),Float32(0.0001)), //x: Float32=-0 :特殊值
        (abs(Float32(0)), Float32(0.000000),Float32(0.0001)), //x: Float32=0 :特殊值
        (abs(Float32(745)), Float32(745.000000),Float32(0.0001)) //x:Float32=（745）（正常正数）
    ],
    description: "abs()入参是Float32"
 )
 print("m3=${m3}\n")
 print("abs(m3)=${abs(m3)}\n")

 CaseRunner<Float64>().runCases(
    [
        (abs(m5),m6,Float64(0.0001)), //x:Float64=（-956）(正常负数)
        (abs(Float64(-0)), Float64(0.000000),Float64(0.0001)), //x: Float64=-0 :特殊值
        (abs(Float64(0)), Float64(0.000000),Float64(0.0001)), //x: Float64=0 :特殊值
        (abs(Float64(745)), Float64(745.000000),Float64(0.0001)) //x:Float64=（745）（正常正数）
    ],
    description: "abs()入参是Float64"
 )

 print("m5=${m5}\n")
 print("abs(m5)=${abs(m5)}\n")


  return 0
}
