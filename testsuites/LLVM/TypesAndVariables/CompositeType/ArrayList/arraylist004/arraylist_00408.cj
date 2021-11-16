// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    func x(input:Int64){return ()}
    var a: ArrayList<Unit> = ArrayList<Unit>(10, x)
    a.size(a) // EXPECTED: regex extra argument given for call with parameter list: \(\)
    return 1
}
