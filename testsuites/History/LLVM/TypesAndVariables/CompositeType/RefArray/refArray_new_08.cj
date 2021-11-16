// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    static var a = RefArray<Int8>()
    static var a1 = RefArray<Int16>()
    static var a2 = RefArray<Int32>()
    static var a3 = RefArray<Int64>()
    static var a4 = RefArray<UInt8>()
    static var a5 = RefArray<UInt16>()
    static var a6 = RefArray<UInt32>()
    static var a7 = RefArray<UInt64>()
    
    static var a8 = RefArray<Float16>()
    static var a9 = RefArray<Float32>()
    static var a10 = RefArray<Float64>()
    
    static var a11 = RefArray<Char>()
    static var a12 = RefArray<Bool>()
    static var a13 = RefArray<String>()

}
func main(): Int64 {
    return Test.a.size() + Test.a1.size() + Test.a2.size() + Test.a3.size() + Test.a4.size() + Test.a5.size() + Test.a6.size() + Test.a7.size() + Test.a8.size() + Test.a9.size() + Test.a10.size() + Test.a11.size() + Test.a12.size() + Test.a13.size()
}
