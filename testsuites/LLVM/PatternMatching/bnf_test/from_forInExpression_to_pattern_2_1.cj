// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res = ""
    for ( i in (match(1){case _=> 0..2:1}) ){
        res = res + "${i}"
    }
    if ( res != "01" ){
        return 1
    }
    return 0

}