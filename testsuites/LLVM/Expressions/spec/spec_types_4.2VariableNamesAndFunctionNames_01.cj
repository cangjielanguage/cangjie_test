// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
package p
let x = 20
func add(p1: Int64, p2: Int64): Int64 { p1 + p2 }

func main():Int64{ 
    let intNum: Int64 = 100
    let value = p.x
    add(12,23)
    return 0
}

