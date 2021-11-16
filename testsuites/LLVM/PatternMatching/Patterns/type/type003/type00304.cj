// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}
class B{}
func test(): Int64 {
    var i : A = A()
    var res = match (i) {
        case _ : B => 0
        case _ => 5
    }
    if (res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
