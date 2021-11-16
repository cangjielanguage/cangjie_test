// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface C<T> where T <: ArrayList<Unit>{}

func main(): Int64 {
    func test(input:C<ArrayList<Unit>>){}
    return 0
}