### Reputation-based-Priotization-and-Resource-Allocation-RPRA-for-vehicular-fog-computing
Its a MATLAB simulation for ensuring trust and security based on reputation for vehicular fog computing enabled smart infrastructure.
The graphs are plotted using origin software... Below is the step-wise procedure to describe the process...
### Step 1: Use the following mentioned MATLAB files to get the reputation values generated by methods that are RPRA, IDES, TES, and CAWB techniques... 
<br/> a) RPRA_Vs_IDES08July2024.m
<br/> b) TESAndRPRA25October2023.m and
<br/> c) RPRA_Vs_Contextbasedhealthcare24October2023.m
Note that at present the generated reputation values are one of the main the criteria, that we followed to rank the performance of each method...However, another necessary to mention point is the plotting of the ranking of the RPRA in comparison to other benchmark methods directly from the MATLAB data file, that are:
# a) Workspace_RPRA_TES_IDES_CBAWUpdated25October2023V6.mat, 
# b) RPRA_Vs_IDES18June2023.mat, and 
# c) TrustVFCAllMethodsWithoutLog24October2023.mat    
# These all matlab data files are stored in one single matlab data file that is named as "Reptation_VAluesRPRA_andAllMethods08July2024.mat"...In simple words, instead of running each matlab data file, "Reptation_VAluesRPRA_andAllMethods08July2024.mat" is enough to run and load the relevant parameters and their values...
# Step 2: After running the above files and loading the above mentioned matlab files or only loading the above mentioned matlab files, now is the turn to identify and store the parameters and their values in a separate excel sheet that we named as "Reptation_VAluesRPRA_andAllMethods08July2024V2". These parametes are:
# a) Parameter "yloggedreputTESAll" for reputation values for TES technique
# b) Parameter "AverageReputAllIDES" for reputation values for IDES  technique
# c) Parmeter "yLoggedAvergReputAll" for reputation values for RPRA technique
# d) Parameter "SaveTotalTrustArray" for reputation values for CBAW  technique.... Yes the name of "SaveTotalTrustArray" is a little not similar to its technique, that is , CBAW...
# Step 3: After getting the fresh values by running the mentioned matlab files again and loading the corresponding matlab data (source files) or only retrieving the old values (as that of ours), now is the time to use the excel sheet for final graph generation.. The excel sheet can be imported to 'origin' software project that we named as "ReputBasedPlotsRPRA_All08July2024.opju" and relevant plot is generated. In our case we named the plot as "AggregateReputationValuesAllMethods11October2023.pdf".
# Step 4: There is another version of simulation, and that is to authenticate the generated reputation values. This authentication and validation is done by running the considered scenario with all of the considered techniques one by one, for twenty times each. After getting the relevant data, we used the Probability Density Function (PDF) plot to ensure that the average value (response latency) is the one which is achieved by any of the simulated method. For achieving these PDF graphs, we developed another matlab based simulation, which are saved in the matlab files..
# a) RPRA_Vs_CBAW25October2023V2.m for "CBAW" technique
# b) RPRA_AllMethods25Oct2023_PDF_generationWorkspaceV1.m for "RPRA" technique
# c) CallingAndusingTES_IDESAndRPRA19October2023.m for "TES" method
# d) RPRA_AllMethods25Oct2023_PDF_generationWorkspaceV1 for "IDES" technique
# Step 4: For trust based reputation values comparison of RPRA and the 3 benchmark methods, TES, IDES, and CBAW, we need to use 'origin' software. It is because we only have to use the parameters and their values which are already generated during MATLAB simulation... To do the comparison, we varied the following parameters:
# a) Number of vehicular fog nodes (VFNs), designated by "N"
# b) Value of Slope, 
# c) Variation of utility values versus reputation values
To do this comparison, we are sharing the 'origin' software project file , named as "Trust_based_VFC_Comparison_with_parameters04December2023V6"...
# Step 5: Another parameter-variation based comparison of the proposed RPRA technique is by evaluating the maximum utilization in terms of percentage...We achieved this evaluation by ploting in 'origin' software. We share in the code section the project file by then name "Trust_based_ComparisonWithParameters_VFC_12August2023V5"...
# Step 6: Algorithmic run time is another and last comparison of RPRA with other 3 benchmark techniques...We used the origin software this time for ploting. The data is generated by the behavioural relationship of each technique in response to incoming load (the computation tasks).... We share the origin project file whic is by the name "RunTime_TEP_IDES_RPRA_CAWB_updated26October2023"...
