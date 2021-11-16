// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: B & I { // EXPECTED: regex-auto the class irrelevant upperbound 'Record-B' of generic parameter 'T' must inherit or implement interface upper bound 'Interface-I'
    var a : T
    init(x:T){
        a = x
    }
}

record B {
    var b = 1
}
interface I{}

func main() {
   var a = Aoo<B>(B())
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
