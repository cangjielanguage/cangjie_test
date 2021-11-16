// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = ["cang"]
    let delimiter_str:String = ""

    if (String.join(arr1, delimiter: delimiter_str) != "cang") {
        return 1
    }

    if (String.join(arr1, delimiter: "s") != "cang") {
        return 1
    }

    if (String.join(arr1, delimiter: "\t") != "cang") {
        return 1
    }


    if (String.join(arr1, delimiter: "\fedc") != "cang") {
        return 1
    }


    if (String.join(["cangjie"], delimiter: "仓颉") != "cangjie"){
        return 1
    }

    return 0
}
