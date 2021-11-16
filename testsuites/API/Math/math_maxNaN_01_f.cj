// DEPENDENCE: caserunner.cj

// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
//测试maxNaN(x)入参是Inf:Inf浮点型数才有
func main() {
  //入参类型是Float16
  var x_F161=Float16(1.0)
  var y_F161=Float16(8.0)
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(nan16,nan16))
      ],
    description: "test case 01"
  )
  CaseRunner<Bool>().runCasesTrue(
        [
            isNaN(maxNaN(x_F161,nan16))
        ],
      description: "test case 02"
  )
  CaseRunner<Bool>().runCasesTrue(
        [
            isNaN(maxNaN(nan16,y_F161))
        ],
      description: "test case 03"
  )
  //X,Y均不是NaN，则返回较小值
  CaseRunner<Float16>().runCases(
        [
            (maxNaN(x_F161,y_F161),y_F161)
        ],
      description: "test case 04"
  )
  //入参类型是Float32
  var x_F321=Float32(1.0)
  var y_F321=Float32(8.0)
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(nan32,nan32))
      ],
    description: "test case 05"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(x_F321,nan32))
      ],
    description: "test case 06"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(nan32,y_F321))
      ],
    description: "test case 07"
  )
  CaseRunner<Float32>().runCases(
      [
          (maxNaN(x_F321,y_F321),y_F321)
      ],
    description: "test case 08"
  )

  //入参类型是Float64
  var x_F641=Float64(1.0)
  var y_F641=Float64(8.0)
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(nan64,nan64))
      ],
    description: "test case 09"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(x_F641,nan64))
      ],
    description: "test case 10"
  )
  CaseRunner<Bool>().runCasesTrue(
      [
          isNaN(maxNaN(nan64,y_F641))
      ],
    description: "test case 11"
  )
  CaseRunner<Float64>().runCases(
      [
          (maxNaN(x_F641,y_F641),y_F641)
      ],
    description: "test case 12"
  )
  return 0
}