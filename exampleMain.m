%% -----------------   Developing Human   ---------------------------
target_region_acronym = { 'FroL', 'ParL','TemL','OccL','CgG','PHG','HiF','M','CbSS','PnSS','MOSS'};
target_region_colors = { 'ff0000','f00000','030000','000900','00c000','00ff00','00ff0f','00ffc0','00ffff','0fffff','c0ffff'};
colorRegions(target_region_acronym, target_region_colors, 'ontology/developing_human.csv', 'human_output.csv');

! python2.7 colorize.py --inputfile human_output.csv --outputfolder output_folder --svgdirectory developing_human_atlas_svg



%% -----------------  Human   ---------------------------
target_region_acronym = { 'FroL', 'ParL','TemL','OccL','CgG','PHG','HiF','M','CbSS','PnSS','MOSS'};
target_region_colors = { 'ff0000','f00000','030000','000900','00c000','00ff00','00ff0f','00ffc0','00ffff','0fffff','c0ffff'};
colorRegions(target_region_acronym, target_region_colors, 'ontology/brodmann_human.csv', 'brodmann_human_output.csv');

! python2.7 colorize.py --inputfile brodmann_human_output.csv --outputfolder output_folder --svgdirectory brodmann_human_atlas_svg

%% -----------------   Mouse   ---------------------------
target_region_acronym =  {'Isocortex','OLF','HIP','RHP','STR','PAL','HY','TH','MB','CB','P','MY'};
% target_region_colors = { 'ff0000','f00000','030000','000900','00c000','00ff00','00ff0f','00ffc0','00ffff','0fffff','c0ffff','0f0f0f'};

expressionLevel = 1:length(target_region_acronym);

hot_scale = hot;
hot_scale = hot_scale(10:end-2,:);
target_region_colors = mapValuesToColorScale(expressionLevel, hot_scale);
target_region_colors = colorTripletToHex(target_region_colors);
colorRegions(target_region_acronym, target_region_colors, 'ontology/mouse.csv','mouse_output.csv');

! python2.7 colorize.py --inputfile mouse_output.csv --svgfile mouse_atlas_svg/mouseSagittal.svg > Mouseoutput.svg
! python2.7 colorize.py --inputfile mouse_output.csv --svgdirectory mouse_atlas_svg --outputfolder output_folder

imagesc(expressionLevel);
colormap(hot_scale);
colorbar();

%% -------------------------------- Human regions ------------------------------------
% copy paste the ontology tree from: http://atlas.brain-map.org/atlas?atlas=138322605
% -----------------------------------------------------------------------------------
%
% NT  neural tube
% Br  brain
% F  forebrain (prosencephalon)
% FGM  gray matter of forebrain
% FWM  white matter of forebrain
% FV  ventricles of forebrain
% FSS  surface structures of forebrain
% CeS  cerebral sulci
% HaTr  habenular triangle
% InF  infundibular stalk
% CeG  cerebral gyri and lobules
% FroL  frontal lobe
% ParL  parietal lobe
% TemL  temporal lobe
% OccL  occipital lobe
% InL  insular lobe
% LimL  limbic lobe
% CgG  cingulate gyrus
% IsCPH  cingulo-parahippocampal isthmus
% SCG  subcallosal gyrus (parolfactory gyrus)
% PTG  paraterminal gyrus
% PHG  parahippocampal gyrus
% HiF  hippocampal gyrus (formation)
% MB  mammillary body
% APS  anterior perforated substance
% TPUJ  temporopolar uncal junction
% TN  tentorial notch
% TC  tuber cinereum
% LI  limen insula
% ASFV  adjoining structures of forebrain ventricles
% PrN  preoccipital notch
% M  midbrain (mesencephalon)
% MGM  gray matter of midbrain
% MWM  white matter of midbrain
% MV  ventricle of midbrain
% MSS  surface structures of midbrain
% H  hindbrain (rhombencephalon)
% HGM  gray matter of the hindbrain
% HWM  white matter of hindbrain
% HV  ventricles of hindbrain
% HSS  surface structures of hindbrain
% CbSS  surface structures of cerebellum
% PnSS  surface structures of pons
% MOSS  surface structures of medulla
% SpC  spinal cord












%% -------------------------------- Mouse regions ------------------------------------
% copy paste the ontology tree from: http://atlas.brain-map.org/atlas#atlas=2&plate=100883921
% -----------------------------------------------------------------------------------   
% grey  Basic cell groups and regions
%  CH  Cerebrum
%  CTX  Cerebral cortex
%  CTXpl  Cortical plate
%  Isocortex  Isocortex
%  FRP  Frontal pole, cerebral cortex
%  AI  Agranular insular area
%  PTLp  Posterior parietal association areas
%  VISC  Visceral area
%  PL  Prelimbic area
%  SS  Somatosensory areas
%  TEa  Temporal association areas
%  VIS  Visual areas
%  ACA  Anterior cingulate area
%  ORB  Orbital area
%  RSP  Retrosplenial area
%  PERI  Perirhinal area
%  GU  Gustatory areas
%  MO  Somatomotor areas
%  ILA  Infralimbic area
%  ECT  Ectorhinal area
%  AUD  Auditory areas
%  OLF  Olfactory areas
%  HPF  Hippocampal formation
%  CTXsp  Cortical subplate
%  6b  Layer 6b, isocortex
%  CLA  Claustrum
%  EP  Endopiriform nucleus
%  LA  Lateral amygdalar nucleus
%  BLA  Basolateral amygdalar nucleus
%  BMA  Basomedial amygdalar nucleus
%  PA  Posterior amygdalar nucleus
%  CNU  Cerebral nuclei
%  STR  Striatum
%  PAL  Pallidum
%  BS  Brain stem
%  IB  Interbrain
%  TH  Thalamus
%  HY  Hypothalamus
%  MB  Midbrain
%  HB  Hindbrain
%  P  Pons
%  MY  Medulla
%  CB  Cerebellum
%  CBX  Cerebellar cortex
%  VERM  Vermal regions
%  HEM  Hemispheric regions
%  CBXmo  Cerebellar cortex, molecular layer
%  CBXpu  Cerebellar cortex, Purkinje layer
%  CBXgr  Cerebellar cortex, granular layer
%  CBN  Cerebellar nuclei
%  FN  Fastigial nucleus
%  IP  Interposed nucleus
%  DN  Dentate nucleus
