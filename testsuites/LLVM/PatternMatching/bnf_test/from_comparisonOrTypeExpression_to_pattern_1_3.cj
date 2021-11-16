// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c = (( (match(1){case _ =>1}) is Int64 ) == ( (match(1){case _ =>2}) is Char)) // true == false
    if ( c != false ){
        return 1
    }
    return 0
}
