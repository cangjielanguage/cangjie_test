// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = ["hello","cang","jie"]
    let delimiter_str:String = " "

    if (String.join(arr1, delimiter: delimiter_str) != "hello cang jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "") != "hellocangjie") {
        return 1
    }

    if (String.join(arr1, delimiter: "x") != "helloxcangxjie") {
        return 1
    }

    if (String.join(arr1, delimiter: "-") != "hello-cang-jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "\'") != "hello'cang'jie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: ":") != "hello:cang:jie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "+") != "hello+cang+jie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "=") != "hello=cang=jie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "(") != "hello(cang(jie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "\b") != "hello\bcang\bjie")
    {
        return 1
    }

    if (String.join(arr1, delimiter: "\n") != "hello\ncang\njie")
    {
        return 1
    }

    print(String.join(arr1, delimiter: "\u{fedc}"))
    if (String.join(arr1, delimiter: "\u{fedc}") != "hello\u{fedc}cang\u{fedc}jie"){
        return 1
    }

    if (String.join(arr1, delimiter: "仓") != "hello仓cang仓jie") {
        return 1
    }

    return 0
}
