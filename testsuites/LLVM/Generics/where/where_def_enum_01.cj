// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

enum Aoo<T> where T<: Int32{
    A | B
    func foo(x:T){
        return x
    }
}
func main() {
   var a = Aoo<Int32>.A
   if ( a.foo(1) != 1 ){
       return 1
   }
   return 0
}
