// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


record A{}
enum B{b}

func g<T>() where T <: A {}
func f<T>() where T <: B {}

func main(){return 0}
