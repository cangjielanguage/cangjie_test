// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
       One(TimeUnit2)
}

enum TimeUnit2 {
       Two(TimeUnit3)
}

enum TimeUnit3 {
       Three(TimeUnit4)
}

enum TimeUnit4 {
       Four(TimeUnit5)
}

enum TimeUnit5 {
       Five
}

func run(): Int64 {
    var time = TimeUnit1.One(Two(Three(Four(Five))))
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
