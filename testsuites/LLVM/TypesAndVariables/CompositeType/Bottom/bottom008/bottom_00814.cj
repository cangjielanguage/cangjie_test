// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expression of Nothing type cannot appear here currently

func test():Int64 { match (true) {
    case _ => if (return 2) {
                  return 3
              } else {
                  return 4
              }
    }
}

func main(): Int64 {
    return test() - 2
}
