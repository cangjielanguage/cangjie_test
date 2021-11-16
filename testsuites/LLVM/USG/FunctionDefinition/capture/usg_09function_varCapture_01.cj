// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// capture variables in function
func f(){
    var a = 1 
    let b = 2
    {var x = a; return x + b}()
    return 0
}
func main(){
    let a = f()
    return a 
}