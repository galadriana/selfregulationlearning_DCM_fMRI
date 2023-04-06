%% GENERAR DCM de Matriz A y C
% Siguiendo la estructura de DCM network, es necesario generar las matrices
% A,B y C. En este script se generan las estructuraz de la matriz A y C
%--------------------------------------------------------------------------
clear all
paralelo=1;
if paralelo==1
    numcores=feature('numcores');
    c=parcluster;
    c.NumWorkers=numcores*3;
end
%%%%%%%%%SOLO CORRER UNA VEZ PARA GENERAR MASCARAS%%%%%%%%%%%%%%%%%%%%%%%%%
folderdata='G:\Mi unidad\Prady';  %Carpeta con los datos de los sujetos 
folderROI='G:\Mi unidad\PROJECT_self_regulation_FEP_2019\5_2020\AAL3\roiALLsubj';
folderoutDCM='G:\Mi unidad\PROJECT_self_regulation_FEP_2019\5_2020\AAL3\DCM\MAMB';
suj={'BGONZALEZ' 'CVELASQUEZ' 'DSALAZAR' 'FBURGOS' 'FDIAZ' 'FERICES' 'GGUTIERREZ' 'GSEPULVEDA' 'MDOMIC' 'MESPINOZA' 'MNAVARRETE' 'MULLOA' 'MVIDAL' 'PGAETE' 'RVASQUEZ' 'SBARRIENTOS' 'VNYMAN' 'WARAYA'} %18 SUJETOS
R1=[1 2]; %día
R2=[1 2 3 4]; %runs


%% Nombre redes
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
palout{14}='R14';


%% ROI REDES
% se usan los datos previamente generados en generaROI.m y generaMask.m

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
areasROI{14}={'Striatum'  'ACC' 'Frontal' 'SMA-R'};

%% Definición de Matriz A y Matriz C
% The directionality follow and 'inverse' reading, it is from the columns to the raws.
% En este caso las redes [1 7] corresponden al input (Matriz C) en el nodo
% Frontal, y las redes [8 14] se modifica al input (Matriz C) al nodo
% Striatum

A{1}= ones(4); A{1}(1,3)=0;A{1}(3,1)=0;
B{1}= zeros(4);   
C{1}= zeros(4,1); C{1}(3, 1)=1;
% % 
A{2}= zeros(4); A{2}(2,3)=1;A{2}(3,2)=1;A{2}(1,2)=1;A{2}(2,1)=1;A{2}(1,4)=1;A{2}(4,1)=1;
B{2}= zeros(4); 
C{2}= zeros(4,1); C{2}(3, 1)=1;
% % 
A{3}= zeros(4); A{3}(1,2)=1;A{3}(2,1)=1; A{3}(2,3)=1;A{3}(3,2)=1;A{3}(2,4)=1;A{3}(4,2)=1;
B{3}= zeros(4);
C{3}= zeros(4,1); C{3}(3, 1)=1;
% % 
A{4}= zeros(4); A{4}(1,2)=1;A{4}(2,1)=1; A{4}(2,3)=1;A{4}(3,2)=1;A{4}(3,4)=1;A{4}(4,3)=1;
B{4}= zeros(4); 
C{4}= zeros(4,1); C{4}(3, 1)=1;
% % 
A{5}= zeros(4); A{5}(1,2)=1;A{5}(2,1)=1; A{5}(2,3)=1;A{5}(3,2)=1; A{5}(4,1)=1;A{5}(3,4)=1;
B{5}= zeros(4); 
C{5}= zeros(4,1); C{5}(3, 1)=1;
% % 
A{6}= zeros(4); A{6}(1,2)=1;A{6}(2,1)=1; A{6}(2,3)=1;A{6}(3,2)=1;A{6}(4,2)=1;A{6}(3,4)=1;
B{6}= zeros(4); 
C{6}= zeros(4,1); C{6}(3, 1)=1;
% % 
A{7}= zeros(4); A{7}(2,1)=1;A{7}(1,2)=1;A{7}(3,1)=1;A{7}(4,3)=1;A{7}(2,4)=1;A{7}(4,2)=1;
B{7}= zeros(4); 
C{7}= zeros(4,1); C{7}(3, 1)=1;
% % 
A{8}=A{1};
B{8}=B{1};
C{8}= zeros(4,1); C{8}(1, 1)=1;
% % 
A{9}=A{2};
B{9}=B{2};
C{9}= zeros(4,1); C{9}(1, 1)=1;
% % 
A{10}=A{3};
B{10}=B{3};
C{10}= zeros(4,1); C{10}(1, 1)=1;
% % 
A{11}=A{4};
B{11}=B{4};
C{11}= zeros(4,1); C{11}(1, 1)=1;
% % 
A{12}=A{5};
B{12}=B{5};
C{12}= zeros(4,1); C{12}(1, 1)=1;
% % 
A{13}=A{6};
B{13}=B{6};
C{13}= zeros(4,1); C{13}(1, 1)=1;
% % 
A{14}=A{7};
B{14}=B{7};
C{14}= zeros(4,1); C{14}(1, 1)=1;


%% Generación de los DCM's

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


