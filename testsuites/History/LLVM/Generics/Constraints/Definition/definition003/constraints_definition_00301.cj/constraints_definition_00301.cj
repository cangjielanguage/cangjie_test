// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

func test<T1,T2,T3>() where T1 <: X{}

record R<T1,T2,T3> where T1 <: X{}

enum E<T1,T2,T3> where T1 <: X{e}

class C<T1,T2,T3> where T1 <: X{}

interface I<T1,T2,T3> where T1 <: X{}

trait R_X{}
append<T1,T2,T3> R<T1,T2,T3> with R_X where T1 <: X{} 

func main():Int64{
    return 0
}
