//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let list1 = [0, *[1,*[2,*[3,*[4,*[5,*[6,*[7,*[8,*[9,*[10]]]]]]]]]]]
    if (list1.get(10) == 10) { // EXPECTED:regex error.*? '==' is not a member of enum 'Option'
        return 0
    }
    return 1
}
