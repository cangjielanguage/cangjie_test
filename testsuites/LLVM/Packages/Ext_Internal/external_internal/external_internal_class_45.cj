// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 45}

external class A{
    public var a:Aoo = Aoo()
    func foo(){a}
}

func main(): Int64 {
    if(A().foo().value==45){
        return 0
    }else{
        return 1
    }
}
