grossStructures = {'Cerebral cortex'; 'Olfactory areas'; ...
                           'Hippocampal region'; 'Retrohippocampal region'; ...
                           'Striatum'; 'Pallidum'; ...
                           'Hypothalamus'; 'Thalamus'; 'Midbrain'; ...
                           'Cerebellum'; 'Pons'; 'Medulla'};
                       
                       
                       
                  {'Isocortex','OLF','HIP','RHP','STR','PAL','HY','TH','MB','CB','P','MY'};
target_region_acronym = { 'CTX', 'SS','TEa','AUD','OLF','HPF','STR','PAL','TH','HY','MB','CBX'};
% target_region_colors = { 'ff0000','f00000','030000','000900','00c000','00ff00','00ff0f','00ffc0','00ffff','0fffff','c0ffff','0f0f0f'};

expressionLevel = [ 14,1,4,4.5,3,11,3,8,2.3,6.4,3.4,5.5];
target_region_colors = mapValuesToColorScale(expressionLevel, hot);
target_region_colors = colorTripletToHex(target_region_colors);
colorRegions(target_region_acronym, target_region_colors, 'ontology/mouse.csv','mouse_output.csv');

! python2.7 colorize.py --inputfile mouse_output.csv --svgfile mouse_atlas_svg/mouseSagittal.svg > Mouseoutput.svg
! python2.7 colorize.py --inputfile mouse_output.csv --svgdirectory mouse_atlas_svg --outputfolder output_folder