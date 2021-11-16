// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = (match(1){case _ =>0})..(match(1){case _ =>2}):(match(1){case _ =>1})
    var b = (match(1){case _ =>0})..=(match(1){case _ =>2}):(match(1){case _ =>1})
    var res:Int64 = 0
    var resb:Int64 = 0
    for ( i in a){
        res += i
    }
    for ( i in b){
        resb += i
    }
    if ( res != 1 ){
        return 1
    }
    if ( resb != 3 ){
        return 1
    }
    return 0
}