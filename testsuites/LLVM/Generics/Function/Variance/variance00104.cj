// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}
class Child <: Father{}

func f1(a:Father):Father{return Father()}
func f2(a:Child):Child{return Child()} // f1 type and f2 type are unconnected.

func assert<T>(input:T):Int32{
    return 0
}

func main():Int64{
    assert<(Father)->Father>(f1)
    assert<(Child)->Child>(f2)
    return 0
}
