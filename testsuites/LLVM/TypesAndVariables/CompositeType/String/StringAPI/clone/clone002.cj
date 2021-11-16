// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = """
    Cangjie""".clone()
    var s2 = ##"仓颉"##.clone()

    if (s1 == "    Cangjie" && s2 == "仓颉" ) {
        return 0
    }
    return 1
}
