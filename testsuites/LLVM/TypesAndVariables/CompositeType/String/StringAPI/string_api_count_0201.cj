// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

func main(): Int64 {
    var str1 = ""
    var res1 = str1.count('')  // EXPECTED: regex error.*empty character is not allowed
    var res2 = str1.count('a') // EXPECTED: regex-not error
    return 0
}
