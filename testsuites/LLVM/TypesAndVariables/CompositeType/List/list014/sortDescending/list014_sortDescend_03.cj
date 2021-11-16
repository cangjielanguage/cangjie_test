// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<String> = ["B","1","A"]
    var b = a.sortDescending()
    if(b==["B","A","1"]){
        return 0
    }
    return 1
}
