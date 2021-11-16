// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt -c pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %f pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import pkg.*

func main(){
    for(i in a){
    	print(i)
    }
    return 0
}
