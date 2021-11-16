//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test() : Int64 {
    throw return Exception() //EXPECTED : regex return type for 'init' is mismatched
}

// func foo() : Int64 = throw return Exception()

func main(): Int64 {
    test()
    // foo()
    return 0
}
