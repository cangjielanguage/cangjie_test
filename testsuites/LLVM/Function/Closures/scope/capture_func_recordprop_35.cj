// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Aoo()
    if ( a.goo2 != 2){
        return 2
    }
    if ( a.goo3 != 2){
        return 3
    }
    if ( a.goo4 != 2){
        return 4
    }
    if ( a.goo5 != 1){
        return 5
    }
    if ( a.goo6 != 1){
        return 6
    }
    return 0
}

record Aoo{
    var a: Int32 = 1
    static var b:Int32 = 1

    prop var foo2:Int32{
        get(){
            var x = a+b;return x
        }
        set(v){
            var x = a+b
        }
    }

    prop var foo3:Int32{
        get(){
            return a+b
        }
        set(v){
            var x = a+b
        }
    }

    prop var foo4:Int32{
        get(){
             a+b ;
             return Int32(2)
        }
        set(v){
            var x = a+b
        }
    }

    prop var foo5:Int32{
        get(){
            a
        }
        set(v){
            var x = a+b
        }
    }

    prop var foo6:Int32{
        get(){
            b
        }
        set(v){
            var x = a+b
        }
    }

    prop var goo2:Int32{
        get(){
            var a = foo2
            return a
        }
        set(v){
            var x = a+b
        }
    }

    prop var goo3:Int32{
        get(){
            var a = foo3
            return a
        }
        set(v){
            var x = a+b
        }
    }

    prop var goo4:Int32{
        get(){
            var a = foo4
            return a
        }
        set(v){
            var x = a+b
        }
    }

    prop var goo5:Int32{
        get(){
            var a = foo5
            return a
        }
        set(v){
            var x = a+b
        }
    }

    prop var goo6:Int32{
        get(){
            var a = foo6
            return a
        }
        set(v){
            var x = a+b
        }
    }

}
