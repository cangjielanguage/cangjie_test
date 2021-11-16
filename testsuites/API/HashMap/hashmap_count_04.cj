// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass


from std import collection.*
func main(): Int64 {
    var hashmap3:HashMap<Int8,String> = HashMap<Int8,String>(100,{x:Int64=>(Int8(x),x.toString())})
    if (  hashmap3.size() == 100 ){
        print("pass")
        return 0
    }
    return 1
}