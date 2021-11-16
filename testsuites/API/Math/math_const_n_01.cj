// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import math.*
func main() {
 //expect Min Float value
 var exp_MinFloat16:Float16=5.9604645e-8
 var exp_MinDenormalFloat16:Float16=6.0975552e-5
 var exp_MinNormalFloat16:Float16= 6.103515625e-5
 var exp_MinFloat32:Float32=1.4e-45
 var exp_MinFloat64:Float64=4.9e-324
 //expect Max Float value
 var exp_MaxFloat16:Float16=6.5504e4
 var exp_MaxFloat32:Float32=3.4028235e38
 var exp_MaxFloat64:Float64=1.7976931348623157e308
 //expect E value
 var exp_E64:Float64=2.71828182845904523536
 var exp_E16:Float16=2.71828182845904523536
 var exp_E32:Float32=2.71828182845904523536
  //expect pi value
 var exp_PI64:Float64=3.141592653589793
 var exp_PI32:Float32=3.141592653589793
 var exp_PI16:Float16=3.141592653589793
 //actual Max Int value
 var MaxInt8=math.MaxInt8
 var MaxInt16=math.MaxInt16
 var MaxInt32=math.MaxInt32
 var MaxInt64=math.MaxInt64
 //actual max UInt value
 var MaxUInt8=math.MaxUInt8
 var MaxUInt16=math.MaxUInt16
 var MaxUInt32=math.MaxUInt32
 var MaxUInt64=math.MaxUInt64
 //actual Min Int value
 var MinInt8=math.MinInt8
 var MinInt16=math.MinInt16
 var MinInt32=math.MinInt32
 var MinInt64=math.MinInt64
 //actual Min UInt value
 var MinUInt8=math.MinUInt8
 var MinUInt16=math.MinUInt16
 var MinUInt32=math.MinUInt32
 var MinUInt64=math.MinUInt64
 //expect Min int value
 var exp_MinInt8:Int8=-128
 var exp_MinInt16:Int16=-32768
 var exp_MinInt32:Int32=-2147483648
 var exp_MinInt64:Int64=-9223372036854775808
 //expect Max int value
 var exp_MaxInt8:Int8=127
 var exp_MaxInt16:Int16=32767
 var exp_MaxInt32:Int32=2147483647
 var exp_MaxInt64:Int64=9223372036854775807
 //expect min UInt value
 var exp_MinUInt8:UInt8=0
 var exp_MinUInt16:UInt16=0
 var exp_MinUInt32:UInt32=0
 var exp_MinUInt64:UInt64=0
 //expect Max UInt value
 var exp_MaxUInt8:UInt8=255
 var exp_MaxUInt16:UInt16=65535
 var exp_MaxUInt32:UInt32=4294967295
 var exp_MaxUInt64:UInt64=18446744073709551615

 CaseRunner<Float16>().runCases(
      [
            (MinFloat16,exp_MinFloat16,Float16(0.0001)),
            (MinDenormalFloat16,exp_MinDenormalFloat16,Float16(0.0001)),
            (MinNormalFloat16,exp_MinNormalFloat16,Float16(0.0001)),
            (MaxFloat16,exp_MaxFloat16,Float16(0.0001)),
            (E16,exp_E16,Float16(0.0001)),
            (PI16,exp_PI16,Float16(0.0001))
      ],
    description: "判断Float16类型常量与预期结果一致"
 )
 CaseRunner<Float32>().runCases(
    [
        (MinFloat32,exp_MinFloat32,Float32(0.0001)),
        (MaxFloat32,exp_MaxFloat32,Float32(0.0001)),
        (E32,exp_E32,Float32(0.0001)),
        (PI32,exp_PI32,Float32(0.0001))
    ],
    description: "判断Float32类型常量与预期结果一致"
 )
 CaseRunner<Float64>().runCases(
    [
        (MinFloat64,exp_MinFloat64,Float64(0.0001)),
        (MaxFloat64,exp_MaxFloat64,Float64(0.0001)),
        (E64,exp_E64,Float64(0.0001)),
        (PI64,exp_PI64,Float64(0.0001))
    ],
    description: "判断Float64类型常量与预期结果一致"
 )
 CaseRunner<Bool>().runCasesTrue(
    [
        isNaN(NaN16),
        isNaN(NaN32),
        isNaN(NaN64)
   ],
    description: "判断nan常量与预期结果一致"
 )
 CaseRunner<Bool>().runCasesTrue(
    [
        isInf(Inf16),
        isInf(Inf32),
        isInf(Inf64)
    ],
    description: "判断Inf常量与预期结果一致"
 )
 CaseRunner<Int8>().runCases(
    [
        (MinInt8,exp_MinInt8),
        (MaxInt8,exp_MaxInt8)
    ],
    description: "判断Int8相关常量与预期结果一致"
 )
 CaseRunner<Int16>().runCases(
    [
        (MinInt16,exp_MinInt16),
        (MaxInt16,exp_MaxInt16)
    ],
    description: "判断Int16相关常量与预期结果一致"
 )
 CaseRunner<Int32>().runCases(
    [
        (MinInt32,exp_MinInt32),
        (MaxInt32,exp_MaxInt32)
    ],
    description: "判断Int32相关常量与预期结果一致"
 )
 CaseRunner<Int64>().runCases(
    [
        (MinInt64,exp_MinInt64),
        (MaxInt64,exp_MaxInt64)
    ],
    description: "判断Int64相关常量与预期结果一致"
 )
 CaseRunner<UInt8>().runCases(
    [
        (MinUInt8,exp_MinUInt8),
        (MaxUInt8,exp_MaxUInt8)
    ],
    description: "判断UInt8相关常量与预期结果一致"
 )
 CaseRunner<UInt16>().runCases(
    [
        (MinUInt16,exp_MinUInt16),
        (MaxUInt16,exp_MaxUInt16)
    ],
    description: "判断UInt16相关常量与预期结果一致"
 )
 CaseRunner<UInt32>().runCases(
    [
        (MinUInt32,exp_MinUInt32),
        (MaxUInt32,exp_MaxUInt32)
    ],
    description: "判断UInt32相关常量与预期结果一致"
 )
 CaseRunner<UInt64>().runCases(
    [
        (MinUInt64,exp_MinUInt64),
        (MaxUInt64,exp_MaxUInt64)
    ],
    description: "判断UInt64相关常量与预期结果一致"
 )
 return 0
}
