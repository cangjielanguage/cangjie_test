// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test() : Int64 {  (return 1)*(return 1) }


func main(): Int64 {
    return test() - 1
}
