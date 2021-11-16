// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class Point{
    var x: Int32 = 0
    var y: Int32 = 0
    func test(){
        var i : Int32 = 0
        match (i) {
          case _ => this.x
       }
    }
}


func main(): Int64 {
    return 0
}
