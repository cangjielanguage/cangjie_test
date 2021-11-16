// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    static var a = Array<Int8>([1])
    static var a1 = Array<Int16>([1])
    static var a2 = Array<Int32>([1])
    static var a3 = Array<Int64>([1])
    static var a4 = Array<UInt8>([1])
    static var a5 = Array<UInt16>([1])
    static var a6 = Array<UInt32>([1])
    static var a7 = Array<UInt64>([1])
    
    static var a8 = Array<Float16>([1.0])
    static var a9 = Array<Float32>([1.0])
    static var a10 = Array<Float64>([1.0])
    //TODO DTS2021081623664 Char String 类型构造有bug
    //static var a11 = Array<Char>(['a'])
    static var a12 = Array<Bool>([false])
    //static var a13 = Array<String>([""])

}
func main(): Int64 {
    return Test.a.size() + Test.a1.size() + Test.a2.size() + Test.a3.size() + Test.a4.size() + Test.a5.size() + Test.a6.size() + Test.a7.size() + Test.a8.size() + Test.a9.size() + Test.a10.size() /* + Test.a11.size() */ + Test.a12.size() /* + Test.a13.size() */ -12
}
