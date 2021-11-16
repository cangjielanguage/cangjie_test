// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var t=0
    var arr = Array<Int64>([1,2,3])

    for (i in arr){
        var arr2 = Array<Int64>([0,0,0])
        arr2[i-1]=i+2
        for(j in arr2){
            t +=j
        }
    }
    
    return 12-t
}
