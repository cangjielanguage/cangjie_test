// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

class B <: A{}

func main(): Int64 {
    let myArray = @{A(),B()}
    return 0
}
