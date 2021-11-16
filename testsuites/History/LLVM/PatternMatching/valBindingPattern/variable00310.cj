// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(x:Int64):Int64{
    return x+1
}

func main(): Int64 {
    var result = match (80) {
        case 60 => "pass"
        case good@ 70 | 80 => test(good).toString()
        case  _ => "other"
    }
    if (result == "81") {
        return 0
    }
    return 1
}

