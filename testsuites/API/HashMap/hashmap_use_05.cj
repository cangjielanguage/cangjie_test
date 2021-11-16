// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
func main() {
    var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(3,{x:Int64=>(Int8(x),x.toString())})
    for (item in hashmap1) {
        print("${item[0]}:${item[1]} ")
        if (item[1] == "2") {
            return 0
        }
    }
    return 1
}
