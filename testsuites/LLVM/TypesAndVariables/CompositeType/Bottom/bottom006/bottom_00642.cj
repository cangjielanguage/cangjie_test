// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan invalid use of operator ':'

func test() : Int64 {true ? (return 0):return 1}


func main(): Int64 {
    return test() // 0
}
