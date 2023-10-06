#!/bin/bash



input_a_series(){
echo "Please enter a series of at least 3 positive numbers: " 
read -ra series
echo ${series[@]}
}

sort_series(){
    for v in ${series[@]}; do 
        echo $v; 
    done | sort -n
    

}

maximum(){
   local max=0
    for (( i=0; i<${#series[@]}; i++ ));do
        if [[ ${series[i]} -gt max ]];then
        max=${series[i]}
        fi
    done
    echo $max
}

minimum(){
    local min=1000
    for (( i=0; i<${#series[@]}; i++ ));do
        if [[ ${series[i]} -lt min ]];then
        min=${series[$i]}
        fi
    done
    echo $min
}

avg(){
    local sum=0
    local size_of_series=${#series[@]}
    for(( i=0;i<${#series[@]};i++ ));do
        ((sum+=${series[i]}))
        
    done
    avg=$((sum/size_of_series))
    echo $avg
}

show_sizeof_series(){
echo ${#series[@]}

}
sum(){
    local sum=0
    for(( i=0;i<${#series[@]};i++ ));do
        ((sum+=${series[i]}))
    done
    echo $sum
    
}

is_positive(){
#check if the arguments are positive
local arr=$@
for i in ${arr[@]};do
    if  [[ $i -gt 0 ]];then
        #echo "positive"
        continue
    else
        #echo "negative"
        return 1
    fi
return 0
done
}


if [[ $# -ge 3 ]] && is_positive $@;then
    series=($@)
else
    echo "Please enter a series of at least 3 positive numbers: "
    read -ra series  # Read series interactively
fi
echo ${series[@]}

menu(){  
echo "====================================================="
echo a. Input a Series. \(Replace the current series\)
echo b. Display the series in the order it was entered.
echo c. Display the series in sorted order \(from low to high\).
echo d. Display the Max value of the series.
echo e. Display the Min value of the series.
echo f. Display the Average of the series.
echo g. Display the Number of elements in the series.
echo h. Display the Sum of the series.
echo i. Exit.
echo "====================================================="
}

while true;do
   
    menu
    read -p "please enter choice: " choice
    case  $choice in
    a) input_a_series ;;
    b) echo ${series[@]} ;;
    c) echo $(sort_series ${series[@]}) ;;
    d) echo $(maximum ${series[@]}) ;;
    e) echo $(minimum ${series[@]}) ;;
    f) echo $(avg ${series[@]});;
    g) echo $(show_sizeof_series ${series[@]});;
    h) echo $(sum ${series[@]});;
    i) exit 0 ;;
    *) echo "invalid choice" ;;
    esac
done





