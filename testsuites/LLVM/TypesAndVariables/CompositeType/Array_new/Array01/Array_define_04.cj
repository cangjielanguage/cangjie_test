// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    var i = 0
    var t:Int8 = 0
    
    while(i<3){
        var a1 = Array<Int8>([1,2,3])
        t += a1[i]
        i += 1
    }
    
    return 6-Int64(t)
}
