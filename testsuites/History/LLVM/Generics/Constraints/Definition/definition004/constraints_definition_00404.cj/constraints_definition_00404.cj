// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X{}

func test<T1,T2,T3>() where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{}

record R<T1,T2,T3> where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{}

enum E<T1,T2,T3> where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{e}

class C<T1,T2,T3> where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{}

interface I<T1,T2,T3> where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{}

trait R_X{}
append<T1,T2,T3> R<T1,T2,T3> with R_X where T1 <: X&T2&T3, T2 <: X&T1&T3, T3 <: X&T1&T2{} 

func main():Int64{
    return 0
}
