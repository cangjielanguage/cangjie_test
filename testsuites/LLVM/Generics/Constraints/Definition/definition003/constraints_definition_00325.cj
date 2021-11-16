// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<X,Y>{}

class B<X,Y>{}

class C<X,Y> where X<:
A<A<B<Int32,Int32>,A<Int32,Int32>>,
B<A<Int32,Int32>,B<Int32,Int32>>>
, Y<:
B<B<A<Int32,Int32>,B<Int32,Int32>>,
A<B<Int32,Int32>,A<Int32,Int32>>>{}

func main():Int64{
    return 0
}
