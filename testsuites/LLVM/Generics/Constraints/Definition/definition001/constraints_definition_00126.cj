// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
class Z<T>{
    func foo(){}
}

class C<X> where X <: Z<C<Z<C<Int32>>>>{ // EXPECTED: regex  generics type arguments do not match the constraint
    init(input:X){
        let a : Unit = input.foo()
    }
}

interface I<X> where X <: Z<I<Z<I<Int32>>>>{ // EXPECTED: regex  generics type arguments do not match the constraint
    //let b = input.foo()
}


func main():Int64{
    return 0
}
