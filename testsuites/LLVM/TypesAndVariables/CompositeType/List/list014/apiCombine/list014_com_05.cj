// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.remove(2)).removeIf({i=>i%2==0})
    
	if (b == [1]){
        return 0
    }
	return 1
}