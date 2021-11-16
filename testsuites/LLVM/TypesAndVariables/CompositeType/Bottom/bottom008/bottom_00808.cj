// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test():Int64 { if (false) {
                            if (return 1) {
                                return 2
                            } else {
                                return 3
                            }
                        }else {
                          if (return 4) {
                                return 5
                            } else {
                                return 6
                            }
                        }
                    }

func main(): Int64 {
    return test() - 4
}
