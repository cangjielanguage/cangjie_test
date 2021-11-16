// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T>{
    var a : T
    init(x:T){
        a = x
    }
}

extend Aoo<T> where T<: Int32 {
    func foo(x:T){
        return x
    }
}

func main() {
   var a = Aoo<Int64>(1)
   if ( a.a != 1 ){
       return 1
   }
   if ( a.foo(Int32(2)) != 2 ){ // EXPECTED: regex error.*parameters and arguments mismatch
       return 1
   }
   return 0
}
