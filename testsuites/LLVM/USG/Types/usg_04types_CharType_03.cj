// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let uniA:Char = '\u{4f60}'
    let uniB:Char = '\u{597d}'
    if ( uniA != '你') {
        return 1
    }
    if ( uniB != '好') {
        return 1
    }
    print("uniA = ${uniA}\n")
    print("uniB = ${uniB}\n")
    0
}
