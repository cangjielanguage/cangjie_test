// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f 
// ASSERT: scan 0
// ASSERT: regex-not init

func main(): Int64 {
    var lam : ()->Unit = {=>
        print("init\n")
    }
    for (i in 0..3) {
        if (i == 0){
             lam = {=>
                print(i.toString())
             }
        }
        //i = 2
    }
    lam()
    return 0;
}
