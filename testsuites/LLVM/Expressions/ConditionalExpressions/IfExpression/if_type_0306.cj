// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = if (true) { Object() } else { A() }
    var res = match(a){
        case x : Object => 0
        case _ => 1
    }
    return res
}

class A{}
