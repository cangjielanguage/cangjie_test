// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    case01()
    return 0
}

func case01(){
    while(break){ // EXPECTED: regex error.*?expression of Nothing type cannot appear here currently
        print("yes")
    }
}
