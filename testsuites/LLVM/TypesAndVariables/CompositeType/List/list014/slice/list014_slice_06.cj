// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(){
    var a:List<Int64> = [1,2,3,4]
    try {
        var b = a.slice(4..-1:-1)
    } catch ( e : IndexOutOfBoundsException ){
        return 0
    }
    return 1
}
