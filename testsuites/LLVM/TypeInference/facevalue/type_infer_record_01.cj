// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res =  Data(1,2)
    if (res.a == 1 && res.b ==2) {
        return 0
    }
    return 1
}

record Data{
    var a =1
    var b =2
    init(x:Int64,y:Int64) {
        a = x
        b = y
    }
}


