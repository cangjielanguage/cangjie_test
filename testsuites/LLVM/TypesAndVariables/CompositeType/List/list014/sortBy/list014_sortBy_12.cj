// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<List<Int64>> = [[9,10],[10,9]]
    var b = a.sortBy({i,j=>i.size()>j.size()})
    if (b==[[10,9],[9,10]]){
	    print("hshsh")
        return 0
    }
    return 1
}
