// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a = RefArray<Int8>(1, {i => 1})
let a1 = RefArray<Int16>(1, {i => 1})
let a2 = RefArray<Int32>(1, {i => 1})
let a3 = RefArray<Int64>(1, {i => 1})
let a4 = RefArray<UInt8>(1, {i => 1})
let a5 = RefArray<UInt16>(1, {i => 1})
let a6 = RefArray<UInt32>(1, {i => 1})
let a7 = RefArray<UInt64>(1, {i => 1})
    
let a8 = RefArray<Float16>(1, {i => 1.0})
let a9 = RefArray<Float32>(1, {i => 1.0})
let a10 = RefArray<Float64>(1, {i => 1.0})
    
let a11 = RefArray<Char>(1, {i => 'a'})
let a12 = RefArray<Bool>(1, {i => true})
let a13 = RefArray<String>(1, {i => "false"})

func main(): Int64 {
    if (a.size() == 1 && a[0] == 1 && a1.size() == 1 && a1[0] == 1 && a2.size() == 1 && a2[0] == 1 && a3.size() == 1 && a3[0] == 1 && a4.size() == 1 && a4[0] == 1 && a5.size() == 1 && a5[0] == 1 && a6.size() == 1 && a6[0] == 1&& a7.size() == 1 && a7[0] == 1&& a8.size() == 1 && a8[0] == 1.0&& a9.size() == 1 && a9[0] == 1.0&& a10.size() == 1 && a10[0] == 1.0&& a11.size() == 1 && a11[0] == 'a'&& a12.size() == 1 && a12[0] == true&& a13.size() == 1 && a13[0] == "false"){
      return 0;
    }
    return 2
}
