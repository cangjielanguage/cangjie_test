// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{}
interface B{}
class C <: A &B &X<C> &Y<C>{}

interface X<T> where T <: A{}

interface Y<T> where T <: B{}

class Z<T> where T <: X<T>, T <: Y<T>{}


func main():Int64{
    Z<C>()
    return 0
}
