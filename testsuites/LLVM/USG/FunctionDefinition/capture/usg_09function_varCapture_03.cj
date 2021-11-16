// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// let lambda be a return value
func a(){
    var a = 1
    let b = 2
    func f(){
        return {x: Int64 => x + a}// EXPECTED: regex lambda captured a mutable variable directly, lambda cannot be used as a return value
    }
}
func main(){
    a()
    return 0 
}