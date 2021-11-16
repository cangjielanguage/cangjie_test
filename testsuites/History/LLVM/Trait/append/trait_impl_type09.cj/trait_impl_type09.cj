// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num {
    func plus(a: This, b: This): Int32
}
append ()->Int32 with Num {
    func plus(a: ()->Int32, b: ()->Int32):Int32 { return a()+b() }
}

func run(): Int64 {
    var a: ()->Int32 = {  => 2}
    var b: ()->Int32 = {  => 3}
    var x: Int32 = plus(a,b)
//    var x = a()+b()
    if ( x==5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}