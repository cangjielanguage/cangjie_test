// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal var b:Int64 = 22

external class A{
    protected var a = b
    func foo(){a}
}

func main(): Int64 {
    if(A().foo()==22){
        return 0
    }else{
        return 1
    }
}
