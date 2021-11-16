// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Int64>> = [[]]
    var b = a.slice(0..1)
    if (b == List<List<Int64>>([[]])){
        return 0
    }
    return 1
}