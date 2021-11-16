// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    var a:Int32 = 1
    static var b:Int32 =2
    static func coo(x:Data):Data{
        return x
    }
    init() {}
    init(x:Int32){
        this()
        a = x
    }

}

func run(): Int64 {
    var data: Data = Data(5)
    var res1: Data = Data.coo(data);
    if (data.a != 5 || res1.a != 5) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
