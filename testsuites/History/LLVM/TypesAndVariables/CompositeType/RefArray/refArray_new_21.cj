// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = RefArray<Int8>(0, {i => 1})
var a1 = RefArray<Int16>(0, {i => 1})
var a2 = RefArray<Int32>(0, {i => 1})
var a3 = RefArray<Int64>(0, {i => 1})
var a4 = RefArray<UInt8>(0, {i => 1})
var a5 = RefArray<UInt16>(0, {i => 1})
var a6 = RefArray<UInt32>(0, {i => 1})
var a7 = RefArray<UInt64>(0, {i => 1})
    
var a8 = RefArray<Float16>(0, {i => 1.0})
var a9 = RefArray<Float32>(0, {i => 1.0})
var a10 = RefArray<Float64>(0, {i => 1.0})
    
var a11 = RefArray<Char>(0, {i => 'a'})
var a12 = RefArray<Bool>(0, {i => true})
var a13 = RefArray<String>(0, {i => "false"})

func main(): Int64 {
    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}
