// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): String
}

append String with Num {
    func plus(a: String, b: String):String { return a+b }
}


func run(): Int64 {
    let x: String  = plus("abc","def")
    if ( x=="abcdef") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}