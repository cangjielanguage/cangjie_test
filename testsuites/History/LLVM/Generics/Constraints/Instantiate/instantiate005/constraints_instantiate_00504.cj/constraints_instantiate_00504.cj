// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}

trait B{}

append Unit with A,B{}

class Z<X,Y> where X <: A, Y <: B{}

func main():Int64{
    Z<Unit,Unit>()
    return 0
}
