// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import math.*
//函数：isNormal (x)
//函数功能：判断x是否正常（既不是零，无穷也不是NAN）。如果数字正常，则此函数返回1，否则返回零。
//输入0，无穷大，Nan返回flase
func main() {
  //isNormal (x:Float16)
  //isNormal (x:Float16)
  var x161:Float16=Float16(-0)
  var x162:Float16=Float16(0)
  var x321:Float32=Float32(-0)
  var x322:Float32=Float32(0)
  var x641:Float64=Float64(-0)
  var x642:Float64=Float64(0)
  CaseRunner<Bool>().runCasesTrue(
      [
             //x为Float16:NaN，返回Float16:NaN
            isNormal(x161),
            isNormal(x162),
            isNormal(x321),
            isNormal(x322),
            isNormal(x641),
            isNormal(x642)
      ],
    description: "test case 1",
    checktype  : "AssertFalse"
  )
  return 0
}