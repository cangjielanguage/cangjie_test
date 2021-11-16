// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan None
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(){
        var a:List<Int64> = []
        let getN = a.get(0)
        let b = match(getN){
                case Some(x) => "${x}"
                case $None => "None"
        }
        print("${b}")
        return 0
}