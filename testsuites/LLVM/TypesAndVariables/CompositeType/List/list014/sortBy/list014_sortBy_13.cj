// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<String> = ["Cang","Jiee"]
    var b = a.sortBy({i,j=>i.size()>j.size()})
    if (b==["Jiee","Cang"]){
        return 0
    }
    return 1
}
