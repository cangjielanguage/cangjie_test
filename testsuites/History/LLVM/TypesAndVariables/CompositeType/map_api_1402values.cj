// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map01:Map<Int64,Int64> = #{1:2,2:3,4:5,5:2,1:5}
    for (i in map01.values()){
        print("${i}")
    }
    0
}
