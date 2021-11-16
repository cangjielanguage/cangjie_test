// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    var a : Bool = true
    var i : Int64 = 1
    func test(){
        var y : Int64 = match (i) {
            case _ if (this.a) => i
            case _ => i + 1
        }
        if (y == 1) {
            return 0
        }
        return 1
    }
}

func main(){
    return A().test()
}