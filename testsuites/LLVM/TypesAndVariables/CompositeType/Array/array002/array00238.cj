// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A {}

func main(): Int64 {
    let a = A()
    let b = A()
    let myArray : Array<Array<A>> = @{@{a,b,A()}}
    return 0
}
