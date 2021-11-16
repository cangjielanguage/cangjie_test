// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// class/interface/record直接使用位操作符
func main(): Int64 {
    1^ ;  // EXPECTED: regex expected expression here
    2<<;   // EXPECTED: regex expected expression here
    1>> ;    // EXPECTED: regex expected expression here
    3& ;   // EXPECTED: regex expected expression here
    5| ; // EXPECTED: regex expected expression here
}