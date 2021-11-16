// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a = Coo(3,"s",3,"s") // EXPECTED: regex ambiguous match for constructor call 'Coo'
    return 0
}

class Coo{
    var a:Int64 = 1
    Coo(
        a:Int64,
        b:String,
        var c:Int32,
        var d:String,
        var e!:Char = 'a',
        var f!:Int64 = a,
        var g!:Int64 = 1,
        var h!:Int64 = 1
    ){}
    init(
        a:Int64,
        b:String,
        c:Int32,
        d:String
    ){
        this.a = 2 ; // a is a in Coo()
        this.c = 2 ;
        this.d = "b" ;
        e = 'b' // e is suger of this.e,e is e in Coo()
        this.f = a; // a is a in init()
        this.g = a;
        this.h = a
    }
}
