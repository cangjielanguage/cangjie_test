// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 49}

external class A{
    private prop var a:Aoo {
        get() {
            Aoo()
        }
        set(value) {
            var b:Aoo=Aoo()
            b = value
        }
    }

    func foo(){a}
}

func main(): Int64 {
    var x =A()
    if(x.foo().value==49){
        return 0
    }else{
        return 1
    }

}
