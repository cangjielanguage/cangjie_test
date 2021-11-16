// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan inconsistent element type for array literal

enum MyEnum {
    A(Int32)
}

enum AnotherEnum{
    B(Int32)
}
func main(): Int64 {
    var a = MyEnum.A(1)
    var b = AnotherEnum.B(2)
    let myArray0 = @{@{a,b,MyEnum.A(3)}}  // EXPECTED: regex inconsistent element type for array literal
    return 0
}
