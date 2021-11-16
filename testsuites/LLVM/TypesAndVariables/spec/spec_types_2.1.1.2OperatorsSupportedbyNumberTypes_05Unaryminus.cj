// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64{
    var i: Int32 = 5 
    var j: Int64 = 100 
    var k: Int32 = -i // k = -5 
    var l: Int64 = -j // l = -100 
    if ((k==-5)&&(l==-100)){
        return 0
    }
    return 1 
}
