// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<:V,T<:I1,V<:I2 {
    var a : T
    init(x:T){
        a = x
    }
}

interface I1{
    func a(){return 1}
}
interface I2 {
    func b(){return 1}
}
interface I3 <: I1&I2 {
    func b(){return 1}
}
class C1 <: I1&I3 {
    var c = 1
}

func main() {
   var a = Aoo<C1,I3>(C1())
   if ( a.a.c != 1 ){
       return 1
   }
   return 0
}
