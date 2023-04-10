%% GENERAR DCM de Matriz B, usando las MA y MB previamente seleccionada 
% Siguiendo la estructura de DCM network, es necesario generar las matrices
% A,B y C. 
% Usando previamente el script generaDCMg2_selecMAMC.m se identifica la 
% estructura de conectividad (Matriz A) y nodo de input (Matriz C). Con 
% generaDCMg2_MB.m se prueban diferentes redes modificando la Matriz B,
% matriz de modulación. 
%--------------------------------------------------------------------------
%% Parallelized process
clear all
paralelo=1;
if paralelo==1
    numcores=feature('numcores');
    c=parcluster;
    c.NumWorkers=numcores*3;
end

%% Folders
folderdata='G:\Mi unidad\Prady';  %Carpeta con los datos de los sujetos 
folderROI='G:\Mi unidad\PROJECT_self_regulation_FEP_2019\5_2020\AAL3\roiALLsubj';
folderoutDCM='G:\Mi unidad\PROJECT_self_regulation_FEP_2019\5_2020\AAL3\DCM\MAMBMC'; % new folder
suj={'BGONZALEZ' 'CVELASQUEZ' 'DSALAZAR' 'FBURGOS' 'FDIAZ' 'FERICES' 'GGUTIERREZ' 'GSEPULVEDA' 'MDOMIC' 'MESPINOZA' 'MNAVARRETE' 'MULLOA' 'MVIDAL' 'PGAETE' 'RVASQUEZ' 'SBARRIENTOS' 'VNYMAN' 'WARAYA'} %18 SUJETOS

%% Define time structure of the experiment
R1=[1 2]; %día
R2=[1 2 3 4]; %runs

%% Network names
palout{1}='R1';
palout{2}='R2';
palout{3}='R3';
palout{4}='R4';
palout{5}='R5';
palout{6}='R6';
palout{7}='R7';
palout{8}='R8';
palout{9}='R9';
palout{10}='R10';
palout{11}='R11';
palout{12}='R12';
palout{13}='R13';

%% ROI Networks
areasROI{1}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{2}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{3}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{4}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{5}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{6}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{7}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{8}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{9}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{10}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{11}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{12}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};
areasROI{13}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};


%% Network architecture definition
% The directionality follow and 'inverse' reading, 
% it is from the columns to the raws
% The Matrix A and C are the same in the 13 models, the configuration of
% the Matrix B it is modified

A{1}= ones(4); A{1}(1,3)=0;A{1}(3,1)=0;
B{1}= zeros(4); B{1}(2,3)=1;   
C{1}= zeros(4,1); C{1}(3, 1)=1;
% %
A{2}= ones(4); A{2}(1,3)=0;A{2}(3,1)=0;
B{2}= zeros(4); B{2}(4,3)=1;
C{2}= zeros(4,1); C{2}(3, 1)=1;
% % 
A{3}= ones(4); A{3}(1,3)=0;A{3}(3,1)=0;
B{3}= zeros(4); B{3}(4,3)=1; B{3}(2,3)=1;
C{3}= zeros(4,1); C{3}(3, 1)=1;
% % 
A{4}= ones(4); A{4}(1,3)=0;A{4}(3,1)=0;
B{4}= zeros(4); B{4}(2,1)=1; 
C{4}= zeros(4,1); C{4}(3, 1)=1;
% % 
A{5}= ones(4); A{5}(1,3)=0;A{5}(3,1)=0;
B{5}= zeros(4); B{5}(4,1)=1; 
C{5}= zeros(4,1); C{5}(3, 1)=1;
% % 
A{6}= ones(4); A{6}(1,3)=0;A{6}(3,1)=0;
B{6}= zeros(4); B{6}(4,1)=1; B{6}(2,1)=1; 
C{6}= zeros(4,1); C{6}(3, 1)=1;
% % 
A{7}= ones(4); A{7}(1,3)=0;A{7}(3,1)=0;
B{7}= zeros(4); B{7}(4,2)=1;
C{7}= zeros(4,1); C{7}(3, 1)=1;
% % 
A{8}= ones(4); A{8}(1,3)=0;A{8}(3,1)=0;
B{8}= zeros(4); B{8}(4,2)=1; B{8}(3,2)=1;
C{8}= zeros(4,1); C{8}(3, 1)=1;
% % 
A{9}= ones(4); A{9}(1,3)=0;A{9}(3,1)=0;
B{9}= zeros(4); B{9}(1,2)=1; B{9}(4,2)=1;
C{9}= zeros(4,1); C{9}(3, 1)=1;
% % 
A{10}= ones(4); A{10}(1,3)=0;A{10}(3,1)=0;
B{10}= zeros(4); B{10}(3,2)=1;
C{10}= zeros(4,1); C{10}(3, 1)=1;
% % 
A{11}= ones(4); A{11}(1,3)=0;A{11}(3,1)=0;
B{11}= zeros(4); B{11}(1,2)=1; B{11}(3,2)=1; 
C{11}= zeros(4,1); C{11}(3, 1)=1;
% % 
A{12}= ones(4); A{12}(1,3)=0;A{12}(3,1)=0;
B{12}= zeros(4); B{12}(1,2)=1; 
C{12}= zeros(4,1); C{12}(3, 1)=1;
% %
A{13}= ones(4); A{13}(1,3)=0;A{13}(3,1)=0;
B{13}= zeros(4); B{13}(1,2)=1; B{13}(3,2)=1; B{13}(4,2)=1; 
C{13}= zeros(4,1); C{13}(3,1)=1;


%% DCM generation

for kred=1:length(palout)
 for ksuj=1:length(suj)
        for r1=1:length(R1)
            parfor r2=1:length(R2)
                    [palout{kred} '   ' suj{ksuj} num2str(r1) '_R' num2str(r2)]
                    folderoutDCM2=[folderoutDCM '\' palout{kred}];
                    folderdata2=[folderdata '\' suj{ksuj} num2str(r1) '/R' num2str(r2)];
                    folderROI2=[folderROI '\' suj{ksuj} num2str(r1) '_R' num2str(r2)];
                    generaunDCM(folderoutDCM2,folderdata2,folderROI2,areasROI{kred},A{kred},B{kred},C{kred});                  
            end
        end
 end
end


