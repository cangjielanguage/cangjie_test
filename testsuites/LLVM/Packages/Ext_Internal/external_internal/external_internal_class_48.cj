// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal class Aoo{var value = 48}

external class A{   
    private func foo(x:Aoo):Aoo{  
        return x
    }
}

func main(): Int64 {
    return 0
}
