function generaunROI(folderout,folderSPM,foldermask,areasnom)

fileSPM=[folderSPM '/SPM.mat'];
cd(foldermask)
archivos=ls;
conta=1;
for k=1:length(areasnom)
    for j=1:size(archivos,1)
        ind=strfind(archivos(j,:),'_');
        fin=strfind(archivos(j,:),'.');
        if ~isempty(ind)
            ind2=ind(1);
            if strcmp(archivos(j,1:ind2-1),areasnom{k})
                areasnumj{k}=j;
                palmask{k}=[foldermask '/' archivos(j,(~isspace(archivos(j,:))))];
                names{k}=archivos(j,1:fin-1);
            end
        end
    end
end

for j=1:length(areasnom)
    % Start batch
    clear matlabbatch;
    matlabbatch{1}.spm.util.voi.spmmat  = cellstr(fileSPM);
    matlabbatch{1}.spm.util.voi.adjust  = 1;                    % Effects of interest contrast number
    matlabbatch{1}.spm.util.voi.session = 1;                    % Session index
    matlabbatch{1}.spm.util.voi.name    = names{j};               % VOI name
    % Define thresholded SPM for finding the subject's local peak response
    matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat      = {''};
    matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast    = 1;     % Index of contrast for choosing voxels
    matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc  = 'none';
    matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh      = 1;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.extent      = 0;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.mask ...
        = struct('contrast', {}, 'thresh', {}, 'mtype', {});
    matlabbatch{1}.spm.util.voi.roi{2}.mask.image={palmask{j}};
    matlabbatch{1}.spm.util.voi.roi{2}.mask.threshold=0.5;

    % Include voxels in the thresholded SPM (i1) and the mobile inner sphere (i3)
   
    matlabbatch{1}.spm.util.voi.expression = 'i1&i2';
    % Run the batch
    spm_jobman('run',matlabbatch);
    pause(3)
    if ~exist(folderout,'dir')
        mkdir(folderout);       
    end
    cd(folderout)
    %copyfile([folderSPM '\SPM.mat'])
    movefile([folderSPM '\VOI_' names{j} '_1.mat' ])
    movefile([folderSPM '\VOI_' names{j} '_mask.nii' ])
    movefile([folderSPM '\VOI_' names{j} '_1_eigen.nii' ])
end

