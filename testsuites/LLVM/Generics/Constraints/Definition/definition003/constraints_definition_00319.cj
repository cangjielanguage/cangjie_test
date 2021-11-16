// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<X>{}

class B<X>{}

class C<X,Y> where X<: A<Y>, Y<: B<X>{}

func main():Int64{
    return 0
}
