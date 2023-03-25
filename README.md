# Selfregulationlearning_DCM_fMRI
This repository contains the code used to analyze differences in effective brain connectivity associated with neurofeedback training assessed with DCM fMRI. 

Please contact us at this e-mail address if you have any question: gabriela.vargas.ag@gmail.com.
Gabriela Vargas.

# Pipeline

1) Data: fMRI with contrasts
2) Generate masks
3) Generate VOI's
4) Build and Generate 1st set of DCM models specifying A and C parameters
5) Bayesian model comparison: RFX group and Family comparison (both use 'spm_run_dcm_bms(job)' )
7) Selection of winning model parameter configuration
6) Build and Generate 2nd set of DCM specifying B parameter
8) Bayesian model comparison: RFX group and Family comparison (both use 'spm_run_dcm_bms(job)' )
9) Bayesian model averaging 

## Data to compare and replicate outcomes

1) VOI's = data/roi

2) Build Networks: run MAMC 
- 1st set of DCMs: Model 1-model 14
- Compare models: Output = data/model_space.m
- Specify family and Compare  = [/BMS_3.2.mat](https://github.com/galadriana/selfregulationlearning_DCM_fMRI/blob/08dcc1d71c8ef2327110c749b85d1ff70f413186/DCM_files/matfiles_reproduce_article_results/BMS_3.2.mat)

3) Build Networks: run MAMCMB
- 2nd set of DCMs:  Model 1-model 13
- Compare models: Output = data/model_space_3.2.mat
- Specify family and Compare: Output = data/BMS_3.2.mat

4) Bayesian model average
- data/BMS.m

5) Parameter comparison
- data/parameter_output.m


