// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var b = Boo(1)

    if ( b.m.y != 4 ) {
        return 1
    }
    if ( b.n.y != 8 ) {
        return 2
    }
    b.m = Boo(1)
    if ( b.m.y != 6 ) {
        return 3
    }
    if ( b.n.y != 12 ) {
        return 4
    }

    return 0
}

open class Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    var y: Int32 = 0
    init(x:Int32){
         y = x
    }
    open prop var m:Boo {
        get(){
             return Boo( this.a + b + c + d )
        }
        set(input){ // Boo->Unit
             a = input.a + 1
             c = input.a + 1
        }
    }

    open prop let n:Boo {
        get(){
             return Boo( (a + this.b + c + d)*2 )
        }
    }
}
