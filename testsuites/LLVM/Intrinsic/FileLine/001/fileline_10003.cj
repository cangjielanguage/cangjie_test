// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    for (i in 1..100){
        if (sourceFile() != "fileline_10003.cj") {
            return 1
        }
        if (sourceLine() != 9) {
            return 2
        }
    }
    return 0
}