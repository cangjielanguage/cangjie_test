// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data{

    var a: Int32 = 1
    let b: Int32 = a
    let c: Int32 = 2
    var d: Int32 = c
    Data(x: Int32, y: Int32, z: Int32, w: Int32) {
    }
}

func run(): Int64 {
    var i1: Int32 = 5
    var i2: Int32 = 6
    var i3: Int32 = 6
    var i4: Int32 = 6
    let data: Data = Data(i1, i2, i3, i4)
    var a: Int32 = data.a
    var b: Int32 = data.b
    var c: Int32 = data.c
    var d: Int32 = data.d
    if (a == b && c == d && a == 1 && c == 2){
        return 0
    }
     return 1
}
