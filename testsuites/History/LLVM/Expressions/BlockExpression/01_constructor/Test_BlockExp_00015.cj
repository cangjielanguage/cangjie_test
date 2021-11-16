// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {
    let val1 = {
                    var a: Int8 = 12
                    var b: Int8 = 13 a+b // ASSERT: regex expected newline or ';' between expression or declaration
                }

    var pattern1 = match val1 {
        case _ : Unit => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace