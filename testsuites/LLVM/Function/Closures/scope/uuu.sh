#!/bin/bash

workspace=$(cd "$(dirname "$0")";pwd)
echo -e "\033[44;33m ------------------------hulala------------------------ \033[0m"
src=$workspace/list.txt
ncase=$workspace/ncase.txt
pcase=$workspace/pcase.txt
number=2
#filesuffix=${line##*.}  ## 最后一个点后面的值: 文件后缀
#filefullname=${line##*/} ## 最后一个/后面的值: 文件名
#substr=${line%.*} ## 最后一个点前面的值 ./5-1-2/5-1-2-2/modifier/var_modifier_0005
#substr=${line#*_} ## 第一个_后面的值 比如modifier_0005.chr取0005.chr
##输入是find ./ -type f
##\033[44;30m 蓝底黑字 \033[44;31m 蓝底红字 \033[44;33m 蓝底黄字

copyandnum(){
    echo "====================  copy and change number  ===================="
    while [[ $number != 12 ]];
    do
        echo ----------------- $number -----------------
        no=`expr $number + 1`
        org=`expr $number % 2`
        #echo puls show $no
        #echo original show $org
        cp pkgs$org.chr pkgs$number.chr
        let number++
    done

}

copytxt(){
    echo "====================  copy txt  ===================="
    echo ----------------- modify basic txt by manual -----------------
    while read line
    do
        echo ----------------- $line -----------------
        srcstr=case_txt_templet
        objstr=${line%.*} ##最后一个点前面的值(待路径)
        filename=${objstr##*/}  ## 最后一个/后面的值: 文件名
        cp $srcstr.txt $objstr.txt
        sed -i "s/$srcstr/$filename/g" $objstr.txt
        cat $line | grep 'compare\|ERRCHECK' ## 如果有compare或ERRCHECK的是负向用例
        briefstr=`cat $line | grep '//brief'`
        brief=${briefstr##*:}
        detailstr=`cat $line | grep '//detail'`
        details=${detailstr##*:}
        echo $briefstr
        echo $brief
        if [ $? -eq 0 ] ;then
          sed -i "s/编译执行成功、返回0/编译报错/g" $objstr.txt
        fi
        sed -i "s/这里写Brief/$brief/g" $objstr.txt
        sed -i "s/这里写step/$brief/g" $objstr.txt
        sed -i "s/这里写detail/$details/g" $objstr.txt
        sed -i 's/\r//g'  $objstr.txt
        # sed -i "s/RequirementID: AR-SR-ARKLANG-2006-01/RequirementID: AR-SR-ARKLANG-2019-07/g" $line
        # sed -i "s/RequirementName: Enum的词法、语法解析/RequirementName: 模块化编译中支持Trait/g" $line
        #sed -i "s/DEPENDENCE: 跑/DEPENDENCE: ..\/跑/g" $line/pkg/pkg.chr
    done < $1
}

copycase(){
    echo "====================  copy case  ===================="
    while read line
    do
        echo ----------------- $line -----------------
        substr=${line%/*}
        if [ ! -d retest/$substr ] ;then
          mkdir -p retest/$substr
        fi
        if [ ! -f retest/$line ] ;then
            cp $line retest/$substr
        else
          echo "ATTENTION: I HAVE THIS CASE"
        fi
        cp retest/$line $substr
      done < $1
}

copyfile(){
    cd $workspace
    echo $workspace
    echo "====================  copy  file  ===================="
    while read line
    do
        echo ----------------- $line -----------------
    echo $workspace
        #cp enum.txt $line/$line.txt
        #sed -i "s/enum_def_0101.chr/$line\/pkg.chr/g" $line/$line.txt
        #sed -i "s/enum/trait/g" $line

#       foldername=${line%/*}
      # subfolder=${foldername#*_}
      # newfolder="trait_"$subfolder
      # filename=${line##*/}
      # subfile=${filename#*_}
      # newfile="trait_"$subfile
       echo ----------------- $foldername -----------------
       echo -----------------  将list.txt中的用例复制一份 -----------------
       echo -----------------  rm rm rm rm rm ---------------
       rm  ${line} -rf 
       echo $?
       #       mkdir -p $foldername
       #cp $line need/$foldername/
#       cp need/$line $foldername/
        # sed -i "s/RequirementID: AR-SR-ARKLANG-2006-01/RequirementID: AR-SR-ARKLANG-2019-07/g" $line
        # sed -i "s/RequirementName: Enum的词法、语法解析/RequirementName: 模块化编译中支持Trait/g" $line
        # sed -i "s/TimeUnit/Num/g" $line
        #sed -i "s/DEPENDENCE: 跑/DEPENDENCE: ..\/跑/g" $line/pkg/pkg.chr
    done < $1
}

changeaccess(){
    echo "====================  change access and dos2unix ===================="
    while read line
    do
        chmod 644 $line ## file rw-r–r–
        dos2unix $line
        folder=${line%/*}
        chmod 755 $folder ## fold rwxr-xr-x
    done < $1  ##输入是find ./ -type f
}

changesuffix(){
    echo "====================  change suffix  ===================="
    while read line
    do
      substr=${line%.*}
      mv $line $substr.cj
    done < $1  ##输入是find ./ -type f
}


getbrief(){
    echo "====================  gettitle from txt  ===================="
    rm tmp.txt
    touch tmp.txt
    while read line
    do
        echo ----------------- $line -----------------
        txtfile=${line%.*}.txt
        if [ ! -f $txtfile ] ; then
          echo "file is not exist" >> tmp.txt
        else
          echo ----------------- $txtfile -----------------
            str="Brief"
            cat $txtfile | while read row
            do
                if [[ $row =~ $str ]]
                then
                  echo " "$row >> tmp.txt
                fi
            done
        fi
     done < $1
}


headinsert(){
    echo "====================  insert content to file  ===================="
    echo "====================  compare之后插入ASSERT core dump和stack trace  ===================="
    while read line
    do
        echo ----------------- $line -----------------
        strA="compare"
        touch tmp
        while read str || [[ -n ${str} ]]
        do
            echo $str >> tmp
            if [[ $str =~ $strA ]]
            then
              echo "// ASSERT: scan-not core dumped" >> tmp
              echo "// ASSERT: scan-not stack trace" >> tmp
            fi
        done < $line
        mv tmp $line
     done < $1
}


headchange(){
    echo "====================  change file content  ===================="
    # ./RT0009-rt-arrayboundary-ABCOfor/ABCOfor.java
    # ./5-1-2/5-1-2-2/modifier/var_modifier_0005.info
    while read line
    do
        echo ----------------- $line -----------------
        ######1 修改执行文件
        #sed -i "s/.\/%n.out/%n.%suffix/g" $line
        #sed -i "s/%n.out/%n.%suffix/g" $line
        #sed -i "s/EXEC: main/EXEC: %n.%suffix/g" $line
        #sed -i "s/EXEC:main/EXEC: %n.%suffix/g" $line
        #sed -i "s/-o main/-o %n.%suffix/g" $line
        #sed -i "s/.\/main/%n.%suffix/g" $line
        #sed -i "s/EXEC: charc %n.chr -o %n.o/EXEC: charc %n.chr -o %n.%suffix/g" $line
        #sed -i "s/EXEC: %n.o/EXEC: %n.%suffix/g" $line
        ######1 end
        ######2 变量化或加选项
        #sed -i "s/EXEC: charc/EXEC: %compiler/g" $line
        #sed -i "s/EXEC: clang/EXEC: %clang/g" $line
        #sed -i "s/EXEC: %n.%suffix/EXEC: %run %n.%suffix/g" $line
        #sed -i "s/EXEC: %compiler/EXEC: %compiler %cmp_opt/g" $line
        sed -i "s/EXEC: %n.%suffix/EXEC: %run %run_opt %n.%suffix/g" $line
        sed -i "s/EXEC: %run %n.%suffix/EXEC: %run %run_opt %n.%suffix/g" $line
        #sed -i "s/%cmp_opt/%cmp_opt -no-prelude/g" $line
        #sed -i "s/\/\/ %n.%suffix/\/\/EXEC: %n.%suffix/g" $line
        ######2 end
        ######删除第一行后，在文件最前面插入两行
        sed -i '1d' $line
        sed -i '1d' $line
        ###// EXEC: echo "ast=%libdir/ast/ast.cjo\nmath=%libdir/math/math.cjo" > ast.cfg
        ###os=%libdir/os/cangjieOS.cjo\nio=%libdir/io/io.cjo
        sed -i '1i\// EXEC: echo "io=%libdir/io/io.cjo" >> os.cfg'  $line
        sed -i '1i\// EXEC: echo "os=%libdir/os/os.cjo" > os.cfg'  $line
        ######3 加空格
        #sed -i "s/EXEC: /EXEC:/g" $line
        #sed -i "s/EXEC:/EXEC: /g" $line
        #sed -i "s/DEPENDENCE: /DEPENDENCE:/g" $line
        #sed -i "s/DEPENDENCE:/DEPENDENCE: /g" $line
        #sed -i "s/ASSERT: /ASSERT:/g" $line
        #sed -i "s/ASSERT:/ASSERT: /g" $line
        ######3 end
        ######4 增加用例头文件
        #substr=${line%.*}
        #cp casehead.txt $substr.txt
        #sed -i "s/TestCaseID: xxx/TestCaseID: $line/g" $substr.txt
        #sed -i "s/TestCaseName: xxx/TestCaseName: $line/g" $substr.txt
        ##sed -i "s/RequirementID: xxx/RequirementID: AR-SR-ARKLANG-2002-11/g" $substr.txt
        ##sed -i "s/RequirementName: xxx/RequirementName: String实现/g" $substr.txt
        ######4 end
        ######5 将注释*- 改成* -，为了符合java语法规范
        #sed -i "s/*- @Conditon:/*- @Condition:/g" $line
        #sed -i "s/*- @Title\/Destination/*- @TestCaseName/g" $line
        #sed -i '/*- @TestCaseName/a\ *- @TestCaseType: Function Test' $line
        #sed -i '/*- @TestCaseType/a\ *- @RequirementID: SR000B7N9J' $line
        #sed -i '/*- @RequirementID/a\ *- @RequirementName: Java字符串实现' $line
        #sed -i 's/[ ]*$//g' $line
        #sed -i 's/*- /* -/g' $line ##将注释*- 改成* -，为了符合java语法规范
        ######5 end
        ######6 用例依赖或者中间件改名
        #sed -i 's/list.ast/charCore.ast/g' $line
        #sed -i 's/list.o/charCore.o/g' $line
        #sed -i 's/import list/import core/g' $line
        ######6 end
    done < $1
}



singletest(){
    echo "====================  跑单个用例分析日志信息  ===================="
    while read line
    do
        echo ----------------- $line -----------------
        python3 /root/code/char/utils/test-framework/main.py --test_cfg=/root/code/char/tests/test.cfg $line --debug --verbose >tmp.txt 2>&1

#        echo ====================  检查是否有0:0  ====================
        #cat PatternMatching.txt | grep "0:0"
        #cat PatternMatching.txt | grep "core dump"
        cat tmp.txt | grep "Failed"
        if [ $? -eq 0 ] ;then
          echo -e "\033[44;33m $line:Result:FAIL\033[0m"
          echo $line >> fail.txt
        else
          echo $line >> pass.txt
        fi

    done < $1
}

coredump(){
    echo "====================  cjc跑单个用例确认是否发生coredump  ===================="
    while read line
    do
        cjc $line >tmp.log 2>&1
#        echo ====================  检查是否有0:0  ====================
        #cat PatternMatching.log | grep "0:0"
        #cat PatternMatching.log | grep "core dump"   ##Segmentation fault (core dumped) / doesn't exist
        cat tmp.log | grep "doesn't exist"
        if [ $? -eq 0 ] ;then
            echo -e "\033[44;30m $line File doesn't exist\033[0m"
            continue
        fi
        cat tmp.log | grep "core dumped"
        if [ $? -eq 0 ] ;then
            echo -e "\033[44;31m $line Result:coredump\033[0m"
            continue
        fi
        echo -e "\033[44;33m $line Result:PASS\033[0m"

        ##cjc $line
        ##if [ $? -eq 139 ] ;then
        ##    echo -e "\033[44;31m $line Result:coredump139\033[0m"
        ##    continue
        ##elif [ $? -eq 134 ] ;then
        ##    echo -e "\033[44;31m $line Result:coredump134\033[0m"
        ##    continue
        ##else
        ##   echo -e "\033[44;33m $line Result:PASS\033[0m"
        ##fi
    done < $1
}


checktestlist(){
    echo "====================  check DTS in testlist  ===================="
    if [ ! -f testlist ] ; then
          echo "testlist is not exist ,PLS run at source/tests/HLT"
          exit 1
    fi
    while read line
    do
        grep $line -nr testlist
        if [ $? -eq 1 ] ;then
          echo -e "\033[44;30m $line Result:Not in testlist\033[0m"
        else
          echo -e "\033[44;31m $line Result:Need remove DTS&Case from testlist\033[0m"
        fi
    done < $1
}

ARGS=`getopt -a -o I:k:LMSsth -l :instence,key:,checktestlist,changeaccess,copytxt,coredump,getbrief,help -- "$@"`
function usage() {
    echo  '-------------------------HELP For YOU-----------------------------------'
    echo  '      get list.txt : find ./ -type ft'
    echo  '-R|--checktestlist : Remove DTS&Case from testlist after regression test'
    echo  '    --changeaccess : change file dos2unix,and change folder as 755,change file as 644'
    echo  '         --copytxt : auto generate CASE TXT,auto modify EXPECTED'
    echo  '        --coredump : usc cjc run case,check coredump'
}
[ $? -ne 0 ] && usage
eval set -- "${ARGS}"
while true
do
      case "$1" in
      -I|--instence)
              instence="$2"
              shift
              ;;
      -k|--key)
              key="$2"
              shift
              ;;
      -R|--checktestlist)
	            checktestlist $src
              ;;
      --changeaccess)
              changeaccess $src
              ;;
      --copytxt)
              copytxt $src
              ;;
      --coredump)
              coredump $src
              ;;
      --getbrief)
              getbrief $src
              ;;
      -h|--help)
              usage
              ;;
      --)
              shift
              break
              ;;
      esac
shift
done


