// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case02() != "empty" ) {
        return 2
    }
    if ( case04() != "empty" ) {
        return 4
    }
    return 0
}

//B053不支持无类型声明的空的array
//func case01(){
//    let a = @{}
//    var r1: String = match (a) {
//        case [] => "empty"
//        case [...] => "default case"
//    }
//    r1
//}

func case02(){
    let a: Array<Int32> = @{}
    var r1: String = match (a) {
        case [] => "empty"
        case [...] => "default case"
    }
    r1
}

//B053不支持无类型声明的空的List
//func case03(){
//    let a = []
//    var r1: String = match (a) {
//        case [] => "empty"
//        case [...] => "default case"
//    }
//    r1
//}

func case04(){
    let a:List<Int32> = []
    var r1: String = match (a) {
        case [] => "empty"
        case [...] => "default case"
    }
    r1
}

