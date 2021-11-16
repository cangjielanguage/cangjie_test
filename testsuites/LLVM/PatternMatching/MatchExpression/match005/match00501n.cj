// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var result = match (80) {
        case 60 => "pass"
        case good => return 0
        case  _ => "other"
    }
    return 1
}


func main():Int64{
    return test()
}

