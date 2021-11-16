// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = """
abc"""
    if( a != "${var b = a;match(1){case _ =>b}}"){
        return 1
    }

    return 0
}
