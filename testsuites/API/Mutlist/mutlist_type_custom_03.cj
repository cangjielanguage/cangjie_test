// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var rs = Buffer<Mut>([subMut()])
    var r1 = Buffer<Buffer<Mut>>([rs])
    var r2 = Buffer<Buffer<Mut>>([Buffer<Mut>([subMut()])])
    if ( r1.size()!= 1){
        return 1
    }
    if ( r2.size()!= 1){
        return 2
    }
    if ( (r1[0][0] as subMut).getOrThrow().test(5)!= Int16(5)){
        return 3
    }
    if ( (r2[0][0] as subMut).getOrThrow().test(5)!= Int16(5)){
        return 4
    }
    return 0
}
open class Mut{
   func test(x:Int8):Int8
   {
       return x
   }
}
class subMut <: Mut{
   func test(x:Int16):Int16
   {
       return x
   }
}