// DEPENDENCE: com
// EXEC: cjc  -backend-options="-fPIC --shared" com/*.cj -o libcom.so
// EXEC: cjc  -backend-options="-lcom -L./" test_com.cj
// EXEC: export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH && %n

import com.*

//// EXEC: %compiler %cmp_opt -c com/*.cj -o com.%middle
//// EXEC: %compiler %cmp_opt com.%middle %f -o ./%n
//// EXEC: cjc  -backend-options="-fPIC --shared" com/*.cj -o libcom.so
//// EXEC: cjc  -backend-options="-lcom -L./" test_com.cj -o ./%output
// cjc  -backend-options="-fPIC --shared" com/*.cj -o libcom.so
// cjc  -backend-options="-lcom -L./" test_com.cj

func main(){
    hi()
    return 0
}
