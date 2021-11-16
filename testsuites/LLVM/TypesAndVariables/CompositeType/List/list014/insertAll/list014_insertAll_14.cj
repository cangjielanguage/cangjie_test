// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Char>> = [[]]
    var b = a.insertAll(0,[['1']])
    if (b==[['1'],[]]){
        return 0
    }
    return 1
}