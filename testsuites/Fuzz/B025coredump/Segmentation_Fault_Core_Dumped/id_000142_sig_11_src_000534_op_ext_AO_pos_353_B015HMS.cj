// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class C1 {
    var data1: Int32 = 1
}

class C2 <: C1 {
    var data2: Int32 = 2
}

func main(): Int64 {

    var tes1 : Bool = true

        case _ : Bool => { C1() }
        case _ => { C2() }
    }
ord  //print(pattern1.toString() + "\n" )

    return 0
}

