// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// assign a lambda to a variable
func f(){
    var a = 1 
    let x = {a} // EXPECTED: regex lambda captured a mutable variable directly, lambda cannot be assigned to a variable
}
func main(){
    f()
    return 0 
}