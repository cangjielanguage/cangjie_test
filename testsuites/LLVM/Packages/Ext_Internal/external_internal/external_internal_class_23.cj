// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external func goo(){23}

external class A{
    protected var a = goo
    func foo(){a}
}

func main(): Int64 {
    if(A().foo()()==23){
        return 0
    }else{
        return 1
    }
}
