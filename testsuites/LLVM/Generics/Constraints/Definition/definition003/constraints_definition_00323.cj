// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<X,Y>{}


class C<X,Y> where X<: A<X*Y,Y*X>, Y<: A<Y*X,X*Y>{}

func main():Int64{
    return 0
}
