// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.append(6)).appendAll([7,8])
    
	if (b == [1,2,3,4,6,7,8]){
        return 0
    }
	return 1
}