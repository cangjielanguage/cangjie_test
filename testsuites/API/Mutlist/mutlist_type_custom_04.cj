// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var rs = Buffer<subMut>([Mut()])//EXPECTED: regex-auto  parameters and arguments mismatch
    var r1 = Buffer<Buffer<subMut>>([rs])//EXPECTED: regex-auto  parameters and arguments mismatch
    var r2 = Buffer<Buffer<subMut>>([Buffer<subMut>([Mut()])])//EXPECTED: regex-auto  parameters and arguments mismatch
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