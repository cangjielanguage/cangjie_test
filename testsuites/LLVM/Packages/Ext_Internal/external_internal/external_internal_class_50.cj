// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
package packageTest

internal class Aoo{var value = 9}

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
}

func main(): Int64 {
    return 0
}
