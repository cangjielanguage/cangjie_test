// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type mytype = Int64

func test(): mytype {
    let a : mytype = 0
    return a
}

func main(): Int64 {
    test()
    return 0
}
