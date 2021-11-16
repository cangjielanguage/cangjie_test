// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}
trait B{}
func g<T>()
where
T
<:
A
,
T
<:
B
{}
func main(){return 0}