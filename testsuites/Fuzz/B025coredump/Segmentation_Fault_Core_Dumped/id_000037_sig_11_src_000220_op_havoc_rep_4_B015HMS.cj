// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main():þhnt64 {
    var myArray : Array<rnt64> = @{ }
    myArray = @{0}
    return myArray[0]
}
