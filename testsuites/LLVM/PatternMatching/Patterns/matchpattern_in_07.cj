// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if ( case01() != 0){
        return 1
    }
    if ( case03() != 0){
        return 1
    }
    if ( case02() != 0){
        return 1
    }
    return 0
}

func case01(){
    let a = 5
    var r = match (a) {
        case !in  0..10 => 1
        case in  0..10:2 => 2
        case in  0..=10:1 => 0
        case _ => 3
    }
    return r
}

func case03(){
    let a = 5
    let b1 = 0..10
    let b2 = 0..10:2
    let b3 = 0..=10:1
    var r = match (a) {
        case !in  $b1 => 1
        case in  $b2 => 2
        case in  $b3 => 0
        case _ => 3
    }
    return r
}

func case02(){
    for (i in 0..10:2) {
        if( i == 4 ){
            return 0
        }
    }
    return 1
}