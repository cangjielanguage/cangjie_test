// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{}
class A{}
append A with update{}
func g<T>()where T<:update {}
func main(){return 0}