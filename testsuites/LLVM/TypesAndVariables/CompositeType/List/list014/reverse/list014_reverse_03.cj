// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<String> = ["Cange","Jie"]
    var b = a.reverse()
    if (b==["Jie","Cange"]){
        return 0
    }
    return 1
}
