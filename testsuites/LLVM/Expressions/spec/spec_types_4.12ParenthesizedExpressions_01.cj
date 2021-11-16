// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var i = 1 + 2 * 3 - 4  // The result is 3. 
    var j = (1 + 2) * 3 - 4  // The result is 5.
    print("${i}\n")
    print("${j}\n")
    return 0
}

