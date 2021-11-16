// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a : String = sourceFile()
    var b : Int64 = sourceLine()
    return 0
}