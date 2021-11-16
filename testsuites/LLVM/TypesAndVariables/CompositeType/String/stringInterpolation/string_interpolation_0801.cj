// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

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
        case "abd" => "no"
        case "${a}" => "yes" // EXPECTED: regex  only Literal const expression or dollar identifier is allowed in const pattern
        case _ => "no"
    }
    if (c != "yes") {
        return 1
    }
    return 0
}
