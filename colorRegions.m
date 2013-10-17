function colorRegions(target_region_acronym, target_region_colors, ontologyCSV, outputFile)
% example of use:
%
%    target_region_acronym = { 'FroL', 'ParL','TemL','OccL','CgG','PHG','HiF','M','CbSS','PnSS','MOSS'};
%    target_region_colors = { 'ff0000','f00000','030000','000900','00c000','00ff00','00ff0f','00ffc0','00ffff','0fffff','c0ffff'};
%    colorRegions(target_region_acronym, target_region_colors, 'developing_human_ontology.csv', 'output.csv');
%
%    colorRegions(target_region_acronym, target_region_colors, 'mouse_ontology.csv','output.csv');
%
%


    [acronym,color_hex_triplet,graph_order,structure_id,structures_names,parent_structure_id,st_level,structure_id_path] = textread(ontologyCSV ,'%q %q %q %q %q %q %q %q', 'delimiter',',','headerlines',1);
    region_colors = repmat( {'f2f1f0'},size(structure_id) );



    for i = 1:length(structures_names)
        region_ind = strcmp(acronym{i}, target_region_acronym);
        if sum(region_ind) == 1
            region_colors{i} = target_region_colors{region_ind};
        else
            current_parent = parent_structure_id{i};
            if ~strcmp('', current_parent)
                parent = strcmp(parent_structure_id{i},  structure_id);
                region_colors{i} = region_colors{parent};
            end
        end
    end


    fid = fopen(outputFile,'w');
    fprintf(fid,'#strcture_id,color(hex)\n');
    for i =1:length(structures_names)
        fprintf(fid,'%s,%s\n',  structure_id{i}, region_colors{i} );
    end
    fclose(fid);

    % -------------------------------------------------------------------
    % run the command from the shell
    % python colorize.py --inputfile output.csv --outputfolder output_folder --svgfolder human_svg
    % python colorize.py --inputfile mouse_output.csv --svgfile mouseSagittal.svg > Mouseoutput.svg
    % then open the svg file in the browser
    % -------------------------------------------------------------------


   
end