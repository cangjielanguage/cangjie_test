// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// PIPELINE with operator `()`
class A {
    operator func ()(x: Int32) {
        x
    }
} 

func main(): Int64 {
     
    let obj = A()
    let a: Int32 = 1
    let res = a |> obj // Equivalence：obj.operator()(a)   

    return 0
     
}


