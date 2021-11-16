// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    let i : Set<Int32> = #{60, 70, 80, 90, 100}
    let j : Int32 = 60
    var a : Int64 = match (j) {
        case in $i if (false) => 2
        case in $i if (true) => 1
        case _ => 0

    }
    return (a-1)
}
