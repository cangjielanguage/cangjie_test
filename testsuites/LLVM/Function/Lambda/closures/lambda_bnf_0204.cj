// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var r1 = Coo()
    if ( r1.a3 != 8 ) {
        return 1
    }
    var r2 = Coo(1)
    if ( r2.a3 != 4 ) {
        return 2
    }
    if ( r2.a5 != 5) {
        return 3
    }
    return 0
}

open class Boo{
    static var s1:Int32 = 1
    var s2:Int64 = 1
}

class Coo <: Boo {
    var  a0 = 0
    static var a1 = 1
    var a3: Int32
    let a4  = 2
    let a5: Int32

    // s1 is not super.s1,s1 is a static variable
    init(y:Int32,x!:(Int32)->Int32={x:Int32=> x + 1 + Int32(a1) + super.s1 }){ // EXPECTED: regex error.*?object cannot access static member 's1'
        a3 = x(1)
        a5 = x(2)
    }

    // s2 is super.s2,but cannot visit s2
    init(y:Int32,z:Int32,x!:(Int32)->Int32={x:Int32=> x + 1 + Int32(a1) + Int32(super.s2) }){ // EXPECTED: regex error.*?'super' is not allowed to be used in default parameter value of the constructor
        a3 = x(1)
        a5 = x(2)
    }

    init(x!:(Int32)->Int32={x:Int32=> x + 1 + Int32(a1) + Int32(this.a0) }){ // EXPECTED: regex error.*?'this' is not allowed to be used in default parameter value of the constructor
        a3 = x(1)
        a5 = x(2)
    }

    init(y:Char,x!:(Int64)->Int64={x:Int64=> x + 1 + Int64(a1) + Int64(a0) }){ // EXPECTED: regex error.*?'a0' is not allowed to be used in default parameter value of the constructor
        a3 = x(1)
        a5 = x(2)
    }
}