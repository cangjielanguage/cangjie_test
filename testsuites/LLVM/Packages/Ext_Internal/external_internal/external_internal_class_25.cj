// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 5}

external class A{
    protected var a:Aoo = Aoo()
    func foo(){a}
}

func main(): Int64 {
    if(A().foo().value==5){
        return 0
    }else{
        return 1
    }
}
