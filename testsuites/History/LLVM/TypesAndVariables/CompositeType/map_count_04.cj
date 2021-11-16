// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map02:Map<Int32,Int32> = Map<Int32,Int32>(100,{x:Int64=>(Int32(x),Int32(x))})
    if (map02.size() == 100){
        return 0
    }
    return 1
}
