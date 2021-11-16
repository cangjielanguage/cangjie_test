// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{
    static func foo():Unit{}
}

interface C<X> <: A{
    static func foo<X>(a:X):Unit{}
}

func main(){
    var a : C<Int32>
    return 0
}