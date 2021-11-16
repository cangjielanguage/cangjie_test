// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64{
    var a = true
    var b = false
    a = a && b
    a ||= true

    print("${a}")

    if (a) {
        return 0
    }
    return 1
}
