// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    if(('A'=='A')&&(!('A'!='A'))&&('A'<'a')&&('A'<='A')&&(!('A'>'a'))&&('A'>='A')){
        return 0
    }
    return 1 
}
