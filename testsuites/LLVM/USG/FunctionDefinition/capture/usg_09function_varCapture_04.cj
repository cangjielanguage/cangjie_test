// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// set lambda as a param
func h(x : Int64, f : (Int64) -> Int64) {
      return f(x)
}
func main(){
    var a = 1
    h(2, {x => x + a}) // EXPECTED: regex lambda captured a mutable variable directly, lambda cannot be used as a param
    return 0 
}