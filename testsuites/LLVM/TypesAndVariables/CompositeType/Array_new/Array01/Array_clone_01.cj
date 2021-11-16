// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var a1 = Array<Int64>([1,2,3])

func main(): Int64 {

    var a= a1.clone 
    a() // EXPECTED:regex error.*?no matching function for operator \'\(\)\' function call
    return 0
}
