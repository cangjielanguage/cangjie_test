// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Char> = ['b','a','1','2']
    var b = a.sortBy({lhs,rhs => lhs<rhs})
    if (b==['1','2','a','b']){
        return 0
    }
    return 1
}