function generaunMask(folderout,fileatlas,areasnum,names)
ruta0=cd;
cd(folderout)
xA=spm_atlas('load',fileatlas);
for j=1:length(areasnum)
    pal=[];
    for k=1:length(areasnum{j})
        m=areasnum{j}(k);
        nom{k}=xA.labels(m).name;
        pal=[pal '_' num2str(m)];
    end
    mask=spm_atlas('mask',xA,nom);
    mask.fname=[names{j} pal '.nii'];
    mask=spm_write_vol(mask,mask.dat);       
end
cd(ruta0)
end
