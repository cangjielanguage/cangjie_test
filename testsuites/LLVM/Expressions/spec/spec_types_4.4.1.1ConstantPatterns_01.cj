// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Foo {
    A | B | C
}
func f() {
    let x = Foo.A
    match (x) {
        case $A => 0
        case $B => 1
        case $C => 2
   }
}


func main():Int64{ 
    f()
    return 0
}

