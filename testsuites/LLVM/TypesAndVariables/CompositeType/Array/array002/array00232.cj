// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record MyRecord {
    let a : Int32
}

record AnotherRecord{
    let a : Int32
}

func main(): Int64 {
    var a = MyRecord(1)
    var b = AnotherRecord(1)
    var myArray : Array<Array<MyRecord>> = @{@{a},@{b}} // EXPECTED: regex inconsistent element type for array literal
    return 0
}
