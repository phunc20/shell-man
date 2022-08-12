## Diff btw Single Quotes and Double Quotes
For `echo` and `printf`, single quotes and double quotes are EXTREMELY different!
Indeed, try to run and inspect the content of `example.sh` in `$PWD`.


## Double Quotes in For Loop Thru Files
An example sometimes worths more than a thousand words.
```bash
root@e6cf3292adb8:/empty# ls
root@e6cf3292adb8:/empty# touch {a,b,c,d}.txt
root@e6cf3292adb8:/empty# ls
a.txt b.txt c.txt d.txt
root@e6cf3292adb8:/empty# for f in ./*.txt; do echo $f; done
./a.txt
./b.txt
./c.txt
./d.txt
root@e6cf3292adb8:/empty# for f in "./*.txt"; do echo $f; done
./a.txt ./b.txt ./c.txt ./d.txt
root@e6cf3292adb8:/empty# for f in './*.txt'; do echo $f; done
./a.txt ./b.txt ./c.txt ./d.txt
root@e6cf3292adb8:/empty# for f in ./*.txt; do echo $f; done | wc -l
       4
root@e6cf3292adb8:/empty# for f in "./*.txt"; do echo $f; done | wc -l
       1
```

This is Bash's behaviour; Zsh has a different behaviour, namely
```zsh
~/empty % for f in "./*.txt"; do echo $f; done        
./*.txt
```
