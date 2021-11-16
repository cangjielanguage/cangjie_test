// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}


func case01(){
    var a:Coo = Coo()
    var m:Int32 = 1
    { var res = a.b + m + n; res }() // EXPECTED: regex error.*?undeclared identifier 'n'
    var n:Int32 = 1
}

func case02(){
    var a:Coo = Coo()
    var m:Int32
    { var res = a.b + m ; res }() // EXPECTED: regex error.*?variable 'm' is used before initialization
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}