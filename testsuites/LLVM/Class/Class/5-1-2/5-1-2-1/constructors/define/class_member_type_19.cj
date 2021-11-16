// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

class Test {
    var time1: TimeUnit<Int32> = TimeUnit<Int32>.Day(1)
    var time2: TimeUnit<Int32>
    init(x: TimeUnit<Int32>){
        time2 = x
    }
    func f(x: TimeUnit<Int32>): TimeUnit<Int32>{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(TimeUnit<Int32>.Day(2))
    var time1: TimeUnit<Int32> = test.time1
    var time2: TimeUnit<Int32> = test.time2
    var time3: TimeUnit<Int32> = test.f(TimeUnit<Int32>.Day(4))
    var res1: Int32 = match (time1) {
       case Day(1) => 2
       case _ => 0
    }
    var res2: Int32 = match (time2) {
       case Day(2) => 4
       case _ => 0
    }
    var res3: Int32 = match (time3) {
       case Day(3) => 5
       case _ => 0
    }
    if (res1 == 2 && res2 == 4 && res3 == 0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}