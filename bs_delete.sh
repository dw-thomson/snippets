#!/bin/bash
#SBATCH --job-name=basespace_delete
#SBATCH --output=bs_delete23May2024.log

# Resources allocation request parameters

#SBATCH --mail-user=daniel.thomson@sahmri.com
#SBATCH --mail-type=FAIL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6000       # this will request 96 Gb of memory
#SBATCH --time=3-00:00:00          # Run time in hh:mm:s


bs -c SAGC list projects --older-than=1y

for projectID in $(bs -c SAGC list projects --older-than=1y --terse)
do
        bs -c SAGC project get -i ${projectID}
        bs -c SAGC list biosample --project-id=${projectID}
                for biosampleID in $(bs -c SAGC list biosample --project-id=${projectID} --terse)
                do
                bs -c SAGC biosamples update --field-name=project --field-content=399819420 -i ${biosampleID}
                done
        bs -c SAGC project get -i ${projectID}
        bs -c SAGC delete project -i ${projectID}
done

bs -c SAGC list projects --older-than=1y

echo "finished"
