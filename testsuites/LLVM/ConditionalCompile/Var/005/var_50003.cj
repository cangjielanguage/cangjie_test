// EXEC: %compiler -config="(a=1,b=2)" %cmp_opt -c %f -o %output

@when[a=="1"&&b=="1"]
func main(){
    0
}