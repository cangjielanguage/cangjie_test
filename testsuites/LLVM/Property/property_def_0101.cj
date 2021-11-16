// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var d = Doo()
    if ( d.m != 2 ) {
        return 9
    }
    if ( d.n != 1 ) {
        return 10
    }
    return 0
}

open class Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    open prop var m:Int32 {
        get(){
             return ( this.a + b + c + d )
        }
        set(input){
             a = input + 1
             c = input + 1
        }
    }

    open prop let n:Int32 {
        get(){
             return ( (a + this.b + c + d)*2 )
        }
    }
    open func foo():Int32{
        return 1
    }
}

class Doo <: Boo {
    override public prop var m:Int32 {
        get(){
             return this.foo()
        }
        set(input){
             a = input + 2
             c = input + 2

        }
    }
    override prop let n:Int32 {
        get(){
             return super.foo()
        }
    }
    override func foo():Int32{
        return 2
    }
}
