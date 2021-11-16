// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal class Aoo{var value = 46}

external class A{  
    private var a:Aoo = Aoo()  
}

func main(): Int64 {
    return 0
}

