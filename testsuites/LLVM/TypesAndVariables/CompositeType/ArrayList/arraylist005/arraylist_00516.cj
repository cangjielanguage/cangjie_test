// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func test(a:ArrayList<Unit>):ArrayList<Unit>{a}
    var x = { a:ArrayList<Unit> => a}
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
    test(a)
    x(a)
    return 0
}