// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    return 0
}

func case01(){
    let a = 50
    var r1: String = match (a) {
        case in [60,70,80] => "pass"
        case !in [60,70,80] => "yes"
        case _ => "default"
    }
    r1
}

