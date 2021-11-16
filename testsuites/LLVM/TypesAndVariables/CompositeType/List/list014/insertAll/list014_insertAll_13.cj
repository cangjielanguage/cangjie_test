// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1 2 0 1 1 2 3 4
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
from std import collection.*
func main(){
    var a:List<Int64*Int64> = [(1,2),(3,4)]
    var b = a.insertAll(1,HashMap<Int64,Int64>(2,{i=>(i,i+1)}))
    
    var c = b.iterator()
    for (i in 0..b.size()){
        let d = match(c.next()){
		case Some(x) => x
		case $None => (0,0)
	    }
        print("${d[0]} ${d[1]} ")
    }
    
    return 0
}
