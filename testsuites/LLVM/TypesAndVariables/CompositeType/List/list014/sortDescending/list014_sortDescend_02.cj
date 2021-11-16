// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Char> = ['1','c','a']
    var b = a.sortDescending()
    if(b==['c','a','1']){
        return 0
    }
    return 1
}