# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
export PATH=/opt/tools/sratoolkit.2.8.2-1-centos_linux64/bin/:/usr/bin:$HOME/bin:$HOME/.local/bin:$HOME/usr/local/bin:$HOME/usr/local/bin/usr/bin/:$PATH:/zs32/home/klwang/softwares/samtools-1.3.1/bin/:/zs32/home/klwang/softwares/bcftools-1.3.1/bin:/zs32/home/klwang/softwares/htslib-1.3.2/bin/:/opt/tools/bowtie-1.2/

export LD_LIBRARY_PATH=/zs32/home/klwang/lib:$LD_LIBRARY_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/
export LIBRARY_PATH=$LIBRARY_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/

export hg19="/zs32/data-analysis/reflib/genomes/human_UCSC_hg19/chrAll.fasta"

#export PS1=\s-\v\$ #origin pattern
export PS1="\[\e[36;40m\]# \u@\h [\d \t]\[\e[00m\] \[\e[32;40m\]\w\[\e[00m\] \[\e[36;40m\]\$\[\e[00m\]\n"

export PYTHONPATH=""

##previous setting before use JiangYi's

#export PATH=/opt/tools/sratoolkit.2.8.2-1-centos_linux64/bin/:/usr/bin/:/zs32/home/klwang/.local/bin/:/zs32/home/klwang/usr/local/bin/:/zs32/home/klwang/softwares/samtools-1.3.1/bin/:/zs32/home/yjiang/softwares/Python-3.5.2/bin/:/opt/tools/sratoolkit.2.8.1-centos_linux64/bin/:$PATH:/opt/tools/Python-3.5.2/bin/:/opt/tools/bedtools2/bin/:/zs32/home/klwang/.aspera/connect/bin/:/zs32/home/klwang/softwares/bcftools-1.3.1/bin:/zs32/home/klwang/softwares/htslib-1.3.2/bin

#export PYTHONPATH=""

export PYTHONPATH=/zs32/home/klwang/usr/local/lib/python2.7/site-packages:$PYTHONPATH

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/

#export LIBRARY_PATH=$LIBRARY_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/

#export C_INCLUDE_PATH=$C_INCLUDE_PATH:/zs32/home/klwang/softwares/htslib-1.3.2/

export BLASTDB=$HOME/annotation/blastDB



# Added by Cluster Flow setup wizard
module load clusterflow


