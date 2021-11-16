// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var s2 = " ".reverse().reverse().reverse().reverse().reverse().reverse()
    var s3 = "Cangjie".reverse().reverse().reverse().reverse().reverse()

    if (s3.reverse() == "Cangjie" && s2 == " ") {
        return 0
    }
    return 1
}
