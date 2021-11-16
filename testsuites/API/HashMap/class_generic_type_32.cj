// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    return run()
}

class Foo<T> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

func run(): Int64 {
    var foo: Foo<Int32> = Foo<Int32>(1, 2)
    var mapFoo: HashMap<Int32, Foo<Int32>> =HashMap<Int32, Foo<Int32>>([(1,foo),(2,foo)])
    var foo2o = mapFoo.get(2)
    var foo2 = match (foo2o){
        case Some(x) => x
        case _ => Foo<Int32>(0,0)
    }
    var res1: Int32 = foo2.x
    var res2: Int32 = foo2.y
    if (res1 == 1 && res2 == 2){
        return 0
    }
    return 1
}
