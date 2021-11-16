// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main():Int64 {
    var a : String = "abc\n"
    var result: Int64 = match (a) {
        case "abc" => 2
        case "${a}" => 0 // EXPECTED: regex error.*only Literal const expression or dollar identifier is allowed in const pattern
        case _ => 1
    }
    return result
}