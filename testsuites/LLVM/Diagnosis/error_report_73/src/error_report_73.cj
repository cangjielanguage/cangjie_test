// DEPENDENCE: ../src
// EXEC-PIPE-1:%compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE-1:%compiler %cmp_opt src/%n.cj pkgs.%middle -o %output 2>&1 | compare %f

package B
import A.*

extend Int64 <: I {     // EXPECTED: regex primitive type 'Int64' cannot extend import interface
    func equal(){}
}

func main():Int64 {
    return 0
}

