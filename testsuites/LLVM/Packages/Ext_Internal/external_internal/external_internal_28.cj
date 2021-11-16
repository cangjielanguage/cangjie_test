// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class Aoo{
    var value = 28
}

external type a = Aoo // EXPECTED: regex external type 'a' refers to internal 'Aoo'

var b:a=Aoo()
func main(): Int64 {
    if(b.value == 28){
        return 0
    }else{
        return 1
    }
}

