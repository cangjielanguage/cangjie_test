// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1<T> {
       One(TimeUnit2<T>)
}

enum TimeUnit2<T> {
       Two(TimeUnit3<T>)
}

enum TimeUnit3<T> {
       Three(TimeUnit4<T>)
}

enum TimeUnit4<T> {
       Four(TimeUnit5<T>)
}

enum TimeUnit5<T> {
       Five
}

func run(): Int64 {
    var time = TimeUnit1<Int32>.One(Two(Three(Four(Five<Int32>))))
    var res: Int32 = match (time) {
        case One(Two(Three(Four(Five)))) =>  4
        case _ => 5
    }

    if (res == 4) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
