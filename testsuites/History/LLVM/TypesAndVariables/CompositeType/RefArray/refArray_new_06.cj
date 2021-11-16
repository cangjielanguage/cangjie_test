// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
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

}
func main(): Int64 {
    return Test().a.size() + Test().a1.size() + Test().a2.size() + Test().a3.size() + Test().a4.size() + Test().a5.size() + Test().a6.size() + Test().a7.size() + Test().a8.size() + Test().a9.size() + Test().a10.size() + Test().a11.size() + Test().a12.size() + Test().a13.size()
}
