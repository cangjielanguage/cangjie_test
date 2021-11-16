// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test{
    static let a = RefArray<Int8>(1, {i => 1})
    static let a1 = RefArray<Int16>(1, {i => 1})
    static let a2 = RefArray<Int32>(1, {i => 1})
    static let a3 = RefArray<Int64>(1, {i => 1})
    static let a4 = RefArray<UInt8>(1, {i => 1})
    static let a5 = RefArray<UInt16>(1, {i => 1})
    static let a6 = RefArray<UInt32>(1, {i => 1})
    static let a7 = RefArray<UInt64>(1, {i => 1})

    static let a8 = RefArray<Float16>(1, {i => 1.0})
    static let a9 = RefArray<Float32>(1, {i => 1.0})
    static let a10 = RefArray<Float64>(1, {i => 1.0})

    static let a11 = RefArray<Char>(1, {i => 'a'})
    static let a12 = RefArray<Bool>(1, {i => true})
    static let a13 = RefArray<String>(1, {i => "false"})
}
func main(): Int64 {
    if (Test.a.size() == 1 && Test.a[0] == 1 && Test.a1.size() == 1 && Test.a1[0] == 1 && Test.a2.size() == 1 && Test.a2[0] == 1 && Test.a3.size() == 1 && Test.a3[0] == 1 && Test.a4.size() == 1 && Test.a4[0] == 1 && Test.a5.size() == 1 && Test.a5[0] == 1 && Test.a6.size() == 1 && Test.a6[0] == 1&& Test.a7.size() == 1 && Test.a7[0] == 1&& Test.a8.size() == 1 && Test.a8[0] == 1.0&& Test.a9.size() == 1 && Test.a9[0] == 1.0&& Test.a10.size() == 1 && Test.a10[0] == 1.0&& Test.a11.size() == 1 && Test.a11[0] == 'a'&& Test.a12.size() == 1 && Test.a12[0] == true&& Test.a13.size() == 1 && Test.a13[0] == "false"){
      return 0;
    }
    return 2
}
