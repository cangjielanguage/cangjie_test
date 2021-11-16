// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
enum MyEnum {
    A(Int32)
}

enum AnotherEnum{
    B(Int32)
}
func main(): Int64 {
    var a = MyEnum.A(1)
    var b = MyEnum.A(2)
    let myArray0 : Array<Array<MyEnum>> = @{@{a,b,MyEnum.A(3)}[
    return 0
}

