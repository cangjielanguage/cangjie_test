// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Int32 = 1
    var b : Int32 = 1
    func a():Int32{return 1}
    a() = r // EXPECTED: regex illegal left value
    b++ = r // EXPECTED: regex illegal left value
    if (true) {1}else{2} = r // EXPECTED: regex illegal left value
    match (b) {case _ => 2} = r // EXPECTED: regex illegal left value
    () = r // EXPECTED: regex illegal left value
    Int8(b) = r // EXPECTED: regex illegal left value
    (1,1) = r // EXPECTED: regex illegal left value
    return 0
}
