// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var MyTuple = (1,0)

func main(): Int64 {
    return MyTuple[1]
}
