// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
        var a:List<List<Int64>> = [[]]
        let getN = a.get(0)
        let b = match(getN){
                case Some(x) => x
                case $None => List<Int64>([])
        }

        let c = b.get(0)
        let d = match(c){
                case Some(x) => "${x}"
                case $None => "None"
        }
        if (d=="None"){
                return 0
        }
        return 1
}