// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{}
interface I<T> where T<:update {}
func main(){return 0}