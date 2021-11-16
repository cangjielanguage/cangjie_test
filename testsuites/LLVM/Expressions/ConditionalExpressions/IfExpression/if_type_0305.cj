// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = if (true) { goo1 } else { goo2 }
    var res = match(a){
        case x : (Unit)->Any => 0
        case _ => 1
    }
    return res
}

// Char -> Unit
func foo1(x:Any):Unit{} // Any -> Unit  S1->T1
func foo2(x:Char):Unit{} // Char -> Unit S2 ->T2


// Unit->Any
func goo1(x:Unit):Any{ return ()} // Unit->Any
func goo2(x:Unit):Char{return 'a'} // Unit->Char



