// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    var a = "abc"
    var b = 1
    var c = match("${a}") {
        case "abd" => """
no"""
        case "abc" => "${"yes"}"
        case _ => #"no"#
    }
    if (c != "yes") {
        return 1
    }
    return 0
}
