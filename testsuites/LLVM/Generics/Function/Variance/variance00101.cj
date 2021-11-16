// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}
class Child <: Father{}

func f1(a:Father):Child{return Child()}
func f2(a:Child):Father{return Father()} // f1 type is f2 type`s child type.

func assert<T>(input:T):Int32{
    return 0
}

func main():Int64{
    assert<(Child)->Father>(f1)
    assert<(Child)->Father>(f2)
    assert<(Father)->Child>(f1)
    return 0
}
