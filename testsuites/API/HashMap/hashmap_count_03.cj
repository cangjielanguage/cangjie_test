// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(2,"a"),(1,"c"),(10,"c")])
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(hashmap1)
var hashmap3:HashMap<Int8,String> = HashMap<Int8,String>(3,{x:Int64=>(Int8(x),x.toString())})
func main(): Int64 {
    if (  hashmap1.size() != 3 ){
        return 1
    }
    if (  hashmap2.size() != 3 ){
        return 2
    }
    if (  hashmap3.size() != 3 ){
        return 3
    }
    return 0
}