// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

var res: Int32 = 0

open class Boo{
    var a: Int32 = 1
    let b: Int32 = 1
}
class Aoo<: Boo{
    static var c = if(true){
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
