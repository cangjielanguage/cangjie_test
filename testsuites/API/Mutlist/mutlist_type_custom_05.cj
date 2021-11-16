// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var rs = Buffer<Mut>([subMut(),Mut()])
    var r1 = Buffer<Buffer<Mut>>([rs])
    var r2 = Buffer<Buffer<Mut>>([Buffer<Mut>([subMut(),Mut()])])
    if ( r1.size()!= 1){
        return 1
    }
    if ( r2.size()!= 1){
        return 2
    }
   if ( r1[0][0].test(5)!= Int8(5)){
        return 3
    }
   if ( r2[0][0].test(5)!= Int8(5)){
        return 4
    }
    if ( r1[0][1].test(5)!= Int8(5)){
        return 5
    }
    if ( r2[0][1].test(5)!= Int8(5)){
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