// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 5 ) {
        return 1
    }
    if ( case02() != 5 ) {
        return 2
    }
    if ( case03() != 5 ) {
        return 3
    }
    return 0
}


func case01(){
    var a:Coo = Coo()
    var m:Int32 = 1
    return {x:()->Int32=> a.a = x() + 2;m = 2;var res = a.a+m;res}({1})
}

func case02(){
    let b:Coo = Coo()
    var m:Int32 = 1
    return {x:()->Int32=>b.a = x() + 2;m = 2;var res = b.a+m;res}({1})
}

func case03(){
    var c:Roo = Roo()
    var m:Int32 = 1
    return {x:()->Int32=>c.a = x() + 2;m = 2;var res = c.a+m;res}({1})
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}