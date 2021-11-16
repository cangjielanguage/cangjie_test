// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

types mytype<T> = ArrayList<T>

func test<T>() {
    var x : mytype<T> // EXPECTED: regex undeclared type name 'mytype'
    x = return
}

func main(): Int64 {
    test<Unit>()
    return 0
}
