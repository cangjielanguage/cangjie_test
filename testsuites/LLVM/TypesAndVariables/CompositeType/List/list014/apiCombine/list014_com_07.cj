// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [5,4,3,2,1]
    var b = (a.slice(0..3)).sort()
    
	if (b==[3,4,5]){
        return 0
    }
	return 1
    
}