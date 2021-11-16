// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}
func test(): Int64 {
    var i : A = A()
    var res = match (i) {
        case _ : A => 5
        case _ => 0
    }
    if (res != 5) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
