// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type A = B
class B {}
func foo() { A() }  // Use type alias A as constructor of B
func main(){
    var a: A = B() // Use type A as type B
    
    return 0

}

