// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func sourceFile(){}
func sourceLine(){}

func main(){
    var a : Unit = sourceFile()
    var b : Unit = sourceLine()
    return 0
}