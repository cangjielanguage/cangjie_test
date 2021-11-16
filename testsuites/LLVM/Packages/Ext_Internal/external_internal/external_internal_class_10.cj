// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class Aoo{var value = 9}

external class A{
    public prop var a:Aoo {  // EXPECTED: regex external declaration uses internal types
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
