// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait TR1{}

trait TR2{}

interface X<T> where T <: TR1{}

interface Y<T> where T <: TR2{}

class C <: X<C> &Y<C>{}

append C with TR1,TR2{}

class Z<T> where T <: X<T>, T <: Y<T>{}

func main():Int64{
    Z<C>()
    return 0
}
