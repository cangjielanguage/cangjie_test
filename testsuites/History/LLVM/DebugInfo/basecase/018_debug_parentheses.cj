// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { //设置断点：4
    var kuonum = (1 + 2) * 3 - 4 // The result is 5.
    return kuonum
}

// ASSERT:scan  4: label.0:
// ASSERT:scan  5: return.64
