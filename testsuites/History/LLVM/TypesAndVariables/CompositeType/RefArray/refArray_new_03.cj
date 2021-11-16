// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = RefArray<Int8>()
    var a1 = RefArray<Int16>()
    var a2 = RefArray<Int32>()
    var a3 = RefArray<Int64>()
    var a4 = RefArray<UInt8>()
    var a5 = RefArray<UInt16>()
    var a6 = RefArray<UInt32>()
    var a7 = RefArray<UInt64>()
    
    var a8 = RefArray<Float16>()
    var a9 = RefArray<Float32>()
    var a10 = RefArray<Float64>()
    
    var a11 = RefArray<Char>()
    var a12 = RefArray<Bool>()
    var a13 = RefArray<String>()

    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}
