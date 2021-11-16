// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    //init { var a:T }
    var a:T
    init(x:T){ a=x }
    static var b:Int32 =2
    static func coo(x:Data<T>):Data<T>{
        return x
    }
}

func run(): Int64 {
    var data: Data<String> = Data<String>("5")
    var res1: Data<String>  = Data<String>.coo(data);
    if (data.a != "5" || res1.a != "5") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
