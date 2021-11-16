// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
    var b : Int32
    public Data(){
        this.b = 3
    }
    
}

func run(): Int32 {
    var data: Data = Data()
    return data.b - 3
}

func main(): Int64 {
    return Int64(run())
}

