// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{
    let a : Option<T> = Option<T>.None
}

func main(){return 0}