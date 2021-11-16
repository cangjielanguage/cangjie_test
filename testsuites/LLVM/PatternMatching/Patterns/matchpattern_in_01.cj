// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if ( case02() != "yes" ) {
        return 1
    }
    return 0
}

func case01(){
    let score = [60,70,80]
    let a = 50
    var r1: String = match (a) {
        case in $score => "no"
        case !in $score => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let score = [50,70,80]
    let a = 50
    var r1: String = match (a) {
        case !in $score => "no"
        case in $score => "yes"
        case _ => "default"
    }
    r1
}
