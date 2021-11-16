// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}
trait B{}
func g<T1,T2>()
where T1 <: A
, T2 <: B {}
func main(){return 0}