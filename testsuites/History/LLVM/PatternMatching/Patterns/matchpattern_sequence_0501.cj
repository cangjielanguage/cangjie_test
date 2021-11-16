// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if ( case02() != "yes" ) {
        return 1
    }
    if ( case03() != "yes" ) {
        return 1
    }
    if ( case04() != "yes" ) {
        return 1
    }
    if ( case05() != "yes" ) {
        return 1
    }
   return 0
}

func case01(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case [...] => "yes"
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case [[1,2,3],_,_] => "yes"
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case [[1,...,3],...,[a,...]] => "yes"
        case [...] => "default case"
    }
    r1
}

func case04(){
    let a0 = [1,2,3]
    let a1 = [a0,a0,a0]
    let a = [a1,a1,a1]
    var r1: String = match (a) {
        case [] => "empty"
        case [[[1,2,...],[_,a,b],[...]],...,[c,...]] => "yes"
        case [...] => "default case"
    }
    r1
}

func case05(){
    let a0 = [1,2,3]
    let a1 = [a0,a0,a0]
    let a = [a1,a1,a1]
    var r1: String = match (a) {
        case [] => "empty"
        case [[[1,2,3],[_,a,b],c],...,d] => "yes"
        case [...] => "default case"
    }
    r1
}