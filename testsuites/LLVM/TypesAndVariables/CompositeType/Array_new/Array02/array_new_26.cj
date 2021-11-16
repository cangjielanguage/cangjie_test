// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    var a = Array<Int8>(1, {i => 1})
    var a1 = Array<Int16>(1, {i => 1})
    var a2 = Array<Int32>(1, {i => 1})
    var a3 = Array<Int64>(1, {i => 1})
    var a4 = Array<UInt8>(1, {i => 1})
    var a5 = Array<UInt16>(1, {i => 1})
    var a6 = Array<UInt32>(1, {i => 1})
    var a7 = Array<UInt64>(1, {i => 1})

    var a8 = Array<Float16>(1, {i => 1.0})
    var a9 = Array<Float32>(1, {i => 1.0})
    var a10 = Array<Float64>(1, {i => 1.0})

    var a11 = Array<Char>(1, {i => 'a'})
    var a12 = Array<Bool>(1, {i => true})
    var a13 = Array<String>(1, {i => "false"})

}
func main(): Int64 {
    if (Test().a.size() == 1 && Test().a[0] == 1 && Test().a1.size() == 1 && Test().a1[0] == 1 && Test().a2.size() == 1 && Test().a2[0] == 1 && Test().a3.size() == 1 && Test().a3[0] == 1 && Test().a4.size() == 1 && Test().a4[0] == 1 && Test().a5.size() == 1 && Test().a5[0] == 1 && Test().a6.size() == 1 && Test().a6[0] == 1&& Test().a7.size() == 1 && Test().a7[0] == 1&& Test().a8.size() == 1 && Test().a8[0] == 1.0&& Test().a9.size() == 1 && Test().a9[0] == 1.0&& Test().a10.size() == 1 && Test().a10[0] == 1.0&& Test().a11.size() == 1 && Test().a11[0] == 'a'&& Test().a12.size() == 1 && Test().a12[0] == true&& Test().a13.size() == 1 && Test().a13[0] == "false"){
      return 0;
    }
    return 2
}
