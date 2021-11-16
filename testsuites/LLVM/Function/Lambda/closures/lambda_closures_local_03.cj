// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case02()() != 7 ) {
        return 1
    }
    if ( case03()() != 7 ) {
        return 1
    }
    if ( case04()() != 7 ) {
        return 1
    }
    if ( case05()() != 7 ) {
        return 1
    }
    return 0
}

func case02(){
    let a:Coo = Coo()
    let b:Roo = Roo()
    let m:Int32 = 1
    var res = { var s = a.a + a.b + b.a + b.b + m ; s}
    return res
}

func case03(){
    let a:Coo = Coo()
    let b:Roo = Roo()
    let m:Int32 = 1
    return {var s = a.a + a.b + b.a + b.b + m ; s}
}

func case04(){
    let a:Coo = Coo()
    let b:Roo = Roo()
    let m:Int32 = 1
    func case05(x:()->Int32){return x}
    return case05({var s = a.a + a.b + b.a + b.b + m ; s})
}

func case05(){
    let a:Coo = Coo()
    let b:Roo = Roo()
    let m:Int32 = 1
    {var s = a.a + a.b + b.a + b.b + m ; s}
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    var b: Int32 = 2
}
