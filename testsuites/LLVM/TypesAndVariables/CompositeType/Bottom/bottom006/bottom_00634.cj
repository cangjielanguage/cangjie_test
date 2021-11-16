// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test() : Bool {return (false && return true)}


func main(): Int64 {
    if (test()) { // false ?  (false && return true) = false
        return 1
    }
    return 0
}
