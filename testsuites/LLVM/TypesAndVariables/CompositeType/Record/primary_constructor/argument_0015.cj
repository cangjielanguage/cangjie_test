// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

record Data {
    Data(a!: Bool = false, var x!: Bool = a){
    }
}

record Data2 {
    Data2(a!: Bool , let x!: Bool = a){
    }
}

record Data3 {
    Data3(a: Bool , let x!: Bool = a){
    }
}

func run(): Int32 {
    var data: Data = Data()
    var data2: Data2 = Data2(a: true)
    var data3: Data3 = Data3(true)

    if( !data.x && data2.x && data3.x){
        return 0
    }
    return 1
}

func main(): Int64 {
    return Int64(run())
}

