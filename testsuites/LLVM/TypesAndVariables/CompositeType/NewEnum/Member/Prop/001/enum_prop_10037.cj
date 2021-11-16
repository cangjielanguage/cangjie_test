// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ababa

enum A{
    a(Int64,Int64,Int64)
    prop let c : B{
       get(){print("a");b(1,1,1)}
    }
}

enum B{
    b(Int64,Int64,Int64)
    prop let c : A{
       get(){print("b");a(1,1,1)}
    }
}

func main(): Int64 {
    var i = a(1,2,3)
    i.c.c.c.c.c
    return 0
}
