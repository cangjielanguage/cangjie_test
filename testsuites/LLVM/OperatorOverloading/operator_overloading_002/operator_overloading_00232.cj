// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record R{
    operator func ?:(inputB:R,inputC:R):Int64{ // EXPECTED: regex-auto illegal operator '?' for overloading
        return 1
    }
}

class C{
    operator func ?:(inputB:C,inputC:C):Int64{ // EXPECTED: regex-auto illegal operator '?' for overloading
        return 10
    }
}


interface I{
    operator func ?:(inputB:I,inputC:I):Int64{ // EXPECTED: regex-auto illegal operator '?' for overloading
        return 100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return (if(a){a}else{a})+(if(c){c}else{c})+(if(r){r}else{r})-111
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
