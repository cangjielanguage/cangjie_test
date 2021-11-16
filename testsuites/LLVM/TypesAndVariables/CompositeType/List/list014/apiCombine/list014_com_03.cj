// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.insert(0,6)).appendAll([7,8])
    
	if (b == [6,1,2,3,4,7,8]){
        return 0
    }
	return 1
}