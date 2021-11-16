// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1 = Coo(Int32(1))
    var a2 = Coo(Int64(1))
    var a3 = Coo(())
    var a4 = Coo(UInt32(1))
    var a5 = Coo(Float32(1.0))
    if ( a1.a3 != 3 ){
        return 1
    }
    if ( a2.a3 != 3 ){
        return 2
    }
    if ( a3.a3 != 3 ){
        return 3
    }
    if ( a4.a3 != 2 ){
        return 4
    }
    if ( a5.a3 != 3 ){
        return 5
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
    var a4  = 2
    var a5: Int32

    init(y:Int32){
        var z = {x:Int32=> x + 1 + s1}
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Int64){ // auto insert super()
        var z = {x:Int32=> x + 1 + Int32(super.s2) }
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Unit){
        var z = {x:Int32=> x + 1 + Int32(a1) }
        a3 = z(1)
        a5 = z(2)
    }

    init(y:UInt32){
        this('a')
        var z = {x:Int32=> x + 1 + Int32(this.a0) }
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Char){
        var z = {x:Int32=> x + 1 + Int32(Coo.a1) }
        a3 = z(1)
        a5 = z(2)
    }

    init(y:Float32){
        var z = {x:Int32=> x + 1 + Int32(Coo.a1) }
        a3 = z(1)
        a5 = z(2)
    }
}
