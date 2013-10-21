### colorize.py
 
import csv
import bs4
import argparse
from os import listdir
from os.path import isfile, join


def colorSvgFile(svg_file, svg_dir):
    svg = open( join(svg_dir,svg_file) , 'r').read()
        
    # Load into Beautiful Soup
    soup = bs4.BeautifulSoup(svg, "html.parser")
     
    paths = soup.findAll('path')
    
    #path_style = 'font-size:12px;fill-rule:nonzero;stroke:#FFFFFF;stroke-opacity:1; stroke-width:0.1;stroke-miterlimit:4;stroke-dasharray:none;stroke-linecap:butt; marker-start:none;stroke-linejoin:bevel;fill:'
    path_style="fill-opacity:1;stroke-width:10;stroke:rgb(0,0,0);fill:"
     
    # Color the counties based on unemployment rate
    for p in paths:
        try:
            current_structure_id = p['structure_id']
            color = structure_values[current_structure_id]
            p['style'] = path_style + "#" + color
        except:
            continue
        
            
            
    return soup
        
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='create atlas svg files')
    parser.add_argument('-i' ,'--inputfile',  type=str, default=  'human_output.csv' )
    parser.add_argument('-d' ,'--svgdirectory',  type=str, default=  "human_atlas_svg" )
    parser.add_argument('-o' ,'--outputfolder',  type=str, default=  "output_folder" )
    parser.add_argument('-f' ,'--svgfile',  type=str, default=  'NO_FILE' )
    
    args = parser.parse_args()
    
    
    structure_values = {}
    min_value = 100; max_value = 0
    reader = csv.reader(open( args.inputfile ), delimiter=",")
    headerline = reader.next()
    for row in reader:
        try:
            structure_id = row[0]
            structure_values[structure_id] =  row[1]
        except:
            pass
     
     
    if args.svgfile == 'NO_FILE':
        svgfiles = [ f for f in listdir(args.svgdirectory) if isfile(join(args.svgdirectory,f)) ]
        for svg_file in svgfiles:
            soup = colorSvgFile(svg_file, args.svgdirectory)
            
            f1=open(join(args.outputfolder,svg_file), 'w+')
            f1.write(soup.prettify())
            print('%s ' % join(args.outputfolder,svg_file) )
    else:
        svg_file = args.svgfile
        soup = colorSvgFile(svg_file,'.')
        print soup.prettify()               
         
