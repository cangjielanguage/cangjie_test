// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// *在入参中解析
func foo(a:Int32, b: Int32, c: Int32){
    return a+b+c
}
func main(): Int64 {
    let a = foo(*[1,3,4])   // EXPECTED: regex invalid expression initialization
    if (a == 8) {
        return 0
    }
    return 1
}
