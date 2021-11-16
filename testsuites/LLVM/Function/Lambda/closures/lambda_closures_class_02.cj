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

    init(y:Int32){
        var z = {x:Int32=> x + 1 + s1} // EXPECTED: regex-not error
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Int64){ // auto insert super()
        var z = {x:Int32=> x + 1 + Int32(super.s2) }  // EXPECTED: regex-not error
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Unit){
        var z = {x:Int32=> x + 1 + Int32(a1) } // EXPECTED: regex-not error
        a3 = z(1)
        a5 = z(2)
    }

    init(y:UInt32){
        this('a')
        var z = {x:Int32=> x + 1 + Int32(this.a0) } // EXPECTED: regex-not error
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Float32){
        var z = {x:Int32=> x + 1 + Int32(Coo.a1) } // EXPECTED: regex-not error
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Char){
        var z = {x:Int32=> x + 1 + Int32(this.a0) }  // EXPECTED: regex error.*?'a0' is not allowed to be accessed before all member variables are initialized
        a3 = z(1)
        a5 = z(2)
    }

    init(y:String){
        var z = {x:Int32=> x + 1  + Int32(a0) }  // EXPECTED: regex error.*?'a0' is not allowed to be accessed before all member variables are initialized
        a3 = z(1)
        a5 = z(2)
    }
}