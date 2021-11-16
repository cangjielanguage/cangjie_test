// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type mytype = Int32

func main(): Int64 {
    var a : mytype = 0
    let myArray0 : Array<Array<mytype>> = @{@{a,0}}
    return 0
}

