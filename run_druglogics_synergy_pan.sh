#!/bin/bash

# run this script from the root of the `druglogics-synergy@1.2.0` repository
# pan = Perturb All Nodes (every node in the model is inhibited by a different drug)

# CASCADE 1.0 (takes ~ 5 min, with parallel execution)

echo Starting druglogics_synergy execution for CASCADE 1.0
start=`date +%s`
java -cp target/synergy-1.2.0-jar-with-dependencies.jar eu.druglogics.synergy.Launcher --inputDir=cascade1.0_pan > /dev/null 2>&1
runtime=$(($(date +%s)-$start))
echo Execution Time for CASCADE 1.0: "$(($runtime / 60)) minutes"

# CASCADE 2.0 (takes ~ 12 days, non-parallel execution)
echo Starting druglogics_synergy execution for CASCADE 2.0
start=`date +%s`
java -cp target/synergy-1.2.0-jar-with-dependencies.jar eu.druglogics.synergy.Launcher --inputDir=cascade2.0_pan > /dev/null 2>&1
runtime=$(($(date +%s)-$start))
echo Execution Time for CASCADE 2.0: "$(($runtime / 60)) minutes"

