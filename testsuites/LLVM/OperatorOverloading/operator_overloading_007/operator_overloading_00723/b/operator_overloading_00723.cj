// DEPENDENCE: ../a 
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00723a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package b
import a.*

interface update{
    operator func !():Bool
}

extend a.A <: update{
    operator func !():Bool {true}
}

func main():Int64{
    var i : a.A = a.A()
    if (!i) {
        return 0
    }
    return 1
}
