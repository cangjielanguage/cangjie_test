// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var x: Int32 = 5
    var y: Int32 = 10
    x = y   // assignment: x = 10
    x += y  // compound assignment: x = 20
    x -= y  // x = 10
    x *= y  // x = 100
    x /= y  // x = 10
    x %= y  // x = 0
    x = 5   // x = 5
    x **= 2 // x = 25 
    x <<= 1 // x = 50 
    x >>= 2 // x = 12 
    x &= y  // x = 8 
    x ^= y  // x = 2 
    x |= y  // x = 10 
    if(x==10){
        return 0
    }
    return 1
}

