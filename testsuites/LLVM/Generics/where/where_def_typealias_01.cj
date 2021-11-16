// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

type foo<T> where T<: Int32  = (T) -> T

func main() {
   var a : foo<Int32>={ x:Int32 => x }
   if ( a(1) != 1 ){
       return 1
   }
   return 0
}