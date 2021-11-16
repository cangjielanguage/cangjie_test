// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s1 = "Cangjie".clone().clone().clone().clone().clone().clone()

    if (s1 == "Cangjie" ) {
        return 0
    }
    return 1
}
