// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c:List<Int64> = [match(1){case _ =>1},match(1){case _ =>2}]
    var b:Int64 = 0
    for ( i in 0..2:1){
        if ( i == 1){
            b  = c[i]
        }
    }

    if ( b != 2) {
        return 1
    }
    return 0
}
