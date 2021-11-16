// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(){
    let x = NaN64
    var y = 3.14
    var z = x < y  // z = false
    var v = x != x  // v = true
    var w = (x < y) == !(x >= y)  // w = false
    if((!z)&&v&&(!w)){
        return 0
    }
    return 1
}

