// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B{a}

enum A{a(Int64)}

func main():Int64{
    var i = a
    var res : Int64 = match (i) {
        case _ : B => 0
        case _ => 1
    }
    return res
}