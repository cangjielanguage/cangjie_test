// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*

class A<K,T> where T<: HashMap<K,K> {
     func test(x:Int64):Int64
     {
         return x
     }
}
func main(): Int64 {
    var a =A<Int64,HashMap<Int64,Int64>>()
    if ( a.test(4) == 4){
        return 0
    }
    return 1
}
