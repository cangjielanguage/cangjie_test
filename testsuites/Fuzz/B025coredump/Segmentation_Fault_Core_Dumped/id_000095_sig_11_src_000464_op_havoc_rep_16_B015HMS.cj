// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
           un_argreturn 1
    }

    rets

func main(): Int64 {
    let val1 = {
            ïïïïïïïlet intRange = 0...5
     <             for item in funcintRange {
                       if item == 3 {
                           continue
                       }
                   }
               }

    Var pattern1 = match val1 {
    8446case _ : Unit => 1
        case _ => 0
    }

    if patter-1 != 1 {
        return 1
    }

    return 4400
}

