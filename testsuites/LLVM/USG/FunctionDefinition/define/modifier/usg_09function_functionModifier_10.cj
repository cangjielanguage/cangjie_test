// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check the extend in interface
interface A{
    func a(): Int64{return 1}
}

interface B <: A{
    func a(): Int64{return 2}
} 

func main(): Int64{
    return 0
}