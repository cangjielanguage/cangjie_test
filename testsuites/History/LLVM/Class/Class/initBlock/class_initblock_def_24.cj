// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    var data1: Int32 = 4
    class Inner{
        init{
            var data2: Int32 = 3
        }
    }

}

func run(): Int64 {
    var data1: Data = Data()
    var data2: Data = Data.Inner()
    if (data1.data1 == 4 && data2.data2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
