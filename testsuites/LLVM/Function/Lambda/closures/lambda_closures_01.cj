// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = case01()({1})
var a2 = case02()({1})

func main():Int64 {
    if ( a1 != 1 ) {
        return 1
    }
    if ( a2 != 2 ) {
        return 1
    }
    return 0
}

func case01(){
    var a: Int32 = 1
    var foo01 = {x:()->Int32=>return x()}
    return foo01
}

func case02(){
    let a: Int32 = 1
    var foo02 = {x:()->Int32=>return x() + a}
    return foo02
}
