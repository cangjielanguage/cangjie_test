// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A{
    a
    func test(x:A):A{x}
}


func main(): Int64 {
    var i = A.a
    var x : A = i.test(i)
    return 0
}