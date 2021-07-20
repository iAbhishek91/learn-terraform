#!/bin/bash

# This file scans through all the modules directories 
# and generate a YAML in STDOUT

#find all the .tf files
modules=$(ls -d ./../*/)


# Prints only one single line on stdout
# $1 string/line to be printed
# $2 indentation(number of space)
print_yaml_line() {
    line=$1
    indent=$2

    for (( i=0;i<$indent;i++)); do echo -n " "; done

    echo $line
}



print_yaml_line "modules:" 0



# loop through all modules
for module in $modules; do
    # translate module path to module name
    module_name=$(echo $module | tr -d [./])
    print_yaml_line "- $module_name:" 2
    
    # find all the files ends with .tf
    tfs=$(find $module -maxdepth 2 -regex '\./.*\.tf')
    
    # loop through all *.tf files and search for git sources
    for tf in $tfs; do
        # grep git sources only from each *.tf files
        sources=$(grep -E 'source[ ]*=[ ]*"git::' $tf)

        # if sources emply, continue with next iteration
        if [ -z "$sources" ]; then continue; fi

        print_yaml_line "- \"$tf\":" 4

        # loop through output of grep
        for src in $sources; do
            
            # exclude unnecessary components
            if [ $src != "source" ] && [ $src  != "=" ]
            then
                print_yaml_line "- $src" 6
            fi
        done
    done
done


