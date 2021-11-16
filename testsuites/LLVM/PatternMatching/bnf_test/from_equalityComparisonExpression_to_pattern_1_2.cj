// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c = (( (match(1){case _ =>1}) < (match(1){case _ =>2}) ) == ( (match(1){case _ =>1}) < (match(1){case _ =>2})) )
    if ( c != true ){
        return 1
    }
    return 0
}
