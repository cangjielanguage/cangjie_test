// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    while (false) {
      var MyTuple = (
        1,
        break // EXPECTED: regex expression of Nothing type cannot appear here currently
     )
    }
    return 0
}


