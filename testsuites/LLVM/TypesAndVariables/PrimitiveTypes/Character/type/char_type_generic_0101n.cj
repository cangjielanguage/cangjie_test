// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func run(): Int64 {
    var array1: Array<String> = @{'a', 'b', 'c', 'd'}
    array1[0] = 2 // EXPECTED: regex type incompatible in this assignment
    return 0
}

func main(): Int64 {
    return run()
}
