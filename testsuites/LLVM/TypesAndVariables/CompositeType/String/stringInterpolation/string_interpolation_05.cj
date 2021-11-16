// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    var a = "abc"
    var b = 1
    if ( "${foo(a)}" != "abc") {
        return 1
    }
    if ( "${Aoo(a).a}" != "abc") {
        return 1
    }
    if ( "${b+b}" != "2") {
        return 1
    }
    if ( {"abc"}() != "abc") {
        return 1
    }
    if ( "${{"abc"}()}" != "abc") {
        return 1
    }
    return 0
}

func foo(x:String){
    return x
}
class Aoo{
    var a: String  = ""
    init(x:String){a = x}
}