// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main():Int64 {
    var s1: String
    var s3 = "Cangjie\".reverse() // EXPECTED: regex string literal is missing '\"' in the end
    return 0
}
