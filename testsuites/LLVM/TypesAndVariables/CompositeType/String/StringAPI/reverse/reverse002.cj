// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = """
    Cangjie""".reverse()
    var s2 = ##"颉仓"##.reverse()

    if (s1 == "eijgnaC    " && s2 == "仓颉" ) {
        return 0
    }
    return 1
}
