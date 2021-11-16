// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    var varString : String = "var"
    let letString : String = "let"
    varString = "let"
    if (varString == "var") {
        return 1
    }
    if (letString != "let") {
        return 1
    }
    if (varString == letString) {
        return 0
    }
    return 1
}
