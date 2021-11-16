// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func test(): Int64 { // EXPECTED: regex type of function body is incompatible with return type
    let sum = { a:Int64, b:Int64 => a + b}
    var i : Int64 = 0
    return sum(i,i,i)
}

func main(): Int64 {
    return test()
}