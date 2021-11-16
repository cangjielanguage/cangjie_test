// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main():Int64 {
    var str1: String
    var str2 = str1 + "4"       // EXPECTED: regex variable 'str1' is used before initialization
    print(str2)
    return 0
}
