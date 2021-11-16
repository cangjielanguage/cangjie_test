// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
from std import collection.*

var a = Array<Int8>(HashSet<Int8>())
var a1 = Array<Int16>(HashSet<Int16>())
var a2 = Array<Int32>(HashSet<Int32>())
var a3 = Array<Int64>(HashSet<Int64>())
var a4 = Array<UInt8>(HashSet<UInt8>())
var a5 = Array<UInt16>(HashSet<UInt16>())
var a6 = Array<UInt32>(HashSet<UInt32>())
var a7 = Array<UInt64>(HashSet<UInt64>())

var a8 = Array<Float16>(HashSet<Float16>())
var a9 = Array<Float32>(HashSet<Float32>())
var a10 = Array<Float64>(HashSet<Float64>())

var a11 = Array<Char>(HashSet<Char>())
var a12 = Array<Bool>(HashSet<Bool>())
var a13 = Array<String>(HashSet<String>())

func main(): Int64 {
    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}