// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = Array<Int8>([1])
    var a1 = Array<Int16>([1])
    var a2 = Array<Int32>([1])
    var a3 = Array<Int64>([1])
    var a4 = Array<UInt8>([1])
    var a5 = Array<UInt16>([1])
    var a6 = Array<UInt32>([1])
    var a7 = Array<UInt64>([1])

    var a8 = Array<Float16>([1.0])
    var a9 = Array<Float32>([1.0])
    var a10 = Array<Float64>([1.0])
    var a11 = Array<Char>(['a'])
    var a12 = Array<Bool>([true])
    var a13 = Array<String>([""])

    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size() - 14
}
