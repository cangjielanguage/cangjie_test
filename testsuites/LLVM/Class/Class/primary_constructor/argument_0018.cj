// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
    Data(let a!: Int32, let b!: Int32){
    }
}

class Data_1{
    let a: Int32
    let b: Int32
    init(a!: Int32, b!: Int32){
        super()
        this.a = a
        this.b = b
    }
}

class Data2 {
    Data2(let a: Int32, let b: Int32){
    }
}

class Data2_1{
    let a: Int32
    let b: Int32
    init(a: Int32, b: Int32){
        super()
        this.a = a
        this.b = b
    }
}


func run(): Int32 {
    var data: Data = Data(a: 1, b: 2)

    if( data.a == 1 && data.b == 2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return Int64(run())
}

