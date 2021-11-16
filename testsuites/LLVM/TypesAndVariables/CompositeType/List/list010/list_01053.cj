//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    for (i in 1..10) {
        var a = [continue] // EXPECTED:regex error.*?expression of Nothing type cannot appear here currently
    }
    return 0
}

func main(): Int64 {
    return test()
}
