// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<X> where X <: C<X>{
    func foo(){}
    init(input:X){
        let a : Unit = input.foo()
    }
}

interface I<X> where X <: I<X>{}


func main():Int64{
    return 0
}
