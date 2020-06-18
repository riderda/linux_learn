# sed编辑器基础
## **更多替换选项**
+ **替换标记**
    ```shell
    $ cat data.txt
    this is a test of the test script
    $ sed 's/test/trial/' data.txt
    this is a trial of the test script
    ```
    替换命令在替换多行中的文本时能正常工作,但是默认情况下它只替换每行中出现的第一处..要让替换命令能够替换一行中不同地方出现的文本必须使用替换标记.<br />
    格式: *s/pattern/replacement/flags*
    + 数字,表明新文本将会替换第几处模式匹配的地方;
    + g,表明新文本会替换所有匹配的文本
    + p,表明原先行的内容要打印出来
    + w file.将替换结果写到文件中
    ```shell
    $ sed 's/test/trial/2 data.txt
    this is a test of the trial script
    ```
    结果就是sed替换每行第二次出现的匹配模式.g替换标记表示替换所有匹配到的所有地方
    ```shell
    $ sed 's/test/trial/g' data.txt
    this is a trial of the trial script
    ```
    p替换标记会打印与替换命令中指定的匹配模式的行.通常和sed的-n选项一起使用
    ```shell
    $ cat data.txt
    this is a test line
    $
    $ sed -n 's/test/trial/p data.txt
    this is a trial line
    ```
    -n选项将禁止sed编辑器输出,但p替换标记会输出修改过的行.
    <br />
    w替换标记会产生同样的输出,不过输出会保存到文件
    ```shell
    $ sed 's/test/trial/w test.txt' data.txt
    this is a trial line
    $ cat test.txt
    this is a trial line
    ```
    sed的正常输出是到STDOUT,而只有包含匹配模式的行才会保存到文件中
    ***
+ **替换字符** <br />
    有时候想匹配 "/" ,比如说用cshell替换passwd文件中的bash,那么需要这样写, "/" 需要转义
    ```shell
    $ sed 's/\/bin\/bash/\/bin\/csh/' /etc/passwd
    ```
    这样确实不方便阅读,所以sed允许选择其他字符作为替换命令中的字符串分隔符
    ```shell
    $ sed 's!/bin/bash!/bin/csh!' /etc/passwd
    ```
***
## **使用地址**
默认sed编辑器的命令会作用于文本数据的所有行,如果想作用于某些行,就需要使用行寻址.<br />
+ 以数字形式表示行区间
+ 以文本模式来过滤出行

两种形式都使用相同的格式来指定地址:
```
[address] command
```
也可以将多个命令分组
```
address{
    command1
    command2
    command3
}
```
***
**数字方式的行寻址**<br />
sed编辑器会将文本流的第一行编号为1,然后按顺序分配行号
```shell
$ sed '2s/dog/cat/' data.txt
$ sed '2,3s/dog/cat' data.txt
```
上面的两种方法分别是指定第二行和指定第二,三行,如果向指定从某行开始的所有行,可以使用特殊地址--美元符
```shell
$ sed '2,$s/dog/cat/' data.txt
```
***
**使用文本模式过滤器**<br />
sed编辑器允许指定文本模式来过滤出命令要作用的行,格式如下

***/pattern/command***<br />
举个例子
```shell
$ grep cwd /etc/passwd
cwd:z:1001:1001::/home/cwd:/bin/bash
$ 
$ sed 'cwd/s/bash/csh/' /etc/passwd
[...]
cwd:z:1001:1001::/home/cwd:/bin/csh
```
这个功能配合正则表达式来使用会更好
***
**命令组合**<br />
如果需要在单行上执行多条命令,可以使用花括号将命令组合在一起
```shell
$ cat data.txt
a b c d
a b c d
a b c d
$
$ sed '2{
> s/a/b/
> s/c/d/
> }' data.txt
a b c d
b b d d
a b c d
$
```
也可以使用美元符作用在一个范围
```shell
$ sed '2,${
> s/a/b/
> s/c/d/
> }' data.txt
a b c d
b b d d
b b d d
$ 
```
