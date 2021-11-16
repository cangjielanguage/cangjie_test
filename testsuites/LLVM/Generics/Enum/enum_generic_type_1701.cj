// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Hour
}

class Foo<T> {
    var hour: TimeUnit<T>
    init(){
        hour = TimeUnit<T>.Hour
    }
    func f(x: TimeUnit<T>): TimeUnit<T>{
        return x
    }
}

func run(): Int64 {
    var foo: Foo<Int32> = Foo<Int32>()
    var time1 = foo.hour
    var time2 = foo.f(TimeUnit<Int32>.Hour)
    var res1: Int32 = match (time1) {
        case $Hour => 11
    }
    var res2: Int32 = match (time2) {
        case $Hour => 12
    }

    if ( res1 == 11 && res2 == 12) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
