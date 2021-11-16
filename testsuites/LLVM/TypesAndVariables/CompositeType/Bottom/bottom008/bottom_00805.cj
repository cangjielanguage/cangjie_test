// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test():Int64 { if (return 1) {
                            return 2
                        }else if (true) {
                            4
                        }else {
                            5
                        }
                  }

func main(): Int64 {
    return test() - 1
}
