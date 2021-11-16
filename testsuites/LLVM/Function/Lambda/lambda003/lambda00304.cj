// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
func test(): Int32 { // EXPECTED: regex type of function body is incompatible with return type
    let sum = { a: Int32, b: Int32 => a + b}
    var i : Int8 = 0
    return sum(i,i)
}

func main(): Int64 {
    return test()
}