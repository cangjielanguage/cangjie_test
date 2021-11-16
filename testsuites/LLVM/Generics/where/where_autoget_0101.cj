// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Ice1{}
interface Ice2{}

class B<T> <: Ice1 & Ice2 where T <: Ice1,T<: Ice2 {
    static var a = 1
}

class A<T> {
    operator func *(b:A<B<T>>):Bool  {true} // EXPECTED: regex error.*generics type arguments do not match the constraint
}

extend Int32 <: Ice1 & Ice2{}

func main(): Int64 {
    return 0
}