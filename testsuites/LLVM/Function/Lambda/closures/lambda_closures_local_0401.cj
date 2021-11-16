// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var m:Int32 = 1
func case01(){
    var a:Coo = Coo()
    { var res = a.b + m ; res }() // EXPECTED: regex warning.*?the variable 'm' actually captures this decl
    var m:Int32 = 2
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}
