// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){43}

external class A{
    private var a = goo
    func foo(){a}
}

func main(): Int64 {
    if(A().foo()()==43){
        return 0
    }else{
        return 1
    }
}
