// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = [1,2,3,4]
    var b = (a.set(0,6)).get(0)
    let c = match(b){
		case Some(x) => x
		case $None => 0
	}
	if (c==6){
        return 0
    }
	return 1
}