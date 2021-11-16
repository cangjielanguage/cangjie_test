// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01()({1}) != 2 ) {
        return 1
    }
    if ( case02()({1}) != 4 ) {
        return 1
    }
    if ( case03()({1}) != 2 ) {
        return 1
    }
    return 0
}

var a:Int32 = 1
var foo01 = {x:()->Int32=>return x() + a}
func case01(){
    var a: Int32 = 2
    return foo01
}

func case02(){
    let a: Int32 = 3
    return {x:()->Int32=>return x() + a}
}

func case03(){
    var foo01 = {x:()->Int32=>return x() + a}
    return foo01
}