// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [-2,2,1,-1]
    var b = (a.sortBy({i,j=>i>j})).isEmpty()
    
	if (b==false){
        return 0
    }
	return 1
    
}