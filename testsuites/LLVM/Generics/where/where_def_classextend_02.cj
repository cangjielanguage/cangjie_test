// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
   var a = Aoo<Int32>(1)
   if ( a.a != 1 ){
       return 1
   }
   if ( a.foo(2) != 2 ){
       return 1
   }
   return 0
}
