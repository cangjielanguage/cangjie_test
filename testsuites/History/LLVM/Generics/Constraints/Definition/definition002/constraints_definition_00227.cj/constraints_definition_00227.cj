// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<A,B>{}
interface Y<A,B>{}

func test<T>() where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{}

record R<T> where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{}

enum E<T> where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{e}

class C<T> where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{}

interface I<T> where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{}

trait R_X{}

append<T> R<T> with R_X where T <: X<X<Y<Int32,Int32>,X<Int32,Int32>>,
Y<X<Int32,Int32>,Y<Int32,Int32>>> ,
T <:
Y<Y<X<Int32,Int32>,Y<Int32,Int32>>,
X<Y<Int32,Int32>,X<Int32,Int32>>>{}

func main():Int64{
    return 0
}
