// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a  = case01()
    var a1 = match (a) {
        case x:()->Unit => 0
        case _ => 1
    }
    if ( a1 != 0 ){
        return 1
    }
    let b = case02()
    var b1 = match (b) {
        case x:()->Unit => 2
        case x:()->()->Unit => 0
        case _ => 1
    }
    if ( b1 != 0 ){
        return 2
    }
    let c = case03()
    var c1 = match (c) {
        case x:()->Unit => 2
        case x:()->()->Unit => 3
        case x:()->()->()->Unit => 0
        case _ => 1
    }
    if ( c1 != 0 ){
        return 3
    }
    return 0
}

func case01(){
    var a = {}
    return (a)
}

func case02(){
    var a = {{}}
    return (a)
}

func case03(){
    var a = {{{}}}
    return (a)
}