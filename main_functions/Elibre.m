function [re dif]=Elibre(folderout,redes,maskredes,sujetos,masksujetos,maskrun)
%palout={'Redes Rangha' 'Redes Wael'};
%sujetos={'DSALAZAR' 'FBURGOS' 'FDIAZ' 'FERICES' 'VNYMAN'};
R=['1' '2' '3' '4'];

for kred=1:size(maskredes,2)
    for j=1:size(masksujetos,2)
        for k=1:size(maskrun,2)
            suf=1;
            if maskrun(k)>4,suf=2;end
            r=mod(maskrun(k),4);
            if r==0,r=4;end
            err=0;
            palaux1=[sujetos{masksujetos(j)} num2str(suf) '_R' R(r)];
            file1=[folderout '/' redes{maskredes(kred)}  '\DCM_' palaux1 '.mat'];               
            load(file1)
            if err==0
                re(kred,j,k)=F;
            end
        end
    end
end

figure
a=mean(mean(re(:,:,:),2),3);
[ma pos]=min(a);
dif=a-a(pos,1);
ba=bar(dif);
ba.Parent.XTickLabel=redes;
ylabel('Dif Elibre');
end



