// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}
class Child <: Father{}

func f1(a:Child):Child{return Child()}
func f2(a:Father):Father{return Father()}

func assert<T>(input:T):Int32{
    return 0
}

func main():Int64{
    assert<(Father)->Father>(f2)
    assert<(Child)->Child>(f1)
    return 0
}
