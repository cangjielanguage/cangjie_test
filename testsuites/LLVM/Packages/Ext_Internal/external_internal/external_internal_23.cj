// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
    func foo(){0}
}

external record A<T> {
    func foo2(data:T){
        return data
    }
}

external var a = A<TimeUnit1>()

func main(): Int64 {
   return a.foo2(TimeUnit1.Year).foo()

}
