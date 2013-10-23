function hex = colorTripletToHex(colorArray)
% example turn the hot colorscale to hex
% a = hot;
% hex_hot = colorTripletToHex(a);
%
% colorArray should be N x 3 array (RGB) - where each element is between
% zero and one.

    assert( size(colorArray,2) == 3, 'colorArray should be N x 3 array (RGB)');
    
    numElements = size(colorArray,1);
    hex = cell(numElements,1);

    for i =1:numElements
        hex{i} = rgb2hex( colorArray(i,:) );
    end

end
function hex = rgb2hex( rgb)

    rgb = rgb*255;
    hex1 = dec2hex(floor(rgb/16));
    hex2 = dec2hex(floor(mod(rgb,16)*16));
    hex = [hex1(1),hex2(1),hex1(2),hex2(2),hex1(3),hex2(3)];
end