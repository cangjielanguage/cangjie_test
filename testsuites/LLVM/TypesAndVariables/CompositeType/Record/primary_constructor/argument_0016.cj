// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
    static let i: Int32 = 0
    Data(let a!: Int32 = Data.i){
    }
}

func run(): Int32 {
    var data: Data = Data()
    var data2: Data = Data(a: 5)

    if( data.a == 0 && data2.a == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return Int64(run())
}

