// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    operator func ()(x: Float32) {
        x * x
    }
}

func main(): Int64 {
    let obj = A()
    let a: Float32 = 3.0
    let res = a |> obj // Equivalence：obj.operator()(a)
    if ( a*a != res ) {
        return 1
    }
    0
}