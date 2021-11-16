// EXEC-PIPE-1: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

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
    var time = TimeUnit1<Int32>.One(.Two(.Three(.Four(.Five)))) // EXPECTED: regex parameters and arguments mismatch
    var res: Int32 = match (time) {
        case One(.Two(.Three(.Four(.Five)))) =>  4
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
