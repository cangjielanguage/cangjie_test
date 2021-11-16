// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo(3,"s",3,"s") // Coo()
    if ( a.a != 1 ) { return 1 }
    var b = Boo(3,"s",3,"s") // Boo()
    if ( a.a != 1 ) { return 1 }
    if ( foo1(1).a != 1 ) {
        return 1
    }
    if ( foo2(1).a != 1 ) {
        return 3
    }
    if ( foo2(Int32(1)).a != 1 ) {
        return 4
    }
    if ( foo2(x:1).a != 2 ) {
        return 5
    }
    if ( foo2().a != 2 ) {
        return 5
    }
    if ( foo3(x:1).a != 1 ) {
        return 6
    }
    if ( foo3(x:Int32(1)).a != 2 ) {
        return 7
    }
    if ( foo4(Int32(1),Int64(1)).a != 1 ) {
        return 8
    }
    if ( foo4(1,1).a != 3 ) {
        return 9
    }
   if ( foo5(1,1).a != 2 ) {
        return 10
    }
    return 0
}

class Coo{
    var a:Int64 = 1
    Coo(
        a:Int64,
        b:String,
        var c:Int64,
        var d:String
    ){}
    init(
        a:Int64,
        b:String,
        c:Int32,
        d:String
    ){
        this.a = a ; // this.a is a in Coo(),a is a in init()
        this.c = 2 ;
        this.d = "b" ;
    }
}

class Boo{
    var a:Int64 = 1
    Boo(
        a:Int64,
        b:String,
        c:Int64,
        d:String
    ){}
    init(
        a:Int64,
        b:String,
        c:Int32,
        d:String
    ){
        this.a = a ; // this.a is a in Coo(),a is a in init()
    }
}

class foo1{
    var a: Int64 = 1
    var b: Int32 = 1
    foo1(x:Int64){
        a = Int64(1)
    }
    init(x:Int32){
        b = Int32(2)
    }
}

class foo2{
    var a: Int64 = 1
    var b: Int32 = 1
    foo2(x:Int32){
        a = 1
    }
    init(x!:Int64=1){
        a = 2
    }
}

class foo3{
    var a: Int64 = 1
    var b: Int32 = 1
    foo3(x!:Int64=1){
        a = 1
    }
    init(x!:Int32=1){
        a = 2
    }
}

class foo4{
    var a: Int64 = 1
    var b: Int32 = 1
    foo4(x:Int32,y:Int64){
        a = 1
    }
    init(x:Int64,y:Int32){
        a = 2
    }
    init(x:Int64,y:Int64){
        a = 3
    }
}

class foo5{
    var a: Int64 = 1
    var b: Int32 = 1
    foo5(x:Int32,y:Int64){
        a = 1
    }
    init(x:Int64,y:Int64){
        a = 2
    }
}
