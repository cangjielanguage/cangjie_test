// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a
    open func b(x:Int64){} // EXPECTED: regex 'open' modifier is illegal for function declaration in enum body
}


func main(): Int64 {
    var i = A.a
    i.b(1)
    return 0
}
