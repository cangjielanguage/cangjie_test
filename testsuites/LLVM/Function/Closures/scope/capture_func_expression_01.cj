// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var b: Int32 = 1
var c = if(true){
    var a: Int32 = 1
    func foo1(x!:Int32=a){return x}
    func foo2(){var x = a;return x}
    func foo3(){return a}
    func foo4(){ a ; return Int32(1)}
    func foo5(){ a }

    func foo6(x!:Int32=b){return x}
    func foo7(){ b }

    func goo1(){
        var a = foo1 // EXPECTED: regex error.*?foo1 captured a mutable variable directly, foo1 cannot be assigned to a variable
        return a
    }
    func goo2(){
        var a = foo2 // EXPECTED: regex error.*?foo2 captured a mutable variable directly, foo2 cannot be assigned to a variable
        return a
    }
    func goo3(){
        var a = foo3 // EXPECTED: regex error.*?foo3 captured a mutable variable directly, foo3 cannot be assigned to a variable
        return a
    }
    func goo4(){
        var a = foo4 // EXPECTED: regex error.*?foo4 captured a mutable variable directly, foo4 cannot be assigned to a variable
        return a
    }
    func goo5(){
        var a = foo5 // EXPECTED: regex error.*?foo5 captured a mutable variable directly, foo5 cannot be assigned to a variable
        return a
    }
    func goo6(){
        var a = foo6 // EXPECTED: regex-not error
        return a
    }
    func goo7(){
        var a = foo7 // EXPECTED: regex-not error
        return a
    }
}
