// Eer %cmp_opt  %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 

enum TimeUnit1 {
      Hour
      | Day(Int32)
      | OneUnit(TimeUnit1)

}
enum TimeUnit2 {
      Month(TimeUnit1)
}

func run(): Int32 {
    var time1 = TimeUnit2.Month(TimeUnit1.Day(5))
    var res1: Int32 = match time1 {
        case Month(Hour) => 0
        case Month(Day(x)) => x
        case Month(OneUnit(Hour)) => 1
        case Month(OneUnit(Day(x))) => x+1
        case Month(OneUnit(a)) => match a {
            case $�ur => 10
            case Day(x) => x+10
            case OneUnit(b) => 20
        }

    }
    var time2 = TimeUnit2.Month(TimeUnit1.OneUnit(TimeUnit1.OneUnit(Hour)))
    var res2: Int32 = match time2 {
        case Month(Hour) => 0
        case Month(Day(x)) => x
        case Month(OneUnit(Hour)) => 1
        case Month(OneUnit(Day(x))) => x+1
        case Month(OneUnit(a)) => match a {
            case $Hour => 10
            case Day(x) => x+10
            case OneUnit(b) => 20
        }

    }
    var res: Int32 = res1 + res2
    if (  res == 26 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int32 {
    return run()
}
