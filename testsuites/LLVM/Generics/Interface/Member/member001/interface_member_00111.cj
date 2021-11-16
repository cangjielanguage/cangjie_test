// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{
    func t(a:T):T
}

func main(){return 0}