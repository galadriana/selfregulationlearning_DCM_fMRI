# Selfregulationlearning_DCM_fMRI
This repository contains the code used to analyze differences in effective brain connectivity associated with neurofeedback training assessed with DCM fMRI. 

Please contact us at this e-mail address if you have any question: gabriela.vargas.ag@gmail.com.
Gabriela Vargas.


## Data to replicate outcomes

1) DCM Matfiles: 
- 1st family-inference : model_space.mat and BMS.mat
- 2nd family-inferernce: model_space.mat and BMS.mat
- Bayesian model average: BMA.m

2) Plots: 
- Reproduce bars
- Reproduce matrices



# Pipeline

1) Data: fMRI with contrasts
2) Generate masks: Here we use the following functions: generaunMask.m
3) Generate VOI's: .nii files. Here we used the following functions generaunROI.m
4) Build and Generate 1st set of DCM models specifying A and C parameters. Here we use the following functions generaunDCM.m
5) Bayesian model comparison: RFX group and Family comparison (both use the batch and the function 'spm_run_dcm_bms(job)' )
7) Selection of winning model parameter configuration by model evidence
6) Build and Generate 2nd set of DCM specifying B parameter. Here we use the same function generaunDCM.m
8) Bayesian model comparison: RFX group and Family comparison (both use the batch and the function 'spm_run_dcm_bms(job)' )
9) Bayesian model averaging (BMA). Here we use the function BMA.m by the batch.  

