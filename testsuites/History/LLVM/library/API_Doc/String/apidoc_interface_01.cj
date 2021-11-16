// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = Aoo()
    if ( a.toString() != "yes" ){
        return 1
    }
    return 0
}

class Aoo <: ToString{
    func toString():String{
        return "yes"
    }

}
