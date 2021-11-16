// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external record A<T> where T<: B{let a =T.b2}

external class B{
    static var b2 = 2
}

func main(): Int64 {
   return A<B>().a-2
}
