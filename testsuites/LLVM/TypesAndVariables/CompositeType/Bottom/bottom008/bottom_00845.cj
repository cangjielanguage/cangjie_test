// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    var a : Int64 = 1
    match (a) {
        case _ if (return 0) => (return 1) // EXPECTED: regex expression of Nothing type cannot appear here currently
        case _ => 2
    }
    return 3
}

func main(): Int64 {
    return test()
}
