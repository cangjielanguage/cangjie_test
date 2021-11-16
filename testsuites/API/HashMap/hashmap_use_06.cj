// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
func main() {
    var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(3,{x:Int64=>(Int8(x),x.toString())})
    var hashmap2:HashMap<String,HashMap<Int8,String>> = HashMap<String,HashMap<Int8,String>>([("1",hashmap1)])
    for (item in hashmap2) {
        for (i in item[1]){
            print("${i[0]}:${i[1]} ")
                    if (i[1] == "2") {
                        return 0
                    }
        }

    }
    return 1
}
