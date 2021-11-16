// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    var a = Array<Int8>()
    var a1 = Array<Int16>()
    var a2 = Array<Int32>()
    var a3 = Array<Int64>()
    var a4 = Array<UInt8>()
    var a5 = Array<UInt16>()
    var a6 = Array<UInt32>()
    var a7 = Array<UInt64>()
    
    var a8 = Array<Float16>()
    var a9 = Array<Float32>()
    var a10 = Array<Float64>()
    
    var a11 = Array<Char>()
    var a12 = Array<Bool>()
    var a13 = Array<String>()

}
func main(): Int64 {
    return Test().a.size() + Test().a1.size() + Test().a2.size() + Test().a3.size() + Test().a4.size() + Test().a5.size() + Test().a6.size() + Test().a7.size() + Test().a8.size() + Test().a9.size() + Test().a10.size() + Test().a11.size() + Test().a12.size() + Test().a13.size()
}
