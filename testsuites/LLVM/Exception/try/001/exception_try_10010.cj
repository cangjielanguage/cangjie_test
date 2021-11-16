// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'catch' is not allowed in block, expected expression or declaration here


func main(){
    catch (_){}
    return 0
}