// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 29}

external class A{
    protected prop var a:Aoo {
        get() {
            Aoo()
        }
        set(value) {
            var b:Aoo=Aoo()
            b = value
        }
    }
    func foo(){this.a}
}

func main(): Int64 {
    var x =A()
    if(x.foo().value==29){
        return 0
    }else{
        return 1
    }
}
