// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}


func case01(){
    var a:Coo = Coo()
    var m:Int32 = 1
    return {x:()->Int32=> a.b = x() + 2;m = 2;var res = a.b+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case0101(){
    var a:Coo = Coo()
    let m:Int32 = 1 // let
    return {x:()->Int32=> a.a = x() + 2;m = 2;var res = a.a+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}


func case02(){
    let b:Coo = Coo()
    var m:Int32 = 1
    return {x:()->Int32=>b.b = x() + 2;m = 2;var res = b.b+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case03(){
    var c:Roo = Roo()
    var m:Int32 = 1
    return {x:()->Int32=>c.b = x() + 2;m = 2;var res = c.b+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case04(){
    let c:Roo = Roo()
    var m:Int32 = 1
    return {x:()->Int32=>c.b = x() + 2;m = 2;var res = c.b+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

func case05(){
    let c:Roo = Roo()
    var m:Int32 = 1
    return {x:()->Int32=>c.a = x() + 2;m = 2;var res = c.a+m;res}({1}) // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}