// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{var value = 9}

external class A{
    public prop var a:Aoo {
        get() {
            Aoo()
        }
        set(value) {
            var b:Aoo=Aoo()
            b = value
        }
    }
}

func main(): Int64 {
    var x =A()
    x.a = Aoo()
    if(x.a.value==9){
        return 0
    }else{
        return 1
    }

}
