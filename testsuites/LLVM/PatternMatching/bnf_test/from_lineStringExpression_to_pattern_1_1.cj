// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = """
match(1){case _ =>2},match(1){case _ =>3}"""
    if( a != "${match(1){case _ =>a}}"){
        return 1
    }

    return 0
}
