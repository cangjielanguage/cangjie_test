// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
       One(TimeUnit2) | Day(Int32)
}

enum TimeUnit2 {
       Two(TimeUnit1) | Day
}


func main(): Int64 {
    var time = TimeUnit1.One(Two(Day(3)))
    var res: Int32 = match (time) {
        case One(Two(Day(x))) =>  x+2
        case Day(x) => x*2
        case _ => 5
    }

    if (res == 5) {
        return 0
    }
    return 1

}
