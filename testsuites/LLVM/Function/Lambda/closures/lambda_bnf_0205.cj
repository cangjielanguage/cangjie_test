// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var r1 = Coo().foo1()(2)
    if ( r1 != 5 ) {
        return 1
    }
    var r2 = Coo().foo2()(2)
    if ( r2 != 4 ) {
        return 1
    }
    return 0
}

open class Boo{
    var s: Int32 = 1
}

class Coo <: Boo {
    var  a0 = 0
    static var a1 = 1
    var a3: Int32

    init(){
        a3 = 1
    }
    func foo1(x!:(Int32)->Int32={x:Int32=>x + 1 + this.a3 + super.s}){
        return x
    }
    func foo2(){
        return {x:Int32=> x + 1 + super.s }
    }

}