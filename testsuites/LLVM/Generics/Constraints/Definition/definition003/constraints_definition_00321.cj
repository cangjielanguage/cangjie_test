// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<X,Y>{}


class C<X,Y> where X<: A<X,X>, Y<: A<Y,Y>{}

func main():Int64{
    return 0
}
