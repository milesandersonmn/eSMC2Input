for i in `ls *bam`; do
sampleName=`basename -s .prop-map.bam $i`
path="../GATKscripts/$sampleName.HaplotypeCaller.sh"
echo '#!/bin/bash' > $path
echo "#" >> $path
echo "#SBATCH --job-name=$sampleName" >> $path
echo "#SBATCH --output=$sampleName.o" >> $path
echo "#SBATCH --error=$sampleName.err" >> $path
echo "#SBATCH --nodes=1" >> $path
echo "#SBATCH --ntasks=1" >> $path
echo "#SBATCH --cpus-per-task=1" >> $path
echo "#SBATCH --mem=5G" >> $path
echo "" >> $path
echo "gatk --java-options "-Xmx4g" HaplotypeCaller -R ../../../S_chilense_reference_rename.fasta -I ../bamFiles/$i -O ../VCFs/$sampleName.Chr2.allBP.g.vcf.gz -ERC BP_RESOLUTION --output-mode EMIT_ALL_CONFIDENT_SITES -L Scaffold_12628_Chr2" >> $path
done
