// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
enum MyEnum {
    A(Int32)
}

enum AnotherEnum{
    A(Int32)
}
func main(): Int64 {
    var a = MyEnum.A(1)
    var b = AnotherEnum.A(2)
    let myArray0 : Array<MyEnum> = @{a,b,AnotherEnum.A(3)} // EXPECTED: regex inconsistent element type for array literal
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
