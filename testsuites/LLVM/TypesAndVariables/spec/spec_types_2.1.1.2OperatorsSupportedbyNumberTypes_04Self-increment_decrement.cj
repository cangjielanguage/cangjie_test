// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64{
    var i: Int32 = 5 
    var j: Int32 = 6 
    i++ // i=6
    j-- // j=5 
    if ((i==6)&&(j==5)){
        return 0
    }
    return 1 
}
