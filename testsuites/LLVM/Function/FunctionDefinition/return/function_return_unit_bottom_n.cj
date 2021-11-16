// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return 0
}

func case08(){
    while(while(true){break}){ // EXPECTED: regex error.*?expected an expression of type 'Bool', but got 'Unit'
        print("yes")
    }
}

func case10(){
    while(true){
        match (break) { // EXPECTED: regex error.*?expression of Nothing type cannot appear here currently
            case a => a
        }
    }
}
