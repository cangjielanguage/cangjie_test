// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Coo.b != 12 ) {
        return 1
    }
    if ( Coo().c != 12 ) {
        return 2
    }
    if ( Coo(1).c != 13 ) {
        return 2
    }
    if ( Coo(1).d != 12 ) {
        return 3
    }
    return 0
}

class Coo{
    static func foo(x:Int32){
        return 11
    }

    static func foo(x:Int64){
        return 12
    }
    func goo(x:Int32){
        return 11
    }

    func goo(x:Int64){
        return 12
    }
    var a:Int64 = 1
    static var b = foo(1)
    var c = foo(1)
    var d = 1
    //var e = goo(1)
    //var f = this.goo
    init(){}
    init(x:Int32){
        this()
        d = goo(1)
        c = foo(1)+1
    }
}
