// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from collection import collection.*
func main(): Int64 {
    var tmp = ""
    let map = #{"a":'2',"b":'2',"c":'r'}
    var keySet = map.keys()
    for ( keyItem in keySet ){
        tmp = tmp + map.get(keyItem)
    }
    if (tmp != "abc"){
        return 1
    }
    return 0
}
