// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<X,Y>{
    a(X,Y)
}

class B{}
class C{}

func main(): Int64 {
    (a<B,C>(B(),C()))
    return 0
}
