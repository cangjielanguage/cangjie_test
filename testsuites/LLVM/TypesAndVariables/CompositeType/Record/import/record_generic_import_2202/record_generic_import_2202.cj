// DEPENDENCE: pkgs 
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int64 {
    return run()
}

record Data {
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = length1
        length = width1
    }
    func area(): Int32 {
        return width*length
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data = Data(a, b)
    let data2: pkgs.Data = pkgs.Data(a, b)
    if (data1.area() == 12 && data2.area() == 3) {
        return 0
    }
    return 1
}

