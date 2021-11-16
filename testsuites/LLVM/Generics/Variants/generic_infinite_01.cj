// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Ice1{}
interface Ice2{}

class B<T> <: Ice1 & Ice2 where T <: Ice1,T<: Ice2 {
    static var a = 1
}

class A<T> where  T <: Ice1, T <: Ice2{
    operator func *(b:A<B<T>>):Bool  {true} // EXPECTED: regex error.*generic infinite instantiation
}

extend Int32 <: Ice1 & Ice2{}

func main(): Int64 {
    var a = A<Int32>() // A<Int32> ==> A<B<Int32>> ==> A<B<B<Int32>>>  infinite instantiation
    return 0
}
