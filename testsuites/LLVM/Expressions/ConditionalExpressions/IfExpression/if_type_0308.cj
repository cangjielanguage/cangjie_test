// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = if (true) { foo1 } else { foo2 }
    var res = match(a){
        case x : ((Any)->Unit)->Unit => 0
        case _ => 1
    }
    return res
}

// ((Any)->Unit):Unit
func foo1(x:(Any)->Unit):Unit{} // Any -> Unit  S1->T1
func foo2(x:(Char)->Unit):Unit{} // Char -> Unit S2 ->T2

