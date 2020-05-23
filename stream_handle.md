# sed编辑器
sed编辑器根据命令来处理数据流,从命令行输入或者从一个文件输入.
+ 一次从输入中读取一行数据
+ 根据所提供的编辑器命令匹配数据
+ 按照命令修改流中的数据
+ 将新的数据输出STDOUT

***sed格式如下***<br />
*sed optiom script file*
+ -e script 处理输入时,将script中指定的命令添加到现有的命令中
+ -f file 在处理输入时,将file中指定的命名添加已有的命令中
+ -n 不产生输出,使用print命令完成输出

*s命令*
```shell
$ echo "this is a test" | sed 's/test/big test/'
this is a big test
```
**s命令会用斜线间指定的第二个文本字符串来替换第一个字符串的模式**

**也可以用于替换整个文本的内容,但这并不会修改文件内容**
***
*-e 指定多个命令*
```shell
$ cat datal.txt
the quick brown fox jumps over the lazy dog.
$ sed -e 's/brown/green; s/dog/cat/' datal.txt
the quick green fox jumps over the lazy cat.
```
**要注意命令之间用分号隔开,并且在命令末尾和分号之间不能有空格**
**也可以使用命令行分行输入,这样就不用分号**
```shell
$ sed -e '
> s/brown/green/
> s/fox/elephant/
> s/dog/cat/' datal.txt
the quick green elephant jumps over the lazy cat
```
***
*-f 从文件里读取命令*
```shell
$ cat script.sed
s/brown/green/
s/fox/elephant/
s/dog/cat/
$
$ sed -f script.sed datal.txt
the quick green elephant jumps over the lazy cat
```
**为了避免sed脚本和其他脚本搞混,一般用.sed作为后缀名**
***
# gawk程序
***gawk基本格式如下***<br />
*gawk options program file*
+ -F fs 指定行中划分数据的字段分隔符
+ -f file 从指定文件中读取程序
+ -v var=value 定义一个gawk程序的一个变量及其默认值
+ -mf N 指定要处理的数据文件中的最大字段数
+ -mr N 指定数据文件中的最大数据行数
+ -W keyword 指定gawk的兼容模式或警告等级

*从命令行赌球程序脚本*
```shell
$ gawk '{print "hello world"}'
```
**这个脚本启动后会处于等待状态(因为没有指定文件名),准备从STDIN活动数据,而且输入什么字符并按回车都只会打印hello world**
***
*使用数据字段变量*
+ $0代表整个文本行;
+ $1代表文本行的第一个数据字段;
+ $n代表文本行的第n个数据字段.

**每个数据字段是通过字段分隔符划分的.默认是空白字符**

**例子**
```shell
$ cat data2.txt
one line
two lines
three lines
$ gawk '{print $1}' data2.txt
one
two
three
```
**采用其他分隔符**
```shell
$ gawk -F: '{print $1}' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
[...]
```
***
**在程序脚本中使用多个命令**
```shell
$ echo "my name is rich"| gawk '{$4="cwd";print $0}'
my name is cwd
```
***
**从文件里读取程序**<br />
跟sed一样,运行将程序储存到文件中,然后再到命令行引用
```shell
$ cat script2.gawk
{print $1 "'s home directory is " $6}
$ gawk -F: -f script2.gawk /etc/passwd
[...]
```
**写在文件里的程序不需要特意添加单引号**

**多条指令示例**
```shell
$ cat script3.gawk
{
    text = "'s home directory is "
    print $1 text $6
}
$ gawk -F: -f script.gawk /etc/passwd
[...]
```
