// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check the public modifier for the function in class
class A{
    public func a(){

    }
}
func main(): Int64{
    let a = A().a
    return 0
}