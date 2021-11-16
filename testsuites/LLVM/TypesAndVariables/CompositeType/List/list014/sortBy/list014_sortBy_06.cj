// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a:List<String> = ["Jie","Cang"]
    var b = a.sortBy({lhs, rhs => lhs < rhs})
    if (b==["Cang","Jie"]){
        return 0
    }
    return 1
}