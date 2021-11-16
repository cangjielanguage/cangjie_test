// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    static let a = RefArray<Int8>()
    static let a1 = RefArray<Int16>()
    static let a2 = RefArray<Int32>()
    static let a3 = RefArray<Int64>()
    static let a4 = RefArray<UInt8>()
    static let a5 = RefArray<UInt16>()
    static let a6 = RefArray<UInt32>()
    static let a7 = RefArray<UInt64>()
    static let a8 = RefArray<Float16>()
    static let a9 = RefArray<Float32>()
    static let a10 = RefArray<Float64>()
    static let a11 = RefArray<Char>()
    static let a12 = RefArray<Bool>()
    static let a13 = RefArray<String>()

}
func main(): Int64 {
    return Test.a.size() + Test.a1.size() + Test.a2.size() + Test.a3.size() + Test.a4.size() + Test.a5.size() + Test.a6.size() + Test.a7.size() + Test.a8.size() + Test.a9.size() + Test.a10.size() + Test.a11.size() + Test.a12.size() + Test.a13.size()
}
