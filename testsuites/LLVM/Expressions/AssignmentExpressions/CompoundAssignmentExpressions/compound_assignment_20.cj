// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func bar(x: Int64, y!:Unit=(x+=1)){ // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    var a = x
    a **= 3
}

func foo(x: Int64, y!:Unit=(x+=1)){ // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    var a = x
    a **= 3
    a
}

func main(): Int64 {
    var res1 = foo(3)
    var res2 = bar(3)
    if (res1 == 27 && res2 == () ){
        return 0
    }
    return 1
}