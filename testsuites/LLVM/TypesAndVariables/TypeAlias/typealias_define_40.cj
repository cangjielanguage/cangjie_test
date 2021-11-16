// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type str<T> =  String

func main(): Int64 {
    var str1: str<Int32> = "hello"
    var str2: String = "Char"
    var res: str<Int32> = str1 + " " + str2
    if (res == "hello Char") {
        return 0
    }
    return 1
}