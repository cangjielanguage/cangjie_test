// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main() {
    var a = if (true) { return } else { return } // EXPECTED: regex error.*initialization expression of Nothing type is not supported currently
    return
}

