// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append TimeUnit with Num {
    func plus(a: TimeUnit, b: TimeUnit):Int32 {
        var resa: Int32 = match (a) {
            case Year(x) => x
        }
        var resb: Int32 = match (b) {
            case Year(x) => x
        }
        return resa+resb 
    }
}

enum TimeUnit { Year(Int32) }


func run(): Int64 {
    var a:TimeUnit = Year(2020)
    var b:TimeUnit = Year(2021)
    var x:Int32 = plus(a,b)
    if (x == 4041) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}
