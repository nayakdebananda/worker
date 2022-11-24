compiler=$1
filename=$2
inputfile=$3
outputfile=${filename%.*}

if [ "$compiler" == "g++" ]
then
    if   $(g++ -o $outputfile $filename)
    then
        ./$outputfile < $inputfile
    fi
exit
elif [ "$compiler" == "javac" ]
then
    if $(javac $filename) 
    then
        java $outputfile < $inputfile
    fi
    exit
fi

$compiler $filename < $inputfile

# will take 2 arguements
# 1--> compiler name
# 2--> source code
# 3--> input file contain required input to execut the program
# run command -> [extcute shell program file] g++ main.cpp input
#           or  sh main.sh g++ main.cpp input
