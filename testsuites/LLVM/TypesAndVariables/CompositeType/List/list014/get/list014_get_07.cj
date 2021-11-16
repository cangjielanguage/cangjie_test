// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(){
        var a = [[1,2],[3]]
        let getN = a.get(1)
        let b = match(getN){
                case Some(x) => x
                case $None => [0]
        }
        if (b==[3]){
                return 0
        }
        return 1
}