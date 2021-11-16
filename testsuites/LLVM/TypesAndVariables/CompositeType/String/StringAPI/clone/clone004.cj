// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main():Int64 {
    var s3 = "Cangjie\".clone() // EXPECTED: regex string literal is missing '\"' in the end
    return 0
}
