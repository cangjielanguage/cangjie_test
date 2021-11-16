// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a = 1
    var b = 1
    a = (b = 0)  // EXPECTED: regex error.*?type incompatible in this assignment
    if (a = 5) {  // EXPECTED: regex error.*?expected an expression of type 'Bool', but got
    }
    a = b = 0  // EXPECTED: regex error.*?type incompatible in this assignment
    return 0
     
}


