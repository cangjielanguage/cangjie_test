// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a:Array<Int64> = Array<Int64>([match(1){case _ =>0}, match(1){case _ =>1}, match(1){case _ =>2}])
    if ( a[1] != 1){
        return 1
    }
    return 0
}
