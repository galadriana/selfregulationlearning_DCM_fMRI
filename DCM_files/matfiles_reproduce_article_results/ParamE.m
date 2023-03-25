

%% Extraer parametros de cada DCM

%% Init
clear all

%%  
sujetos={'BGONZALEZ' 'CVELASQUEZ' 'DSALAZAR' 'FBURGOS' 'FDIAZ' 'FERICES' 'GGUTIERREZ' 'GSEPULVEDA' 'MDOMIC' 'MESPINOZA' 'MNAVARRETE' 'MULLOA' 'MVIDAL' 'PGAETE' 'RVASQUEZ' 'SBARRIENTOS' 'VNYMAN' 'WARAYA'}; %18 SUJETOS
masksuj= [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ]; %18 máscaras
foldata = 'G:\Mi unidad\PROJECT_self_regulation_FEP_2019\5_2020\AAL3\DCM\MAMBMC' ;%carpeta con la data 

%% MODELS
%modelos= {'R1' 'R2' 'R3' 'R4' 'R5' 'R6' 'R7' 'R8' 'R9' 'R10' 'R11' 'R12' 'R13'}
modelos= {'R3' 'R6' 'R9'};
sesiones={'1_R1' '1_R2' '1_R3' '1_R4' '2_R1' '2_R2' '2_R3' '2_R4'};
masksess= [ 1 1 1 1 1 1 1 1 ];
%% LOOP modelo - sujeto - sesion 

for imod=1:length(modelos)
    for isuj=1:length(sujetos(logical(masksuj)))
        for ises= 1:length(sesiones)
            folditer= [foldata '\'  modelos{imod}  '\DCM_' sujetos{isuj} sesiones{ises} '.mat'];
            load(folditer)
            paramB{imod, isuj, ises}= DCM.Ep.B(logical(DCM.b)); %Variable de almacenamiento (modelos x sujetos x sesiones)
            paramA{imod, isuj, ises}= DCM.Ep.A(logical(DCM.a)); %Variable de almacenamiento (modelos x sujetos x sesiones)
            %matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{isuj}(ises).dcmmat(imod,1) = {folditer};
            %matlabbatch{1}.spm.dcm.bms.inference.sess_dcm{isuji}.dcmmat(imod,1)= {folditer};
        end
    end
end
%% Save
save paramB paramB
save paramA paramA