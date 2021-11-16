// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto Unmatched ')' found

func main(): Int64 {
    let myTuple = (((((((1,2),((((((1,2),((((((((((((((((1,2),((((((((((((1,2))))))))))))))))))))),(1,2)))))))))))),(1,2))))))))
    return 0
}
