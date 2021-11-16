// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var res: Int32 = 0
open class Boo{
    static var a: Int32 = 1
    var b: Int32 = 1
}

class Aoo <: Boo{
    init(y:Char,x!:Int32=a){
        m = a
        m = this.b
        var l = a
        var k = this.b
        b = a+1
    }
    init(y:Int64,x!:Int32=a){
        m = a
        m = this.b
        b = a + 2
    }
    Aoo(y:String,x!:Int32=a,var m!:Int32 = a){
        var l = a
        var k = this.b
        b = a + 3
    }
}

func main():Int64 {
    var a = Aoo('a')
    if ( a.b != 2 ){
        return 1
    }
    var b = Aoo(1)
    if ( b.b != 3 ){
        return 1
    }
    var c = Aoo("a")
    if ( c.b != 4 ){
        return 1
    }
    return 0
}
