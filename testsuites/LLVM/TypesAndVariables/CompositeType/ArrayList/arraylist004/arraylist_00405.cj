// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let x = { input: Int64 => return () }
    var a: ArrayList<Unit> = ArrayList<Unit>(10, x)
    isEmpty(a) // EXPECTED: regex undeclared identifier 'isEmpty'
    return 1
}
