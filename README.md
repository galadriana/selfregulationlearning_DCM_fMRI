# Selfregulationlearning_DCM_fMRI
This repository contains the code used to analyze differences in effective brain connectivity associated with neurofeedback training assessed with DCM fMRI. 

Please contact us at this e-mail address if you have any question: gabriela.vargas.ag@gmail.com.
Gabriela Vargas.


## Data to replicate outcomes

1) DCM Matfiles: 
- 1st family-inference : [model_space.mat](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/79abf78c3de63bfcd9ce25e67c64e82059f106ac/DCM_outputs/model_space/model_space_firstmodelspace.mat) and [BMS.mat](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/3fa77eaca6ae989cc6c86ba3ae75df6e4cd51cf4/DCM_outputs/model_space/BMS_firstmodelspace.mat).  
- 2nd family-inferernce: [model_space.mat](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/4faf38712ea941b8a99cf7462b21e62689c8e019/DCM_outputs/model_space/model_space_secondmodelspace.mat) and [BMS.mat](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/83ec4c6484bf785b5449beacd66290edfe3d4329/DCM_outputs/model_space/BMS_secondmodelspace.mat)
- Bayesian model average: [BMA.m](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/8c7a6d2a293332336f7b93b0f05e83d5699e034f/DCM_outputs/BMA/BMS_BMA_fromsecondmodelspace.mat)

2) Plots: 
- [Reproduce bars](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/f66852e29f986e07c8afe795ea7a3f52bd2c8457/reproduce_plots/generate_bars_modelevidence.m)
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

