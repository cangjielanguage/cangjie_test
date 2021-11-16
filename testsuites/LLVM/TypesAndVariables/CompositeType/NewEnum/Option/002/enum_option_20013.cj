// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var a = ?Int64(0.1) // EXPECTED: regex-auto invalid use of operator '?'
    return 0
}