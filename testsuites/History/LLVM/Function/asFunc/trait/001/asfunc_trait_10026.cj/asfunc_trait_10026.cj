// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append mytype with C{
    func asFunc(input:mytype):Int64{0}
}

type mytype = Int64

func main(): Int64 {
    var a : mytype = 1
    return a()
}
