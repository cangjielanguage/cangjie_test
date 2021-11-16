// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(): Int64 {
    var a : Int64 = 10
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    b.add(0,1)
    if (b[0]==1){
        return 0
    }
    return 1
}
