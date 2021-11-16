// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func function44():Unit {
    {
       func foo(){}
       ((), 32);
    }[0];
}

func main(): Int64 {
    function44()
    return 0;
}