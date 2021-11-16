// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.insertAll(0,[6,7])).append(8)
    
	if (b == [6,7,1,2,3,4,8]){
        return 0
    }
	return 1
}