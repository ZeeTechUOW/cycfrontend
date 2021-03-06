/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Deni Barasena
 */

function ProjectPanel(context) {
    this.context = context;

    this.update = function () {
        $("#scenePanel").height($("#scenesRow").height() - $("#scenePanelHeading").outerHeight());
        for (var k in this.context.editor.project.scenes) {
            var width  = $("#sceneDivThumb" + k).width();
            
            $("#sceneDivThumb" + k).height(width / this.context.editor.innerWidth * this.context.editor.innerHeight);
            
            $("#sceneThumbnailCanvas" + k).width(width);
            $("#sceneThumbnailCanvas" + k).height(width / this.context.editor.innerWidth * this.context.editor.innerHeight);
            
            if( !this.context.editor.internalPlayer.isRunning ) {
                this.context.editor.project.scenes[k].renderThumbnail(); 
            }
        }
        
    };

    this.updateSceneList = function () {
        var p = this;
        
        var elem = $("#scenePanel");

        var content = "";

        for (var k in p.context.editor.project.scenes) {
            p.context.editor.project.scenes[k].no = k;
            var b =  p.context.editor.project.scenes[k] === p.context.editor.activeScene;
            content +=
                    "                                <div class='row sceneNameDiv'><div id='sceneDivName" + k + "' class=\"sceneDiv\">\n" +
                    "                                    " + p.context.editor.project.scenes[k].sceneName + "\n" +
                    "                                </div></div>\n" +
                    "                                <div class='row noMargin'><div id='sceneDiv" + k + "' class=\"sceneDiv\">\n" +
                    "                                    <div id='sceneDivThumb" + k + "' class =\"sceneThumbGroup" + (b?" active": "") + " \" onclick=\"changeScene(" + k + ");\">\n" +
                    "                                        <canvas onmousedown='event.stopPropagation(); return false;' onmouseup='event.stopPropagation(); return false;' id=\"sceneThumbnailCanvas" + k + "\" onload=\"\">\n" +
                    "                                        </canvas>\n" +
                    "                                        <button class=\"btn btn-default btn-xs deleteSceneButton\" onclick=\"deleteScene(this, " + k + "); event.stopPropagation()\">\n" +
                    "                                            <span class='glyphicon deleteIcon'></span>\n" +
                    "                                        </button>\n" +
                    "                                    </div>\n" +
                    "                                </div></div>";
            
        }
        
        

        content +=
                "<button id=\"addSceneButton\" class=\"btn-lg btn-default\" onclick=\"addScene(this)\">" +
                "Add Scene" +
                "</button>";
        
        var s = elem.scrollTop();
        elem.html(content);
        
        elem.scrollTop(s);

        for (var k in p.context.editor.project.scenes) {
            var canvas = document.getElementById("sceneThumbnailCanvas" + k);
            canvas.style["pointer-events"] = "none";
            
            
            p.context.editor.project.scenes[k].updateThumbnailRenderer( canvas );
        };
    };
    
}