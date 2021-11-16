// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test(): Int64 {
    var a : Int64 = 1
    match (a) {
        case _ if (return 0) => 1
        case _ => 2
    }
}

func main(): Int64 {
    return test()
}
