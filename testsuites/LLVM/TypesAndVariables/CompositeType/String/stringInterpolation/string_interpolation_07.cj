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
    if ( "${foo("${a}")}" != "abc") {
        return 1
    }
    if ( "${goo()}" != "abc") {
        return 1
    }
    if ( "${hoo()}" != "abc") {
        return 1
    }
    return 0
}

func foo(x:String){
    return x
}

var a = "abc"
func goo(x!:String="${a}"){
    return x
}

func hoo(){
    return "${a}"
}

class Aoo{
    var a: String  = ""
    init(x:String){a = x}
}