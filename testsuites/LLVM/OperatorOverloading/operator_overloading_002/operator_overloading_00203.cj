// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record R{
    let r : Array<Int32>
    operator func [(inputB:Int32):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return inputA.r[Int64(inputB)]
    }
    operator func [(inputB:Int64):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return inputA.r[inputB]
    }
    operator func [(inputB:R):Bool{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return true
    }
}

class C{
    let c : Array<Int32>
    operator func [(inputB:Int32):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return inputA.c[Int64(inputB)]
    }
    operator func [(inputB:Int64):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return inputA.c[inputB]
    }
    operator func [(inputB:C):Bool{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return true
    }
}


interface I{
    let i : Array<Int32> = @{0,1,2,3}
    operator func [(inputB:Int32):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return I.i[Int64(inputB)]
    }
    operator func [(inputB:Int64):Int32{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return I.i[inputB]
    }
    operator func [(inputB:I):Bool{ // EXPECTED: regex-auto illegal operator '[' for overloading
        return true
    }
}

class A <: I{}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
