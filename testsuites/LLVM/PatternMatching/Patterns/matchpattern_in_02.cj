// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if (case02() != "yes") {}
    return 0
}

func case01(){
    let a = 50
    var r1: String = match (a) {
        case !in 40..90:10 => "no"
        case in 40..90:10 => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let a = 50
    var r1: String = match (a) {
        case in 30..40:10 => "no"
        case !in 30..40:10 => "yes"
        case _ => "default"
    }
    r1
}