// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {

    var tes1 : Int64 = 1
    var v_int32 : Int32 = 32
    var v_int64 : Int64 = 64

    var pattern1 = match tes1 {    // ASSERT: regex type incompatible in this MatchCase
        case 1  => { v_int32 }
        case _ => { v_int64 }
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace