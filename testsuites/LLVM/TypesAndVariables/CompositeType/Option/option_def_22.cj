// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time {
    Some(String)
}

var time = Time.Some("Enum")
var opt: Option<Int32> = Option<Int32>.Some(20)

func run(): Int64 {
    var res1: Int32 = match (opt) {
        case Some(x) => x
        case $None => 0
    }
    var res2: String = match (time) {
        case Some(x) => x
    }
    if (res1 == 20 && res2 == "Enum"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

