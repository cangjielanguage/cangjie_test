// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Boo{
    var a:String = ""
    func foo(x:Int64){
        var b = match (a) {
            case "s" => 1
            case "" => 2
            case  _ => 3
        }
        return x.toString() + a + b.toString()
    }
    var b = match (a) {
        case "s" => 1
        case "" => 2
        case  _ => 3
    }
    init(x!:String=match(""){case _=> "b"}){
        a = x
    }
    Boo(y:Int64,x!:String=match(""){case _=> "b"}){
        b = y
    }
}

func main(): Int64 {
    var a = Boo(x:"s").b
    var b = Boo(x:"s").foo(1)
    if ( a != 2 ){
        return 1
    }
    if ( b != "1s1" ){
        print("${b}")
        return 2
    }
    var c = Boo().a
    if ( c != "b" ){
        return 3
    }
    return 0
}