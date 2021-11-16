// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X{}

func test<T1,T2>() where T1 <: X&T2, T2 <: X&T1{}

record R<T1,T2> where T1 <: X&T2, T2 <: X&T1{}

enum E<T1,T2> where T1 <: X&T2, T2 <: X&T1{e}

class C<T1,T2> where T1 <: X&T2, T2 <: X&T1{}

interface I<T1,T2> where T1 <: X&T2, T2 <: X&T1{}

trait R_X{}
append<T1,T2> R<T1,T2> with R_X where T1 <: X&T2, T2 <: X&T1{} 

func main():Int64{
    return 0
}
