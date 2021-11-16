// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data(y:6)
    if (res1.x == 7){
        return 0
    }
    return 1
}


class Data{
    var x: Int32 = 1
    var y: Int32 = 2
    init(y!:Int32 = 4){
        x = x+y
    }
}



