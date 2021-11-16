// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,match(1){case _ =>2},match(1){case _ =>3},4]
    var b = a[match(1){case _ =>0}..match(1){case _ =>3}:match(1){case _ =>1}]
    if(b==[1,2,3]){
        return 0
    }
    return 1
}
