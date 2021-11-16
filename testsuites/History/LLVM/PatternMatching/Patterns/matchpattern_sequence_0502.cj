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
   return 0
}

func case01(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case _ => "yes"
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case a => "yes"
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a0 = [1,2,3]
    let a = [a0,a0,a0]
    var r1: String = match (a) {
        case [] => "empty"
        case $a => "yes"
        case [...] => "default case"
    }
    r1
}

