// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var rs =[subMut(),Mut()]
    var r1 = Buffer<Mut>(rs)
    var r2 = Buffer<Mut>([subMut(),Mut()])
    if ( r1.size()!= 2){
        return 1
    }
    if ( r2.size()!= 2){
        return 2
    }
   if ( (r1[0] as subMut).getOrThrow().test(5)!= Int16(5)){
        return 3
    }
   if ( (r2[0] as subMut).getOrThrow().test(5)!= Int16(5)){
        return 4
    }
   if ( r1[1].test(5)!= Int8(5)){
        return 5
   }
   if ( r2[1].test(5)!= Int8(5)){
        return 6
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