// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum MyEnum {
    A(Int32)
}

enum AnotherEnum{
    A(Int32)
}
func main(): Int64 {
    var a = MyEnum.A(1)
    var b = MyEnum.A(2)
    let myArray0 : Array<MyEnum> = @{a,b,MyEnum.A(3)}
    return 0
}
