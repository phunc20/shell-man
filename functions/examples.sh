kp() {
    # `kp` stands for "kopieren", i.e. "copy" in German.
    # `kp` is similar to the command `cp`
    # For more info, cf. kp --help
    source_dir=""
    ext=""
    num=""
    num_default=10
    signature="Usage: kp source_dir ext target_dir [num]\nnum=$num_default by default"
    if [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
        echo $signature
        return 0
    elif [ "$#" -eq 4 ]; then
        source_dir=$1
        ext=$2
        target_dir=$3
        num_default=$4
    elif [ "$#" -eq 3 ]; then
        source_dir=$1
        ext=$2
        target_dir=$3
    else
        echo $signature
        return 1
    fi

    num_max=$(ls $source_dir | grep "\.$ext$" | wc -l)
    # Take the minimum
    num=$((num_default <= num_max ? num_default : num_max))
    if [ $num -eq 0 ]; then
        echo "$source_dir has 0 file of extension \`$ext\`"
        return 1
    fi

    ## Debugging lines
    #echo "source_dir = ${source_dir}"
    #echo "ext = ${ext}"
    #echo "num = ${num}"

    ## Repetitive way
    #echo $(ls $source_dir | grep "\.$ext$" | shuf | head -n $num | awk -v source_dir=${source_dir%/} '{print source_dir"/"$1 }')
    #cp $(ls $source_dir | grep "\.$ext$" | shuf | head -n $num | awk -v source_dir=${source_dir%/} '{print source_dir"/"$1 }') $target_dir

    # Less repetitive way
    files=$(ls $source_dir | grep "\.$ext$" | shuf | head -n $num | awk -v source_dir=${source_dir%/} '{print source_dir"/"$1 }' | tr "\n" " ")
    #echo $files
    # good and bad `cp` example usages
    # good: cp src/a.txt src/b.txt src/c.txt tgt/
    # bad: cp "src/a.txt src/b.txt src/c.txt" tgt/
    #cp "$files" $target_dir            # bad
    cp $(printf "$files") $target_dir  # good
}
