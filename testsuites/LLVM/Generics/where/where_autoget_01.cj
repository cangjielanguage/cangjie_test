// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Ice1{}
interface Ice2{}

class B<T> <: Ice1 & Ice2 where T <: Ice1,T<: Ice2 {
    static var a = 1
}

class A<T> where  T <: Ice1, T <: Ice2{
    operator func *(b:A<B<T>>):Bool  {true}
}

extend Int32 <: Ice1 & Ice2{}

func main(): Int64 {
    return 0
}