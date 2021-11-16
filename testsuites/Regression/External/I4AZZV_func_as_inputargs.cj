// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args

type hF =  (String) -> String

func Aprint (f:hF, name: String) {
    let r = f(name)
    print("${r}\n")
}

func main() {
    let Dff:hF = {name:String => "你好: ${name}"}
    Aprint(Dff, "仓颉")
    return 0
}
