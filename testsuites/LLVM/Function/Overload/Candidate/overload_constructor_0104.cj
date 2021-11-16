// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo(3,"s",3,"s",'s') // init1()
    if ( a.g != 3 ) {  return 1 }
    var b = Coo(3,"s",3,"s",e:'s',f:3,h:1) // Coo()
    if ( b.g != 1 ) {  return 1 }
    var c = Coo(3,"s",3,"s",e:'s',g:2,f:3,h:1) // Coo()
    if ( c.g != 2 ) {  return 1 }
    var d = Coo(3,"s",3,"s",1) // init2()
    if ( d.g != 3 ) {  return 1 }
    var e = Coo(3,"s",3,"s",h:1)  // Coo()
    if ( e.g != 1 ) {  return 1 }
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
        var h!:Int64
    ){}
    init(
        a:Int64,
        b:String,
        c:Int32,
        d:String,
        g:Char
    ){
        this.a = 2 ; // a is a in Coo()
        this.c = 2 ;
        this.d = "b" ;
        e = 'b' // e is suger of this.e,e is e in Coo()
        this.f = a; // a is a in init()
        this.g = a;
        this.h = a
    }
    init(
        a:Int64,
        b:String,
        c:Int32,
        d:String,
        h:Int64
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
