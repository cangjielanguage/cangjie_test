// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x = Boo()
    if(x.a != 1 ){
        return 1
    }
    if(x.b() != 1 ){
        return 2
    }
    if(x.c() != () ){
        return 3
    }
    if(x.d() != 2 ){
        return 4
    }
    if(x.e() != 2 ){
        return 5
    }
    return 0
}

record Boo{
    var a:Int32 = 1 // a = 1
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    prop let n:Int32 {
        get(){
             return a
        }
    }
    func b():Int32{return n}// a = 1,b = 1
    mut func c():Unit { m = 1} // a = 2,c = ()
    func d():Int32 { n } // a =2 ,d = 2
    func e():Int32 { m } // a = 2,e = 2
}

