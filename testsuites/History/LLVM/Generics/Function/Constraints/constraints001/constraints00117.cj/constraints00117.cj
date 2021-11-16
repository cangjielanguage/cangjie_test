// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}

func g<T>() where T <: A {}

func main(){return 0}
