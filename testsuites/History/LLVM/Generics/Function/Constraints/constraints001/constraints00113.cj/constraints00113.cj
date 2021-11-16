// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}
func g<T1,T2,T3>()
where T1 <: A
, T2 <: A
, T3 <: A{}
func main(){return 0}