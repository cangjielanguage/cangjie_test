// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<T>{}

func test<T1,T2,T3>() where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{}

record R<T1,T2,T3> where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{}

enum E<T1,T2,T3> where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{e}

class C<T1,T2,T3> where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{}

interface I<T1,T2,T3> where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{}

trait R_X{}
append<T1,T2,T3> R<T1,T2,T3> with R_X where
T1 <: X<T1>,
T1 <: X<T2>,
T1 <: X<T3>,
T2 <: X<T1>,
T2 <: X<T2>,
T2 <: X<T3>,
T3 <: X<T1>,
T3 <: X<T2>,
T3 <: X<T3>{}

func main():Int64{
    return 0
}
