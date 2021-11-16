// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1:List<String> = []
    let delimiter_str:String = ""

    if (String.join(arr1, delimiter: delimiter_str) != "") {
        return 1
    }

    if (String.join(arr1, delimiter: "s") != "") {
        return 1
    }

    if (String.join(arr1, delimiter: "\t") != "") {
        return 1
    }


    if (String.join(arr1, delimiter: "\fedc") != "") {
        return 1
    }


    if (String.join(arr1, delimiter: "仓") != "") {
        return 1
    }

    return 0
}
