//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    var a = [spawn \{}] // EXPECTED:regex error.*?illegal symbol
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
