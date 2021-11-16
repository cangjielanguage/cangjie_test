// ERRCHECK: %compiler %cmp_opt %f -o %output


func sourceFile(a:Bool){}
func sourceLine(a:Bool){}

func main(){
    let x = sourceFile // EXPECTED: regex reference to overloaded function 'sourceFile' could not be resolved
    let y = sourceLine // EXPECTED: regex reference to overloaded function 'sourceLine' could not be resolved

    return 0
}