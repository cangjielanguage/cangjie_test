// EXEC: %compiler %cmp_opt %f -o %output
// EXEC:  %run %run_opt %output %run_args

func main(): Int64 {
    var String1 : String = "abc"
    var String2 : String = "a"
    var String3 : String = "bc"


    if (String1 != "a" + "bc") {
        return 1
    }

    return 0
}
