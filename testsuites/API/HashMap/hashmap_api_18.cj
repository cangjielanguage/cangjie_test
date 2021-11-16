// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(1,"a"),(3,"b")])
func main(): Int64 {
    var hashset1 = hashmap1.keys()
    if (  hashset1.size() == 2 && hashset1.containsAll([1,3])){
        return 0
    }
    return 1
}