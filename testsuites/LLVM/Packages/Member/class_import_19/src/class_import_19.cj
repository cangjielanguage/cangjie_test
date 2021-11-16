// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int64 {
    return run()
}

open class Data {
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = length1
        length = width1
    }
    func area(): Int32 {
        return width
    }
}

class Time <: Data {
    init(){
        super(1,2)
    }
}
class Day <: pkgs.Data{
    init(){
        super(1,2)
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data= Data(a, b)
    let data2: pkgs.Data= pkgs.Data(a, b)
    var t: Time = Time()
    var d: Day = Day()
    if (data1.area() == 4 && data2.area() == 3 && t.width == 2 && d.width == 1) {
        return 0
    }
    return 1
}

