// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = Array<Int8>(0, {i => 1})
var a1 = Array<Int16>(0, {i => 1})
var a2 = Array<Int32>(0, {i => 1})
var a3 = Array<Int64>(0, {i => 1})
var a4 = Array<UInt8>(0, {i => 1})
var a5 = Array<UInt16>(0, {i => 1})
var a6 = Array<UInt32>(0, {i => 1})
var a7 = Array<UInt64>(0, {i => 1})
    
var a8 = Array<Float16>(0, {i => 1.0})
var a9 = Array<Float32>(0, {i => 1.0})
var a10 = Array<Float64>(0, {i => 1.0})
    
var a11 = Array<Char>(0, {i => 'a'})
var a12 = Array<Bool>(0, {i => true})
var a13 = Array<String>(0, {i => "false"})

func main(): Int64 {
    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}
