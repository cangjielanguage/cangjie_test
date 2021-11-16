// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a:Array<Int64> = Array<Int64>([0,1,2])
    var c = if ( a[match(1){case _ =>1}] != 1){
        10
    }else{ 20 }
    if ( c != 20) {
        return 1
    }
    return 0
}
