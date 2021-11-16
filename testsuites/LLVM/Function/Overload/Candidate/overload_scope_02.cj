// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a: Int64 = first()
    if ( a != 5 ) {
        return 1
    }
    return 0
}

func first(){
    func goo(x:B) {
        return 1
    }
    func goo(x:Int32){
        return 3
    }
    var x = A(1)
    var y = B(1)
    var z = 1
    func second(){
        func goo(x:A){
            return 2
        }
        func third(){
            var a = goo(y)
            if ( a == 2) {
                z++
            }
            var b = goo(1)
            if ( b == 3 ){
                z++
            }
        }
        third()
        var c = goo(y)
        if ( c == 2 ){
            z++
        }
    }
    second()
    var d = goo(y)
    if ( d == 1 ){
        z++
    }
    return z
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
}
