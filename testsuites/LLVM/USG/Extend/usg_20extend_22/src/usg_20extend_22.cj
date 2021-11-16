// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o A.%middle
// EXEC: %compiler %cmp_opt src/%n.cj A.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package B
import A.*

internal interface I1 {
    func f(): Unit
}

external interface I2 {
    func g(): Unit
}

extend Foo <: I1 & I2 { // not external
    func f(): Unit {}
    func g(): Unit {}
}

extend Bar <: I2 { // external
    func g(): Unit {}
}

func main(){
    return 0
}
