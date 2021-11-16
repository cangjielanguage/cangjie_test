// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt  %f src/pkgs/pkgs.cj -o %output
// EXEC: %run %run_opt %output %run_args

package pkgs

enum TimeUnit1<T> {
      Hour(T)
}

func run(): Int64 {
    var time1 = TimeUnit1.Hour(1)
    var res1 = match (time1) {
        case Hour(x) => x
    }
    var time2 = TimeUnit1.Hour(2)
    var res2 = match (time2) {
        case Hour(x) => x
    }
    var res = res1 + res2
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
