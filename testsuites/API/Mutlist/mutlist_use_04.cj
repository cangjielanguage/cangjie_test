// EXEC: %compiler %stdx_cmp_opt -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

class A<T,V> where T<: Buffer<V>  {
     func test(x:Int64):Int64
     {
         return x
     }
}


func main(): Int64 {
    var a =A<Buffer<Int64>,Int64>()
    if ( a.test(4) == 4){
        return 0
    }
    return 1
}


