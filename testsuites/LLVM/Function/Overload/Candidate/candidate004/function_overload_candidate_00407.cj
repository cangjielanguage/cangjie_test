// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
class B <: A{}
func foo(inp:()->A):Int64{return 1}
func foo(inp:()->B):Int64{return 2}

func main():Int64{
    if (foo({  => B()}) != 2) {
        return 1
    }
    return 0
}