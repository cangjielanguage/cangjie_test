// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Map<Int32, String> = #{1 : "Aa", 2 : "Bb", 3 : "Cc"}
    var b: Map<Int32, String>
    init(x: Map<Int32, String>){
        b = x
    }
    func f(x: Map<Int32, String>): Map<Int32, String>{
        return x
    }
}

func run(): Int64 {
    var map1: Map<Int32, String> = #{1 : "A", 2 : "B", 3 : "C"}
    var map2: Map<Int32, String> = #{1 : "a", 2 : "b", 3 : "c"}
    var test: Test = Test(map1)
    var res1: Map<Int32, String> = test.a
    var res2: Map<Int32, String> = test.b
    var res3: Map<Int32, String> = test.f(map2)
    var x1 = res1.get(1)
    var x2 = res2.get(2)
    var x3 = res3.get(3)
    var y1 = match (x1){
        case Some("Aa") => 0
        case _ => 1
    }
    var y2 = match (x2){
        case Some("B") => 0
        case _ => 1
    }
    var y3 = match (x3) {
        case Some("c") => 0
        case _ => 1
    }
    if ( y1 == 0 && y2 == 0 && y3 == 0) {  
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
