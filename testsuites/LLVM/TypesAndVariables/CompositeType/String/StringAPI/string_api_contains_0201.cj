// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var res1 = str1.contains('') // EXPECTED: regex error.*empty character is not allowed
    var res2 = str2.contains('') // EXPECTED: regex error.*empty character is not allowed
    return 0
}
