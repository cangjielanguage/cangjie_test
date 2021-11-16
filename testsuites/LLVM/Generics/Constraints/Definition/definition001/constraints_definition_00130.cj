// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A<X,Y>{
    func foo(){}
}


class C<X> where X <: A<X,Int32>{
    func foo(){}
    init(input:X){
        let a : Unit = input.foo()
    }
}

interface I<X> where X <: A<X,Int32>{}


func main():Int64{
    return 0
}
