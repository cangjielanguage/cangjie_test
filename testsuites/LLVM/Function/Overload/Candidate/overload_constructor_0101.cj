// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

class foo1{
    foo1(x:Int64){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
    init(x:Int64){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
}

class foo3{
    foo3(x:Int64){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
    init(x!:Int64){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
}

class foo4{
    foo4(x!:Int64=2){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
    init(y!:Int64=1){ // EXPECTED: regex error.*?function 'init' has overload conflicts

    }
}

class foo5{
    foo5(x:Int64){ // EXPECTED: regex error.*?function 'init' has overload conflicts
        return 1
    }
    init(x!:Int64=1){ // EXPECTED: regex error.*?function 'init' has overload conflicts
        return 2
    }
}
