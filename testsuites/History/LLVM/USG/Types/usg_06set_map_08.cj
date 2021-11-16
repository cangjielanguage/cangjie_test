// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map: Map<String,Int64> = # {"a":1,"b":2,"a":3}
    if( map.containsKey("c") ) {
        return 1
    }
    return 0
}