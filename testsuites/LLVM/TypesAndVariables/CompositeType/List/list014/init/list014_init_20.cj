// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a:List<Int64> = [1,2,3]
    var b:List<Char> = ['1','2','3']
    var c:List<String> = ["1","2","3"]
    print("${a}\n")
    print("${b}\n")
    print("${c}\n")
    return 0
}