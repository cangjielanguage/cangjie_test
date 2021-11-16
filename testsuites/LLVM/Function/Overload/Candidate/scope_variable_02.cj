// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( res != 1 ){ // EXPECTED: regex usage of a variable 'res' which is not defined yet
        return 1
    }
    return 0
}

var res: Int32 = 1
