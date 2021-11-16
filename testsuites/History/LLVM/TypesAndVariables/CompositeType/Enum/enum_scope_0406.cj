// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

interface I {
    let a: TimeUnit = TimeUnit.Day
}

class test <: I {
    var time = I.a
}

func main(): Int64 {
    var time1 = test().time

    var res: Int32 = match time1 {
        case $Day => 2
    }

    if ( res == 2 ) {
        return 0
    } else {
        return 1
    }
}
