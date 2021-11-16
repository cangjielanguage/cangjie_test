// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{}
trait update2{}
interface I<X,Y,Z>
where X<:update
, Y<:update2
, Z<:update2{}
func main(){return 0}