// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
func main(): Int64 {
    var hashmap1:HashMap<Int64,String> = HashMap<Int64,String>(2**18)
    if(hashmap1.capacity() == 2**18){
        return 0
    }
    return 1
}