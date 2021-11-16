// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var hundred = 0
    while (hundred < 100) { // until hundred < 100
        hundred++
    }
    
    return 0
}

