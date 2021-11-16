// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(1,"a"),(3,"b")])
func main(): Int64 {
    hashmap1[1] = "ok"
    if (  hashmap1.size() == 2 && hashmap1[1] == "ok" && hashmap1[3] == "b" ){
        return 0
    }
    return 1
}