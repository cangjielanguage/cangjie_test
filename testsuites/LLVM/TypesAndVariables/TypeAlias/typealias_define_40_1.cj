// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type str<T> = T

func main(): Int64 {
    var str1: str<String> = "hello"
    var str2: String = "Char"
    var res: str<String> = str1 + " " + str2
    if (res == "hello Char") {
        return 0
    }
    return 1
}