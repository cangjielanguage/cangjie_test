// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数：isNormal (x)
//函数功能：判断x是否正常（既不是零，无穷也不是NAN）。如果数字正常，则此函数返回1，否则返回零。
func main() {
  //isNormal (x)
  var m1:Float16=3.876575
  var m2:Float32=3.876575
  var m3:Float64=3.876575
  CaseRunner<Bool>().runCases(
     [

           (isNormal(m1),true),
           (isNormal(Float16(0)),false)
     ],
    description: "test case 1" /**用例描述**/
  )
  //isNormal (x：Float32)
  CaseRunner<Bool>().runCases(
     [
           (isNormal(m2),true),
           (isNormal(Float32(0)),false)
     ],
    description: "test case 2" /**用例描述**/
  )
  //isNormal (x：Float64)
  CaseRunner<Bool>().runCases(
     [
      (isNormal(m3),true),
      (isNormal(Float64(0)),false)
     ],
    description: "test case 3" /**用例描述**/
  )
  print("${isNormal(m1)}\n")
  print("${isNormal(m2)}\n")
  print("${isNormal(m3)}\n")
  return 0
}
