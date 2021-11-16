// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (foo1() != 0) {return 1}
    return 0
}

enum TimeUnit1 { Year(Int32) | Day(TimeUnit1)}
enum TimeUnit1_2 { Year(Int64) | Day(TimeUnit1_2)}

func foo1(){
    var m:Int64 = 1
    var b = Day(Year(m))
    var n:Int32 = 1
    var c = Day(Year(n))
    var a = match (b) {
        case Day(Year(y)) => 0
        case _ => 2
    }
    a
}


func foo2(){
    var m:Int32 = 1
    var b = Day(Year(m))
    var n:Int32 = 1
    var c = Day(Year(n))
    var a = match (b) {
        case Day(Year(y)) => 0
        case _ => 2
    }
    a
}


