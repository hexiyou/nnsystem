/* 
* @Author: Xiyou
* @Date:   2016-04-09 09:12:28
* @Last Modified by:   Xiyou
* @Last Modified time: 2016-04-11 11:53:58
*/
/**Ueditor配置项**/
'use strict';

function setDefaultContent(content){
	if(typeof EDITOR_OPTIONS!="undefined"){
		EDITOR_OPTIONS.initialContent = content;
	}
}

var editor_toolbar =  [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts'
        ]];

window.EDITOR_OPTIONS = new Object();

EDITOR_OPTIONS.toolbars = editor_toolbar; //工具栏配置
EDITOR_OPTIONS.lang = 'zh-cn';
EDITOR_OPTIONS.theme = 'default'; //风格主题
EDITOR_OPTIONS.initialContent = '';
EDITOR_OPTIONS.initialFrameHeight=400;
EDITOR_OPTIONS.readonly = false; //是否只读
EDITOR_OPTIONS.serverUrl = '';
EDITOR_OPTIONS.enableAutoSave = false; //是否自动保存