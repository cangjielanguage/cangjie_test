// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1 |compare %f

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
    let a = 50
    var r1: String = match (a) {
        case !in (40,50,60) => "no" // EXPECTED: regex unsupported type 'Tuple' for 'in pattern' in match case.
        case in (40,50,60) => "yes"
        case _ => "default"
    }
    r1
}

func case02(){
    let a = 90
    var r1: String = match (a) {
        case in (40,50,60) => "no" // EXPECTED: regex unsupported type 'Tuple' for 'in pattern' in match case.
        case !in (40,50,60) => "yes"
        case _ => "default"
    }
    r1
}
