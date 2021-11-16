// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkgs.Data

var top:Data<Int32>= Data<Int32>(1, 0)

class Time{
    var a:Data<Int32>
    init(x:Data<Int32>) {
         a = x
    }
    func geta():Data<Int32>{
        return a
    }
}

record Day{
    let b:Data<Int32>
    init(x:Data<Int32>){
        b = x
    }
    func getb():Data<Int32>{
        return b
    }

}

func main(): Int64 {
    return run()
}
func run(): Int64 {
    let d: Data<Int32>= Data<Int32>(3, 0)
    let time: Time = Time(d)
    let c: Data<Int32>= Time(d).geta()
    let day: Day = Day(d)
    if ( top.area() == 1 && d.area() == 3 && time.geta().area() == 3 && c.area() == 3 && day.getb().area() == 3){
        return 0
    }
    return 1
}

