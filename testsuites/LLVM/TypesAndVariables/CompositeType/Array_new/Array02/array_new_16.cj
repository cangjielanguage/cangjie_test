// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    var a = Array<Int8>([-1])
    var a1 = Array<Int16>([-1])
    var a2 = Array<Int32>([-1])
    var a3 = Array<Int64>([-1])
    var a4 = Array<UInt8>([1])
    var a5 = Array<UInt16>([1])
    var a6 = Array<UInt32>([1])
    var a7 = Array<UInt64>([1])
    
    var a8 = Array<Float16>([-1.0])
    var a9 = Array<Float32>([-1.0])
    var a10 = Array<Float64>([1.0])
    var a11 = Array<Char>(['c'])
    var a12 = Array<Bool>([false])
    var a13 = Array<String>(["s"])
}

func main(): Int64 {
    return Test().a.size() + Test().a1.size() + Test().a2.size() + Test().a3.size() + Test().a4.size() + Test().a5.size() + Test().a6.size() + Test().a7.size() + Test().a8.size() + Test().a9.size() + Test().a10.size()  + Test().a11.size() + Test().a12.size() + Test().a13.size()  - 14
}
