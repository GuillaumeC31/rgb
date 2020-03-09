function JSearchBox(holderId, useRedirect, formWidth, resultsOnPage, formColor, buttonColor, formTextColor,
    backgroundColor, positionColor, textColor, sourceColor, fontFamily, fontSize, exampleColor, optionalArg, positionText, regionText)
{
	//for function arguments overloading
	var allArgumentsCount = 17;
	if (arguments.length == allArgumentsCount - 1) {
		regionText = positionText;
		positionText = optionalArg;
	}
    if(holderId) { this.holderId = holderId; }
    if(useRedirect) { this.redirect = useRedirect; } else { this.useRedirect = 0; }
    if(formWidth) { this.formWidth = formWidth; } else { this.formWidth = '480'; }
    if(resultsOnPage) { this.resultsOnPage = resultsOnPage; } else { this.resultsOnPage = 7; }
    if(formColor) { this.formColor = formColor; } else { this.formColor = '#6eb5e8'; }
    if(buttonColor) { this.buttonColor = buttonColor; } else { this.buttonColor = '#ffffff'; }
    if(formTextColor) { this.formTextColor = formTextColor; } else { this.formTextColor = '#555555'; }
    if(backgroundColor) { this.backgroundColor = backgroundColor; } else { this.backgroundColor = '#ffffff'; }
    if(positionColor) { this.positionColor = positionColor; } else { this.positionColor = '#0068ac'; }
    if(textColor) { this.textColor = textColor; } else { this.textColor = '#555555'; }
    if(sourceColor) { this.sourceColor = sourceColor; } else { this.sourceColor = '#5cb944'; }
    if(fontFamily) { this.fontFamily = fontFamily; } else { this.fontFamily = 'Arial'; }
    if(fontSize) { this.fontSize = fontSize; } else { this.fontSize = '12'; }
    if(exampleColor) { this.exampleColor = exampleColor; } else { this.exampleColor = '#b1b1b3' }
    if (positionText) { this.positionText = positionText; } else { this.positionText = ''; }
    if (regionText) { this.regionText = regionText; } else { this.regionText = ''; }
    
    this.srv_url = 'https://fr.jooble.org/';
    
    this.setItem = function(obj, url, e) {
		var pn = obj.parentNode;
		var fn = pn.firstChild;
		if(fn !== obj)
		{
			pn.removeChild(obj);
			pn.insertBefore(obj, fn);
			this.srv_url = url;
			this.menuClick(pn);
			if(e.stopPropagation)
				e.stopPropagation();
		}
    }
    
    
    this.menuClick = function(menuHolder) {
		if (menuHolder.style.height != 'auto')
			menuHolder.style.height = 'auto';
		else
			menuHolder.style.height = (menuHolder.firstChild.offsetHeight - 2) + 'px';
    }
    
    if(this.formWidth < 480) {
        var inputWidth = this.formWidth - 40;
        var repeat = 'repeat-y';
    } else {
        var inputWidth = (this.formWidth - 85) / 2 - 27;
        var repeat = 'no-repeat';
    }
    var less = Number(this.fontSize) - 1;
    var small = this.fontSize;
    var medium = Number(this.fontSize) + 1;
    var big = Number(this.fontSize) + 2;
    
    var btnPadding = (this.fontSize - 10);
    //rendering style tag to display beautiful search box
    var btnTxtColor = '#ffffff';
    if(this.buttonColor != '#ffffff')
		btnTxtColor = (parseInt(this.buttonColor.substr(3, 2), 16) > 128)?'#000000':'#ffffff';
    
    document.write('<style type="text/css">' +
                    'div.jsb_holder { width: ' + this.formWidth + 'px; ' +
                    'border: 1px solid ' + this.formColor + '; ' +
                    'background: ' + this.backgroundColor + '; ' +
                    'font-family: ' + this.fontFamily + '; ' + 
                    'font-size: ' + small + 'px; padding: 0px 0px 10px 0px; } ' + 
                    
                    'table.jsb_sr { padding: 4px 10px; margin-bottom: 10px; width: 100%; color: ' + 
                    this.formTextColor + '; font-size: ' + big + 'px; border-collapse: separate; }' +
                    
                    'table.jsb_sr td { color: ' + this.formTextColor + '; font-size: ' + big + 'px !important; font-family: ' + this.fontFamily + '; border: none !important; }' +
                    
                    '.jsb_sr td { padding: 0px; } div.jsb_rslt { padding: 4px 8px 4px 10px; color: ' + this.textColor + ';} ' +
                    
                    '.jsb_sr input.flat { border: 1px solid ' + this.formColor + '; width: ' + inputWidth + 'px !important; margin: 0 10px 0 0; ' +
                    'padding: ' + (btnPadding) + 'px 3px; } ' +
                    
                    '.jsb_rslt a.jsb_pos { font-size: ' + big + 'px; color: ' + this.positionColor + '; background: none;} ' +
                    
                    '.jsb_rslt p.jsb_desc { margin: 3px 0px; color: ' + this.textColor + '; font-size: ' + small + 'px !important;} ' +
                    
                    '.jsb_rslt p.jsb_src { margin: 1px 0px; color: ' + this.sourceColor + '; } ' + 
                    
                    'tr.jsb_sfh { font-size: ' + less + 'px !important;} ' +
                    
                    'div.jsb_paging { padding: 10px; font-size: ' + big + 'px; } ' +
                    
                    '.jsb_paging a.jsb_sel { color: ' + this.backgroundColor + '; background-color: ' + this.positionColor + '; ' +
                    'padding: 2px; border: solid 1px #c0c0c0; margin-right: 4px; } ' +
                    
                    '.jsb_paging a { color: ' + this.positionColor + '; padding: 2px; border: solid 1px #c0c0c0; margin-right: 4px; ' +
                    'text-decoration: none !important; background: none; } ' + 
                    
                    '.jsb_paging a:hover { color: ' + this.positionColor + '; padding: 2px; border: solid 1px #c0c0c0; ' + 
                    'margin-right: 4px; background-color: #ecefff; cursor: pointer; } ' +
                    
                    'div.jsb_btn { ' + ((this.buttonColor == '#ffffff') ? 'background: url(https://fr.jooble.org/css/images/button_back.png) repeat-x left top; ' : ('background-color:' + this.buttonColor + ';')) +
                    'color: ' + btnTxtColor + ';' +
                    'text-decoration: none; width: 85px; height: 23px; cursor: pointer; ' +
                    'font-size: ' + (big + 1) + 'px;' +
                    'line-height: 23px; ' +
                    'text-align: center; padding: ' + btnPadding + 'px 0; } ' +
                    
                    '.cgl { color: ' + this.textColor + ' !important; margin: 0px 10px 0px 10px; display: inherit; left: 10px; } ' +
                    'a.cgl { background: none; text-decoration: none; }' +
                    'a.cgl:hover { background: none; }' +
                    
                    '.fwb { } ' + 
                    
                    'div.jsb_ldng { background: url(https://fr.jooble.org/css/images/loading_blue.gif) no-repeat center center; width: 31px; height: 31px; margin: 0 auto; } ' +
                    '.jsb_sr .jsb_example { color: ' + this.exampleColor + '; font-size: ' + less + 'px !important; padding-right: 10px; } ' +
                    '.jsb_sr .jsb_example span { color: ' + this.exampleColor + '; cursor: pointer; font-size: ' + less + 'px !important; }' +
                    '.jsb_sr .jsb_example span:hover { text-decoration: underline; }' +
                    '.jsb_holder div.jmenu { cursor: pointer; height: 28px; overflow: hidden; border: 1px solid ' + this.formColor + '; ' +
                    'background: url(https://fr.jooble.org//css/images/arrow_d_blue.png) #ffffff no-repeat 5px 10px; margin: 0 20px 0 10px; padding: 0 5px 0 25px; }' +
                    '.jsb_holder div.jmenu div { padding: 0; font-size: 14px; line-height: 14px; margin-top: -2px; }' +
                    '.jsb_holder div.jmenu div a { display:inline-block;padding:10px 16px 7px 15px;margin-right:5px; }</style>'); 
    //////////////////////////////////////////////////////
        
    //rendering search box
    var tblSr = document.createElement('div');
    if(this.formWidth < 480) {
        tblSr.innerHTML = '<table id="sf" class="jsb_sr" cellpadding="0" cellspacing="0">' +
            '<tr><td class="fwb">quoi ?:</td></tr><tr><td><input class="flat" type="text" id="position" onkeypress="searchBox.click(event);" value="' + this.positionText + '"></td></tr>' +
            '<tr class="jsb_sfh"><td class="jsb_example"><span onclick="document.getElementById(\'position\').value = this.innerHTML;">graphiste</span></td></tr><tr><td class="fwb">où ?:</td></tr>' +
            '<tr><td><input onkeypress="searchBox.click(event);" class="flat" type="text" id="region" value="' + this.regionText + '"></td></tr>' +
            '<tr class="jsb_sfh"><td></td></tr><tr><td style="padding-top: 5px"><div id="jbtnsearch" class="jsb_btn" onclick="searchBox.search(' + this.resultsOnPage + 
            ',1);">Rechercher</div></td></tr></table>';
    } else {
        tblSr.innerHTML = '<table id="sf" class="jsb_sr" cellpadding="0" cellspacing="0"><tr><td class="fwb">quoi ?:</td><td class="fwb">où ?:</td><td></td></tr>' +
            '<tr><td><input class="flat" type="text" id="position" onkeypress="searchBox.click(event);" value="' + this.positionText + '"></td><td><input onkeypress="searchBox.click(event);" class="flat" ' +
            'type="text" id="region" value="' + this.regionText + '"></td><td><div id="jbtnsearch" class="jsb_btn" onclick="searchBox.search(' + this.resultsOnPage + ',1);">Rechercher</div></td></tr>' +
            '<tr class="jsb_sfh"><td class="jsb_example">exemple : <span onclick="document.getElementById(\'position\').value = this.innerHTML;">graphiste</span></td><td></td><td></td></table>';
    }
    
    var divResults = document.createElement('div');
    divResults.id = 'results';
    var holder = document.getElementById(holderId);
    var anchor = holder.firstChild;
    var menuHolder = document.getElementById('jsb_menu');
    if(menuHolder) menuHolder.style.height = (menuHolder.firstChild.offsetHeight - 2) + 'px';
    holder.insertBefore(tblSr, anchor);
    holder.insertBefore(divResults, anchor);
    //////////////////////////////////////////////////////
}

JSearchBox.prototype.search = function(rCnt, pg) {
    var holder = document.getElementById(this.holderId);
    var iKwd, iRgn;
    var inputs = holder.getElementsByTagName('input');
    for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].id == 'position') { iKwd = inputs[i]; }
        if(inputs[i].id == 'region') { iRgn = inputs[i]; }
        if(iKwd && iRgn) { break; }
    }
    
    var holder = document.getElementById(searchBox.holderId);
    var divs = holder.getElementsByTagName('div');
    var resultHolder;
    for(var i = 0; i < divs.length; i++) {
        if(divs[i].id == 'results') {
            var resultHolder = divs[i];
            break;
        }
    }

	
    if(this.redirect == 1)
    {
    	window.open(this.srv_url + "SearchBoxResult?kwd=" + encodeURI(iKwd.value) + "&rgn=" + encodeURI(iRgn.value) + "&redir=1", '_blank');
    }
    else
    {		
		resultHolder.innerHTML = '<div class="jsb_ldng"></div>';
	    
		var url = this.srv_url + "SearchBoxResult?kwd=" + encodeURI(iKwd.value) + "&rgn=" + encodeURI(iRgn.value) + "&rcnt=" + rCnt + "&pg=" + pg;
		if(this.formWidth < 480) { url += "&small=1"; }
		var script = document.createElement('script');
		script.id = 'sresult';
		script.setAttribute('src', url);
		var body = document.getElementsByTagName('body')[0];
		body.appendChild(script);
    }
}

JSearchBox.prototype.click = function(e) {
    var key;
    if(window.event) {
        key = window.event.keyCode;
    } else {
        key = e.which;
    }
    
    if(key == 13) {
        var btn = document.getElementById('jbtnsearch');
        btn.click();
        preventEnter(e);
        return false;
    }
    else { return true; }
}

function preventEnter(e) {
	var isIE = (navigator.userAgent.indexOf("MSIE") != -1);
	e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
	e.returnValue = false;
	if(isIE == false)
	{
		e.preventDefault();
	}
}