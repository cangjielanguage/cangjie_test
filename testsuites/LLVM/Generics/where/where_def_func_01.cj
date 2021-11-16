// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x:T) where T<: Int32{
    return x
}
func main() {
   var a = foo<Int32>(1)
   if ( a != 1 ){
       return 1
   }
   return 0
}
