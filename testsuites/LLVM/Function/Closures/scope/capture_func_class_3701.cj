// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

var res: Int32 = 0
class Aoo{
    var a: Int32 = 1
    let b: Int32 = 1
    static prop var poo2:Int32{
        get(){
            var x = a+b;return x // EXPECPTED: regex error.*?'a' is non-static member, cannot be accessed by static function 'get'
        }
        set(v){
            var x = a+b // EXPECPTED: regex error.*?'a' is non-static member, cannot be accessed by static function 'set'
        }
    }
    static var c = if(true){
        func foo3(){return a} // EXPECPTED: regex 'a' is non-static member, cannot be accessed by static function 'foo3'
    }
    static func foo(){
        func foo3(){return a} // EXPECPTED: regex 'a' is non-static member, cannot be accessed by static function 'foo3'
    }

}

record Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static prop var poo2:Int32{
        get(){
            var x = a+b;return x // EXPECPTED: regex error.*?'a' is non-static member, cannot be accessed by static function 'get'
        }
        set(v){
            var x = a+b // EXPECPTED: regex error.*?'a' is non-static member, cannot be accessed by static function 'set'
        }
    }
    static var c = if(true){
        func foo3(){return a} // EXPECPTED: regex 'a' is non-static member, cannot be accessed by static function 'foo3'
    }
    static func foo(){
        func foo3(){return a} // EXPECPTED: regex 'a' is non-static member, cannot be accessed by static function 'foo3'
    }
}

func main():Int64 {
    var a = Aoo()
    if ( res != 10 ){
        return 1
    }
    return 0
}
