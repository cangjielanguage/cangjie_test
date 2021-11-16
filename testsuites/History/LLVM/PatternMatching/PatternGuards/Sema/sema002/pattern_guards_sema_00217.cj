// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
    let x : Bool = true
}

func main(){
    var i : Int64 = 1
    var a : Int64 = match i {
        case _ if I.x => i
        case _ => i + 1
    }
    return (a-1)
}