// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<String> = ["1","2","3"]
    var b = a.remove(0)
    if (a==["1","2","3"]){
        return 0
    }
    return 1
}