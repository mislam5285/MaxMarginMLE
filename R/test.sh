#!/bin/bash
now=$(date)
echo "$now"

omega=('0.01' '0.02' '0.03' '0.04' '0.05' '0.06' '0.07' '0.08' '0.09' '0.095')

#Rscript likelihood.R /home/bidisha/2017-hashtag-code/Data/hashtags/output/0.txt 
#/home/bidisha/2017-hashtag-code/Data/hashtags/output/rank0.txt 
#/home/bidisha/2017-hashtag-code/Data/hashtags/output/0name.txt 
#/home/bidisha/2017-hashtag-code/Data/hashtags/outputMat/
array=('0.05' '0.05' '0.05' '0.05' '0.05' '0.05' '0.05' '0.05' '0.05' '0.05')

for((x=1; x <= 5 ; x++))
do 
	for i in "${omega[@]}"
	do
	#f='../data/ICC/80/ICCWT20.mat' 
	
  		for j in "${omega[@]}"
    		do {
    			array[2*$x - 1]=$i
    			array[2*$x]=$j

    			#foo=('foo bar' 'foo baz' 'bar baz')
			params=$(printf ",%s" "${array[@]}")
			params=${params:1}

			echo $params
        		data='/home/bidisha/2017-hashtag-code/Data/hashtags/output/'
        		output='/home/bidisha/2017-hashtag-code/Data/hashtags/outputMat/'
        		now=$(date +"%T")
        		echo "Current time : $now", $f
        		Rscript main.R ${data}'0.txt' ${data}'rank0temp.txt' ${data}'0name.txt' ${output}${i}${j} $params 
        	   } ||
        	   {
                	echo "Error $i $j"
        	   }
        	#break
        	now=$(date +"%T")
        	echo "Current time : $now"
        
      		done
		#break
	done
	#break
done


now=$(date)
echo "$now"
