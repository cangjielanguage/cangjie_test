// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var res: Int32 = 0
var b: Int32 = 1
var c = if(true){
    let a: Int32 = 1
    func goo2(){
        var a = {var x = a;return x}
        return a
    }
    func goo3(){
        var a = {return a}
        return a
    }
    func goo4(){
        var a = { a ; return Int32(1)}
        return a
    }
    func goo5(){
        var a = { a }
        return a
    }
    func goo7(){
        var a = { b }
        return a
    }
    res = goo2()() + goo3()() + goo4()() + goo5()() + goo7()()
}

func main():Int64 {
    if ( res != 5 ){
        return 1
    }
    return 0
}
