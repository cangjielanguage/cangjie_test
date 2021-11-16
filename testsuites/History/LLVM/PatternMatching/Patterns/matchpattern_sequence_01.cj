// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "the lowest score is 50" ) {
        return 1
    }
    if ( case02() != "the highest score is 90" ) {
        return 1
    }
    return 0
}

func case01(){
    let a = @{50,70,90}
    var r1: String = match (a) {
        case [] => "empty"
        case [50, ...] => "the lowest score is 50"
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [..., 90] => "the highest score is 90"
        case [...] => "default case"
    }
    r1
}