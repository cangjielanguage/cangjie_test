// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var i: Int32 = 5
    i++  // i = 6
    i--  // i = 5
    i--++
    let j = 0
    j = i--  // EXPECTED: regex error.*?type incompatible in this assignment
    return 0
     
}


