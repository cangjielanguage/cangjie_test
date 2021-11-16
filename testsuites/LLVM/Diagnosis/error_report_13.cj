// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex found candidate

func main():Int64 {
    "123123123".contains()
    return 0
}
