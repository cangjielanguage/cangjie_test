// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 自增减支持数值类型
func main(): Int64 {
    var a1 = 0b0001_1000
    a1++
    if (a1 != 0b0001_1001) {return 1}
    a1--
    if (a1 != 0b0001_1000) {return 1}
    var a2 = 0o30
    a2++
    if (a2 != 0o31) {return 1}
    var a3 = 24
    a3++
    if (a3 != 25) {return 1}
    var a4 = 0x18
    a4++
    if (a4 != 0x19) {return 1}
    var a7 = @{1,2,3}
    a7[0]++
    var a8 = @{1,2,3}
    a8[0]++




    var f1 = 3.14
    f1++
    var f2 = 2.4e-1
    f2++
    var f3 = 2e3
    f3++
    var f4 = 8
    f4++
    var f5 = 123e2
    f5++
    var f6 = 0x1.1p0
    f6++
    var f7 = 0x1p2
    f7++
    var f8 = 0x.2p4
    f8++
//    var bigIntNum1: bigInt = 100000000000000000000
//    bigIntNum1++
//    var bigFloatNum1: bigFloat = 1.1E500
//    bigFloatNum1++


    return 0;
}
