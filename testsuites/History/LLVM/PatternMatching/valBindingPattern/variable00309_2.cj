// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case good@ 70 | 80 => "yes";var a = 1;"good" 
        case other@ _ => "yes";var test = {x:Int64=>x.toString()};test(other-1) 
        }
    if (result == "49") {
        return 0
    }
    return 1
}

