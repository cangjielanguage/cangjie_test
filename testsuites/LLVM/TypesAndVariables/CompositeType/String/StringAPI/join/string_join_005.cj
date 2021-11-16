// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = ["==","@#$^&*","(){}<>"]
    let delimiter_str:String = " "

    if (String.join(arr1, delimiter: delimiter_str) != "== @#$^&* (){}<>"){
        return 1
    }

    if (String.join(arr1, delimiter: "") != "==@#$^&*(){}<>"){
        return 1
    }

    if (String.join(arr1, delimiter: "-") != "==-@#$^&*-(){}<>"){
        return 1
    }

    if (String.join(arr1, delimiter: "\'") != "=='@#$^&*'(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: ":") != "==:@#$^&*:(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "+") != "==+@#$^&*+(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "=") != "===@#$^&*=(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "(") != "==(@#$^&*((){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "\b") != "==\b@#$^&*\b(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "\n") != "==\n@#$^&*\n(){}<>")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "\u{ed3a}") != "==\u{ed3a}@#$^&*\u{ed3a}(){}<>"){
        return 1
    }

    if (String.join(arr1, delimiter: "仓") != "==仓@#$^&*仓(){}<>"){
        return 1
    }

    return 0
}
