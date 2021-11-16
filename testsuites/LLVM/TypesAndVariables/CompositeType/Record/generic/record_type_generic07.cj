// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data{
   Data(let x!: Int32 = 1, let y!: Int32 = 2) {}
}

interface I<T>{
    func getData(data: T): T
}

class Foo <: I<Data>{
    func getData(data: Data): Data{
        Data(x:data.x+1,y: data.y+1)
    }
}

func run(): Int64 {
    var res: Int32
    let data1: Data = Data()
    var data2: Data = Foo().getData(data1)
    var res1: Int32 = data2.x
    var res2: Int32 = data2.y
    if (res1 == 2 && res2 == 3){
        return 0
    }
    return 1
}
