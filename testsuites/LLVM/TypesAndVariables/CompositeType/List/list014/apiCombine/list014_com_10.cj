// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,-1,0,-9,4,8,-3]
    var b:List<Int64>
    for (i in 1..100000){
        b = a.sort()
        a = b[0..7].remove(0).append(1).set(0,100).reverse().insert(0,10).removeIf({i=>i==100}).insert(0,11).sortDescending()
    }
    return 0    
}