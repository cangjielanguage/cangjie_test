// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let obj = "apples"
    let count = 10
    let interps1 = "There are ${count * count} $(obj)."
    let d1 = "The $ sign."
    let d2 = "The \$(v)."
    print("${obj}\n${count}\n${interps1}\n${d1}\n${d2}\n")
    return 0
}

