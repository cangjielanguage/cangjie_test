// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = RefArray<Int8>([1])
    let a1 = RefArray<Int16>([1])
    let a2 = RefArray<Int32>([1])
    let a3 = RefArray<Int64>([1])
    let a4 = RefArray<UInt8>([1])
    let a5 = RefArray<UInt16>([1])
    let a6 = RefArray<UInt32>([1])
    let a7 = RefArray<UInt64>([1])

    let a8 = RefArray<Float16>([1.0])
    let a9 = RefArray<Float32>([1.0])
    let a10 = RefArray<Float64>([1.0])

    let a11 = RefArray<Char>(['a'])
    let a12 = RefArray<Bool>([true])
    let a13 = RefArray<String>([""])

    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size() - 14
}
