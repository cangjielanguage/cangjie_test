// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Data with Num {
    func plus(a: Data, b: Data):Int32 { return 10 }
}

interface Data {
    let a:Int32 = 1
}

class Time <: Data {}

func run(): Int64 {
    var a:Data = Time() // spec15无法定义接口，赋值类（实现接口）实例，故此处暂无法初始化
    var b:Data = Time()
    let x: Int32  = plus(a,b)
    if ( x==10 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
