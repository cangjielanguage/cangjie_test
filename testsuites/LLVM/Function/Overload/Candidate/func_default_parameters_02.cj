// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var b = Coo(3,e:'s',g:3,"s",f:3,h:1) // EXPECTED : regex positional argument cannot appeared after named argument
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
