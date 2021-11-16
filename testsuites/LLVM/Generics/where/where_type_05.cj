// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: String {
    var a : T
    init(x:T){
        a = x
    }
}

class Boo<T> where T<: List<Int32> {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a1 = Aoo<String>("a")
   if ( a1.a != "a" ){
       return 1
   }
   var a2 = Boo<List<Int32>>([1,2,3])
   if ( a2.a[1] != 2 ){
       return 2
   }
   return 0
}
