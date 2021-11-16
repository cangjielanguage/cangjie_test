// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1<T> {
       One(TimeUnit2<T>) | Day(T)
}

enum TimeUnit2<T> {
       Two(TimeUnit1<T>) | Day
}


func main(): Int64 {
    var time = TimeUnit1<Int32>.One(Two<Int32>(Day<Int32>(3)))
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
