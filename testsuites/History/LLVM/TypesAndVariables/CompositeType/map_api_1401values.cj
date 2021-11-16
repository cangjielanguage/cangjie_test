// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map01:Map<Int64,Int64> = #{}
    var list_values1 = map01.values()
    var list_values:List<Int64> = []
    for (i in map01.values()){
            print("${i}\n")
    }
    if (list_values1 != list_values){
        return 1
    }
    return 0
}
