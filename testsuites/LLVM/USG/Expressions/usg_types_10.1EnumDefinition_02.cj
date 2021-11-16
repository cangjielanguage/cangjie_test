// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

enum TimeUnit3 {
    Year(Int32) | Year(Int64) | Month(Int32) | Day  // EXPECTED: regex error.*?'Year' is already exist in enum 'TimeUnit3'
}

enum TimeUnit4 {
    Year(Int32) | Year(Int64, Int32) | Month(Int32) | Day
}

func main(){

    return 0
}

