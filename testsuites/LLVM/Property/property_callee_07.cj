// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if(Boo.a != 1 ){
        return 1
    }
    if(Boo.b() != 1 ){
        return 2
    }
    if(Boo.c() != () ){
        return 3
    }
    if(Boo.d() != 2 ){
        return 4
    }
    if(Boo.e() != 2 ){
        return 5
    }
    return 0
}

record Boo{
    static prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    static prop let n:Int32 {
        get(){
             return a
        }
    }
    static var a:Int32 = 1 // a = 1
    static func b():Int32{
        func inb(){
            return n
        }
        return inb()
    }// a = 1,b = 1
    static func c():Unit {
        func inc(){
            m = 1
        }
        return inc()
    } // a = 2,c = ()
    static func d():Int32 {
        func ind(){
            n
        }
        return ind()
    } // a =2 ,d = 2
    static func e():Int32 {
        func ine(){
            m
        }
        return ine()
    } // a = 2,e = 2
}

