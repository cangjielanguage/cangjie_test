// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main():Int64 {
    var a: Int64 = 4    // EXPECTED: regex 'a' is previously declared here
    var a: String = "2"

    let b = 1       // EXPECTED: regex 'b' is previously declared here
    var b = 2
    return 0
}