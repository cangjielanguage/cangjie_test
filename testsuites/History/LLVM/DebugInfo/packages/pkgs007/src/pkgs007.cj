// DEPENDENCE:  module007 ../cfg-ast
// EXEC: %compiler -g %cmp_opt -module-name module007 -c module007/src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler -g %cmp_opt %n.cj -import-config cfg-ast pkgs.%middle -o %output | compare %f



from module007  import  pkgs.*

func main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}

// ASSERT:scan  13: jnez label.2
// ASSERT:scan  14: return.64
// ASSERT:scan  16: return.64
