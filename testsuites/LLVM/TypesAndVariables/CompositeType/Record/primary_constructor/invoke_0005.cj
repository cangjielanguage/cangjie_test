// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
    var b: Int32
    Data(){
        this.b = 3
    }
    init(input:Int32){
        Data()
        this.b = input
    }
}
func run(): Int32 {
var a:Int32 = 5
    var data: Data = Data(a)
    return data.b - 5
}
func main(): Int64 {
    return Int64(run())
}

