// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

record Aoo<T> where T<: Int32{
    var a : T
    init(x:T){
        a = x
    }
}
func main() {
   var a = Aoo<Int32>(1)
   if ( a.a != 1 ){
       return 1
   }
   return 0
}
