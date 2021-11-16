// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main():Int64 {
    case01()
    return 0
}

func case01(){
    let score = 80
    let a = 80
    var result = match {
        case score < (60) => ()
        case (score) >= 60 =>  // EXPECTED: regex at least one expression or declaration after '=>' in case body
        case _ => ()
    }
    return result
}
