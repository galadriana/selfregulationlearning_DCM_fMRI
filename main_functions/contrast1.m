%Suj 'POYARCE' con error
suj={'PGAETE' 'RVASQUEZ' 'SBARRIENTOS'}
%suj={'WARAYA'}
R1=[1 2];  % Sesiones
R2=[1 2 3 4];  % Run por sesion
folder='G:\Mi unidad\Prady\';
 for ksuj=1:length(suj)
        for r1=1:length(R1)
            for r2=1:length(R2)
                [ksuj r1 r2]
                pal=[folder suj{ksuj} num2str(R1(r1)) '\R'  num2str(R2(r2)) '\SPM.mat' ]
                matlabbatch{1}.spm.stats.con.spmmat = {pal};
                matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'up';
                matlabbatch{1}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0 0 0];
                matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'repl';
                matlabbatch{1}.spm.stats.con.delete = 0;
                spm_jobman('run',matlabbatch);
            end
        end
 end
 

