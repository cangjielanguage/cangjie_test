// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let s1 = """
    """  // empty multi-line string
    print("${s1}\n")
    let s2 = """
    This
        is a multi-line string"""
    print("${s2}\n")
    let s3 = """
        This
      is a multi-line string"""
    print("${s3}\n")
    let s4 = """
    This
        is a
    multi-line string
    """
    print("${s4}\n")
    let s5 = """
    This is a\n
        multi-line string
    """
    print("${s5}\n")
    return 0 
}
