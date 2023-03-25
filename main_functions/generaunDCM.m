function generaunDCM(folderout,folderin,folderroi,areasROI,A,B,C)

if ~exist(folderout,'dir')
    mkdir(folderout)
end

ruta0=cd;
nnamesROI=size(areasROI,2);
spm_mat_file=[folderin '\SPM.mat'];
load(fullfile(spm_mat_file));
for j=1:nnamesROI
    roi_mat_file=[folderroi '/' ls([folderroi '/*' areasROI{j} '_' '*.mat'])];
    load(fullfile(roi_mat_file),'xY');
    DCM.xY(j) = xY;
end


DCM.n = length(DCM.xY);      % number of regions
DCM.v = length(DCM.xY(1).u); % number of time points
    
    % Time series
    %--------------------------------------------------------------------------
    DCM.Y.dt  = SPM.xY.RT;
    DCM.Y.X0  = DCM.xY(1).X0;
    for iii = 1:DCM.n
        DCM.Y.y(:,iii)  = DCM.xY(iii).u;
        DCM.Y.name{iii} = DCM.xY(iii).name;
    end
    DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);
    % Experimental inputs
    %--------------------------------------------------------------------------
    DCM.U.dt   =  SPM.Sess(1).U(1).dt;
    DCM.U.name={'Up-reg'};
    DCM.U.u=SPM.Sess(1).U(1).u(33:end,1);
    
    % DCM parameters and options
    %--------------------------------------------------------------------------
    DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
    DCM.TE     = 0.04;
    DCM.options.nonlinear  = 0;
    DCM.options.two_state  = 0;
    DCM.options.stochastic = 0;
    DCM.options.nograph    = 1;
    DCM.options.centre     = 1;
    
    % Connectivity matrices for model
    %--------------------------------------------------------------------------
    %DCM.a=[1 1 1;
    %    1 1 1;
    %    1 1 1];
    DCM.a=A;
    DCM.b=B;
    %DCM.c=ones(nnamesROI,1);
    DCM.c=C;
    DCM.d=zeros(nnamesROI,nnamesROI,0);
    ind=strfind(folderroi,'\');
    palDCM=['DCM_' folderroi(ind(end)+1:end) '.mat'];
    save(fullfile(folderout,palDCM),'DCM');
    matlabbatch{1}.spm.dcm.fmri.estimate.dcmmat = {fullfile(folderout,palDCM)};
    spm_jobman('run',matlabbatch);
end













