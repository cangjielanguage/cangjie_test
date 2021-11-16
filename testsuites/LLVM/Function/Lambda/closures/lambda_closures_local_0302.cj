// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func case01(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = a.a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = a.a ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = a.a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case02(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = a.b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = a.b ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = a.b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case03(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = b.a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = b.a ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = b.a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case04(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = b.b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = b.b ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = b.b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case05(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = m ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = m ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = m ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case06(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = a ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = a ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

func case07(){
    var a:Coo = Coo()
    var b:Roo = Roo()
    var m:Int32 = 1
    var goo = { { var s = b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    func foo(x:()->Int32){return x}
    var res = foo({ { var s = b ; s}() }) // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a param
    return { { var s = b ; s}() } // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be used as a return value
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
}