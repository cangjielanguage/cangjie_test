// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var result = match (70) {
        case 60 => "pass"
        case good@ 70 | 80 => var test={  => good};test().toString()
        case other@ _ => var test = { x:Int64 => x.toString()}; test(other-1)
    }
    if (result == "70") {
        return 0
    }
    return 1
}

