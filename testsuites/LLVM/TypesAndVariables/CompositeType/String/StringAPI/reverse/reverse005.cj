// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main():Int64 {
    var s1 : String
    s1.reverse()      // EXPECTED: regex  variable 's1' is used before initialization

    return 0
}
