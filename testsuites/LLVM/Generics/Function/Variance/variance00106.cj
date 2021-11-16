// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}
class Child <: Father{}

func f1(a:Child):Father{return Father()}
func f2(a:Father):Child{return Child()} // f2 type is f1 type`s child type.

func assert<T>(input:T):Int32{
    return 0
}

func main():Int64{
    assert<(Child)->Father>(f1)
    assert<(Child)->Father>(f2)
    assert<(Father)->Child>(f2)
    return 0
}
