// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
    Data(var a!: Bool = true, var x!: Bool = a){
        this.a = a
        this.x = x
    }
}

func run(): Int32 {
    var data: Data = Data()

    if(data.a && data.x){
    return 0
    }
    return 1
}
func main(): Int64 {
    return Int64(run())
}

