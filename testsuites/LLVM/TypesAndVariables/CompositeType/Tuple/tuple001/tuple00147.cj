// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type mytype = Int32

func main(): Int64 {
    var a : mytype = 1
    var MyTuple : mytype*mytype = (a,1)
    return 0
}
