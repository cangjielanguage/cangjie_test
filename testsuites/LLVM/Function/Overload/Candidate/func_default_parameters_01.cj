// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo(3,"s",e:'s',g:3,f:3,h:1)
    return 0
}

class Coo{
    var a:Int64 = 1
    Coo(
        a:Int64,
        b:String,
        var e!:Char = 'a',
        var f!:Int64 = a,
        var g!:Int64 = 1,
        var h!:Int64
    ){}
}
