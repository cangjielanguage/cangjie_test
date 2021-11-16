// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.remove(2)).get(2)
    
	let c = match(b){
		case Some(x) => x
		case $None => 0
	}
	if (c==4){
        return 0
    }
	return 1
    
}