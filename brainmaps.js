
		function getURLParameter(name) {
		    return decodeURI(
			(RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
		    );
		}

		function setColor(structure_id, color)
		{
			var	svgContainer = document.getElementById("svgDrawing");
			var svgElement = getElementByAttribute('structure_id',structure_id,svgContainer);
			if (!(svgElement == null)) {
				svgElement.style.fill = color; 
			}
		}

		function getStructureColor(data,valuesDict, default_color)
		{// this function iterates over the regions in the data. For each region it checks if it has a value if not it takes the value from its parent

			var currentStructID,parentStructID,currentValue,parentValue;
			currentStructID = data[0]['id'];
			valuesDict[currentStructID] = default_color;

			for (var i=1; i< data.length; i++  ) 
			{
				currentStructID = data[i]['id'];
				parentStructID = data[i]['parent_structure_id'];
				if ( !(currentStructID in valuesDict) ){
  				   parentValue = valuesDict[parentStructID];
				   if (parentValue == null) {
				      valuesDict[currentStructID] = default_color;
				      }
			           else {
				      valuesDict[currentStructID] = parentValue;
				      }
				   }
				setColor(currentStructID, valuesDict[currentStructID] );
			}
		}

		function translateNumberToColor(values, minValue,maxValue,colormap)
		{
			var colorDict = {};
			var current_value , releventIndexInColorMap;
			var colormap_size = colormap.length;
			
			for(var index in values) {
			  current_value =  values[index];
			  releventIndexInColorMap = 	(values[index]	- minValue ) / 	 (maxValue - minValue) * (colormap_size -1); 
			  releventIndexInColorMap = Math.round(releventIndexInColorMap);
			  colorDict[index] =  colormap[releventIndexInColorMap];
			  colorDict[index] = '#' + colorDict[index];
			}
			return colorDict;
		}

		function getValuesAndMinMax(data)
		{
			var minValue = NaN;
			var maxValue = NaN;
			var valuesDict = {};
			var currentValue,currentStructID,numberValue;		
				
			for (var i=0; i< data.feed.entry.length; i++  ) 
			{
				currentValue = data.feed.entry[i]['gsx$value']['$t'];
				currentStructID = data.feed.entry[i]['gsx$id']['$t'];
				if (!(currentValue == '' ))				{
					valuesDict[currentStructID] = currentValue;
					numberValue = parseFloat(currentValue);
					if (isNaN(minValue)) {
						minValue = numberValue;
						}
					else {
						if (minValue > numberValue) {
							minValue = numberValue;
							}
					};

					if (isNaN(maxValue)) {
						maxValue = numberValue;
						}
					else {
						if (maxValue < numberValue) {
							maxValue = numberValue;
							}
					};
				}
			}

			return {
				'valuesDict' : valuesDict, 
				'minValue' : minValue, 
				'maxValue' : maxValue
			    };  
		}

		function getElementByAttribute(attr, value, root) {
			root = root || document.body;
			if (root.attributes) {
				if(root.hasAttribute(attr) && root.getAttribute(attr) == value) {
					return root;
				}
			}
			else {
					return null;
			}
	
			var children = root.childNodes, 
				element;
			for(var i = children.length; i--; ) {
				element = getElementByAttribute(attr, value, children[i]);
				if(element) {
				    return element;
				}
			}
			return null;
		}
		
		function changeSlice(numberOfImages) {
			var location = getURLParameter('location');
			location = parseFloat(location);
			var spreadsheetkey = getURLParameter('spreadsheetkey');
			var ontology = getURLParameter('ontology');
			location = location + numberOfImages;
			if (location < 1) {
				location = 1;
			}
			redirectToPage(location, spreadsheetkey,ontology);
		}

		function goToSlice() {
			var location = $('#currentLocation').val();
			location = parseFloat(location);
			var spreadsheetkey = getURLParameter('spreadsheetkey');
			var ontology = getURLParameter('ontology');
			if (location < 1) {
				location = 1;
			}
			redirectToPage(location, spreadsheetkey, ontology);
		}

		function redirectToPage(location, spreadsheetkey,ontology) {
			window.location.replace("?spreadsheetkey=" + spreadsheetkey+ "&location="  +location + "&ontology=" + ontology);
		}

		function encode_as_img_and_link(atlasData){
			var atlasName = atlasData["atlas"];
			var location = getURLParameter('location');
			 // Add some critical information
			 $("svg").attr({ version: '1.1' , xmlns:"http://www.w3.org/2000/svg"});

			 var svg = $("#page_div").html();
			 var b64 = Base64.encode(svg); // or use btoa if supported

			 // Works in Firefox 3.6 and Webit and possibly any browser which supports the data-uri
			 $("#buttonsAndStuff").append($("<a href-lang='image/svg+xml' href='data:image/svg+xml;base64,\n"+b64+"' title='file.svg' download='" + atlasName + "-" + location + ".svg'>Download</a>"));
		}
