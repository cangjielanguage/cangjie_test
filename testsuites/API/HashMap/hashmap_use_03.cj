// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
   var a:HashMap<Int8,String> = HashMap<Int8,String>(3,{x:Int64=>(Int8(x),x.toString())})
   var b =  a.foo()
   return b
}

extend HashMap<K,V> where K <: Hashable, K <: Equatable<K>  {
    func foo(){
        return 1
    }
}
