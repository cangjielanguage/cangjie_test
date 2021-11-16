// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

open class C1 {
    var data1: Int32 = 1
}

class C2 <: C1 {
    var data2: Int32 = 2
}

open class C3 {
    var data3: Int32 = 3
}

func main(): Int64 {

    var tes1 : Bool = true

    var pattern1 = match tes1 {    // ASSERT: regex type incompatible in this MatchCase
        case _ : Bool => { C3() }
        case _ => { C2() }
    }

    //print(pattern1.toString() + "\n" )

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace