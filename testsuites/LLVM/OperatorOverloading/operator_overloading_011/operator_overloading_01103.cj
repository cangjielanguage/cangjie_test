// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//interface Inc<T1> {
//    operator func ++(): T1
//}

interface Add<T1, T2> {
    operator func +( right: T1): T2
}

record Point {
    var x: Int32 = 1
    var y: Int32 = 2
    init (a: Int32, b: Int32) {
        x = a
        y = b
    }
}

//extend Point <: Inc<Point>{
//    operator func ++(): Point { Point(this.x + 1, this.y + 1)}
//}

extend Point <: Add<Point,Point> {
    operator func +( right: Point): Point { Point(this.x + right.x, this.y + right.y)}
}
func main(): Int64 {
    var p1 = Point(8, 24)
    let p2 = Point(9, 25)
    let p3 = p1 + p2
    if (p3.x == 17 && p3.y == 49) {
        return 0
    }
    return 1
}
