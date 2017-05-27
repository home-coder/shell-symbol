#!/bin/bash
echo $0
echo $1
echo $2
echo $#
echo $*
echo $@
echo $?
echo $$
echo "$^ is 不是 特殊字符, Shell 不是 Makefile"
echo "========================="
echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"

echo "========================="
val_all=1234
for var in ${val_all}
do
	echo "${var}"
done

echo "========================="
val_all="1234 5678 99 12"
for var in ${val_all}
do
	echo ${var}
done

echo "========================="
val_all=""12" "34" "56" "34""
for var in ${val_all}
do
	echo ${var}
done

echo "=======\$@ and \$*=================="
echo "\$* = $*"
echo "\$@ = $@"
echo "\$* = "$*""
echo "\$@ = "$@""

echo -e "print every param in \$*"
for var in $*
do
	echo "${var}"
done

echo "print every param in \$@"
for var in $@
do
	echo ${var}
done

echo "print every param in "\$*""
for var in "$*"
do
	echo ${var}
done

echo "=============替换 -e, ``反引号替换====================="
echo -e "hello replace\n"

DATE=`date`
echo "Date is $DATE"
USERS=`who | wc -l`
echo "Logged in user are $USERS"
UP=`date ; uptime`
echo "Uptime is $UP"
PWD=`pwd`
echo ${PWD}

echo "=============替换符================"
PWD=`pwd`
echo "Path1 = ${PWD}"
PWD2=$(pwd)
echo "Path2 = ${PWD2}"

STR=$(ls)
echo ${STR}
${STR} #是将ls执行后的返回值放到shell下去执行
echo ls
echo pwd
echo haha

echo -e "========拼接./yang.sh 1 3 4 5中的参数=========================\n"
for var in $*
do
	str="${str}${var}"
done
echo ${str}

echo "========字符串拼接 2============="
str1="hello"
str2="world"
str3='$#$*'
str4="${str1}${str2}${str3}"
echo -e "${str4}\n"

echo "==========单引号，双引号================="
your_name='qinjx'
str="Hello, I know your are \"$your_name\"! \n"
echo -e ${str}

echo "=========再次输出Hello, I know your are "qinjx"!====="
echo -e "Hello, I know your are \"qinjx\"!\n"

echo "=========再次输出Hello, I know your are "qinjx"!====="
var='qinjx'
str="Hello, I know your are \"${var}\"!"
echo -e ${str}


echo "############## + - * / % -lt -gt == -eq -ne -ge -le###################"
a=10
b=20

c=`expr ${a} + ${b}`
echo "a + b = ${c}"

c=$(expr ${a} - ${b})
echo "a - b = ${c}"

c=`expr $a \* $b`
echo "a * b = $c"

c=`expr $a / $b`
echo "a / b = $c"

if [ $a == $b ]; then
	echo "a = b"
elif [ $a -gt $b ]; then
	echo "a > b"
else
	echo "a < b"
fi

if [ $# -lt 2 ]; then
	echo "too few params"
#	exit
fi
m=$1
n=$2
if [ $1 -eq $2 ]; then
	echo "m = n"
elif [ $1 -le $2 ]; then
	echo "m <= n"
elif [ $1 -ge $2 ]; then
	echo "m >= n"
elif [ $1 -lt $2 ]; then
	echo "m < n"
elif [ $1 -gt $2 ]; then
	echo "m > n"
fi


echo ================ # % ==========================
#	#代表删除从前往后最小匹配的内容
#
#	%代表删除从后往前最小匹配的内容
#!/bin/sh
dir=`pwd`
for i in $dir
do
	p1=${i#*/}
	p2=${i%/*}
done
echo -e "p1= $p1 \np2= $p2"
