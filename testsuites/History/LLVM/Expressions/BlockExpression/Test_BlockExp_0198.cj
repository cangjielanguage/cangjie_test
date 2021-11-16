// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var a: ListFloat64 = ListFloat64(2,20)
                    a
                }

    var pattern1 = match val1 {
        case _ : ListFloat64 => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    if val1.insert(40).sum() != 80 {
        return 1
    }

    if !val1.set(1,30).contains(30) {
        return 1
    }

    if val1.removeAt(0).count() != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace