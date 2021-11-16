// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case02() != 7 ) {
        return 1
    }
    if ( case03() != 7 ) {
        return 1
    }
    return 0
}

func case02(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = a.a + a.b + b.a + b.b + m ;var s1 = a; var s2 = b; s}()
}

func case03(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = a.a + a.b + b.a + b.b + m ;var s1 = a; var s2 = b; s}()
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    var b: Int32 = 2
}
