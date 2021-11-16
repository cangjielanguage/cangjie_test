// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func case10(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var r1 = { var s = a.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r2 = { var s = a.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r3 = { var s = b.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r4 = { var s = b.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r5 = { var s = m ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r6 = { var s = a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var r7 = { var s = b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
}

func case11(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    func foo(x:()->Int32){return x}
    var r1 = foo({ var s = a.a ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r2 = foo({ var s = a.b ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r3 = foo({ var s = b.a ; s}) /// EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r4 = foo({ var s = b.b ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r5 = foo({ var s = m ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r6 = foo({ var s = a ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var r7 = foo({ var s = b ; s}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
}

func case01(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = a.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case02(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = a.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case03(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = b.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case04(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = b.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case05(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = m ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case06(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    return { var s = a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case07(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case11(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = a.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case12(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = a.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case13(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = b.a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case14(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = b.b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case15(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = m ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case16(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = a ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

func case17(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    { var s = b ; s} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a return value
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}