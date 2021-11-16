// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data<T> {
    var p0 : T 
    let p1 : Int32
    Data(x : Int32, p0 : T , p1!:Int32 = 0){
        this.p0 = p0
        this.p1 = p1 
    }
}

func run(): Int32 {
    let a: Int32 = 5
    var data: Data<Int32> = Data<Int32>(a, a)
    return data.p0 - 5 + data.p1
}
func main(): Int64 {
    return Int64(run())
}

