// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
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

    init(y:Int32,z!:(Int32)->Int32 = {x:Int32 => x + 1 + s1}){
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Int64,z!:(Int32)->Int32 = {x:Int32=> x + 1 + Int32(super.s2)}){
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Unit,z!:(Int32)->Int32 = {x:Int32=> x + 1 + Int32(a1) }){
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Float32,z!:(Int32)->Int32  = {x:Int32=> x + 1 + Int32(Coo.a1)}){
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Char,z!:(Int32)->Int32 = {x:Int32=> x + 1 + Int32(this.a0)} ){// EXPECTED: regex error.*?'this' is not allowed to be used in default parameter value of the constructor
        a3 = z(1)
        a5 = z(2)
    }

    init(y:String,z!:(Int32)->Int32= {x:Int32=> x + 1  + Int32(a0) } ){// EXPECTED: regex error.*?'a0' is not allowed to be used in default parameter value of the constructor
        a3 = z(1)
        a5 = z(2)
    }
}