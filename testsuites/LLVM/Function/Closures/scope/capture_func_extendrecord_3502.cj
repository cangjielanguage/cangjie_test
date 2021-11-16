// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Aoo()

    if ( a.loo1()(2) != 2){
        return 1
    }
    if ( a.loo2()() != 2){
        return 2
    }
    if ( a.loo3()() != 2){
        return 3
    }
    if ( a.loo4()() != 2){
        return 4
    }
    if ( a.loo5()() != 2){
        return 5
    }

    if ( a.noo1()(2) != 2){
        return 1
    }
    if ( a.noo2()() != 2){
        return 2
    }
    if ( a.noo3()() != 2){
        return 3
    }
    if ( a.noo4()() != 2){
        return 4
    }
    if ( a.noo5()() != 2){
        return 5
    }

    return 0
}

record Aoo{
    static var b: Int32 = 2
}
extend Aoo{
    func koo1(x!:Int32=b){return x}
    func koo2(){var x = b;return x}
    func koo3(){return b}
    func koo4(){ b ; return 2}
    func koo5(){ b }

    static func moo1(x!:Int32=b){return x}
    static func moo2(){var x = b;return x}
    static func moo3(){return b}
    static func moo4(){ b ; return 2}
    static func moo5(){ b }

    func loo1(){
        var a = koo1
        return a
    }
    func loo2(){
        var a = koo2
        return a
    }
    func loo3(){
        var a = koo3
        return a
    }
    func loo4(){
        var a = koo4
        return a
    }
    func loo5(){
        var a = koo5
        return a
    }

    func noo1(){
        var a = moo1
        return a
    }
    func noo2(){
        var a = moo2
        return a
    }
    func noo3(){
        var a = moo3
        return a
    }
    func noo4(){
        var a = moo4
        return a
    }
    func noo5(){
        var a = moo5
        return a
    }

}
