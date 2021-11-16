// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan no matching function declaration for function call 'sourceFile'
// ASSERT:scan no matching function declaration for function call 'sourceLine'

func main(){
    sourceFile(1)
    sourceLine(1)
    return 0
}