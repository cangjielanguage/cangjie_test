// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 

enum TimeUnit1 {
      Day(Int32)
      | OneUnit(TimeUnit1)

}
enum TimeUnit2 {
      Month(TimeUnit1)
}

func run(): Int64 {
    var time = TimeUnit2.Month(TimeUnit1.OneUnit(TimeUnit1.Day(5)))
    var res: Int32 = match (time) {
        case Month(Day(x)) => x
        case Month(OneUnit(a)) => match (a) {
            case Day(x) => x+10
            case OneUnit(b) => 20
        }
        case Month(OneUnit(Day(x))) => x+1

    }
    if ( res == 15) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
