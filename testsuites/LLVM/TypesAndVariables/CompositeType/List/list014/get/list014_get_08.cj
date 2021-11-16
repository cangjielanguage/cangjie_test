// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(){
        var getN = List<Int64>(100000,{i=>1}).get(100000-1)
        let b = match(getN){
                case Some(x) => x
                case $None => -1
        }
        if (b==1){
                return 0
        }
        return 1
}
