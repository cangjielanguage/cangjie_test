// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex inconsistent element type for array literal
record MyRecord {
    let a : Int32
}

record AnotherRecord{
    let a : Int32
}
func main(): Int64 {
    var a = MyRecord(1)
    var b = AnotherRecord(2)
    let myArray0 : Array<MyRecord> = @{a,b,MyRecord(3)}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
