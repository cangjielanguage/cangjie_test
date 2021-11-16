// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "the lowest score is 50" ) {
        return 1
    }
    if ( case02() != "the highest score is 90" ) {
        return 2
    }
    if ( case03() != "the lowest score is 50, the highest score is 90" ) {
        return 3
    }
    if ( case04() != "default case" ) {
        return 4
    }
    if ( case05() != "yes" ) {
        return 5
    }
    if ( case06() != "yes" ) {
        return 6
    }
    if ( case07() != "yes" ) {
        return 7
    }
    return 0
}

func case01(){
    let a = @{50,70,90}
    var r1: String = match (a) {
        case [50, ...] => "the lowest score is 50"
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [..., 90] => "the highest score is 90"
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [low, ..., high] => "the lowest score is ${low}, the highest score is ${high}"
        case [...] => "default case"
    }
    r1
}

func case04(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [...] => "default case"
    }
    r1
}


func case05(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [...] => "yes"
        case [...] => "default case"
    }
    r1
}

func case06(){
    let a = [10,30,50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [10,...,50,70,90] => "yes"
        case [...] => "default case"
    }
    r1
}


func case07(){
    let a = [10,30,50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [10,30,50,70,...] => "yes"
        case [...] => "default case"
    }
    r1
}