// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test() : Bool {return true && return false}


func main(): Int64 {
    if (test()) { // false
        return 1
    }
    return 0
}
