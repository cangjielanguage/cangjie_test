// ERRCHECK: %compiler %cmp_opt %f -o %output
// func test():Char = chr(return 'a')

func test():Char { chr(return 'a') } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    if (test() == 'a') {
        return 0
    }
    return 1
}
