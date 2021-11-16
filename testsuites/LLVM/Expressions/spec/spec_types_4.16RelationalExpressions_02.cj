// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    3 < 4 < 5  // EXPECTED: regex error.*?illegal compare operation
    3 == 3 != 4  // EXPECTED: regex error.*?illegal compare operation
    return 0
     
}


