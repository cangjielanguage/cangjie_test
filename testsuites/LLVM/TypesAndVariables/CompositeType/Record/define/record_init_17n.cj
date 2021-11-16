// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record GenRec{
    let b: Int32 =1
    init(str:String){
        return GenRec("hi") // EXPECTED: regex either 'Unit expression' or 'no expression' after 'return' is allowed in a constructor
    }
}

func main():Int64 {
    var rec = GenRec("hi")
    if (rec.b == 1) {
        return 0
    }
    return 1
}