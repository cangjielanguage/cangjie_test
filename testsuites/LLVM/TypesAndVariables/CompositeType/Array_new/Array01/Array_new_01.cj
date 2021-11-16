// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*

var a = Array<Int8>(Buffer<Int8>())
var a1 = Array<Int16>(Buffer<Int16>())
var a2 = Array<Int32>(Buffer<Int32>())
var a3 = Array<Int64>(Buffer<Int64>(Buffer<Int64>()))
var a4 = Array<UInt8>(Buffer<UInt8>(HashSet<UInt8>()))
var a5 = Array<UInt16>(Buffer<UInt16>([]))
var a6 = Array<UInt32>(Buffer<UInt32>())
var a7 = Array<UInt64>(Buffer<UInt64>())

var a8 = Array<Float16>(Buffer<Float16>())
var a9 = Array<Float32>(Buffer<Float32>())
var a10 = Array<Float64>(Buffer<Float64>())

var a11 = Array<Char>(Buffer<Char>())
var a12 = Array<Bool>(Buffer<Bool>())
var a13 = Array<String>(Buffer<String>(2))

func main(): Int64 {
    return  a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}