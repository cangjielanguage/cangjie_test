// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(2,"a"),(1,"c")])
func foo(hashmap1:HashMap<Int8,String>){
    hashmap1.put(3,"5")
    return hashmap1
}
func main(): Int64 {
    var a = foo(hashmap1)
    if ( a.size() == 3 && a[1] == "c" && a[3] == "5" && a[2] == "a"){
        return 0
    }
    return 1
}