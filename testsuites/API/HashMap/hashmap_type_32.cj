// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(1,"1"),(2,"2"),(1,"3")])
func main(): Int64 {
    if (  hashmap1[1] == "3" && hashmap1[2] == "2"){
        return 0
    }
    return 1
}